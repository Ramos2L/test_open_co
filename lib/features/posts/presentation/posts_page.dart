import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_open_co/features/posts/bloc/posts_bloc.dart';
import 'package:teste_open_co/features/posts/presentation/widgets/card_widget.dart';

import '../../../core/ui/helpers/error_helper.dart';
import '../../../core/ui/helpers/loader.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts Open')),
      body: BlocProvider(
        create: (context) => Modular.get<PostsBloc>()..add(const PostsListDataEvent()),
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is PostsLoading) {
              return const Loader();
            } else if (state is PostsData) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListView.builder(
                  itemCount: state.postModel.length,
                  cacheExtent: 15,
                  itemBuilder: (context, index) {
                    final post = state.postModel[index];
                    return CardWidget(
                      title: post.title,
                      body: post.body,
                      onPressed: () => Modular.to.pushNamed('/comments/${post.userId}'),
                    );
                  },
                ),
              );
            } else if (state is PostsError) {
              return ErrorHelper(
                onPressedButton: () => Modular.get<PostsBloc>()..add(const PostsListDataEvent()),
              );
            }
            return ErrorHelper(
              message: 'Ops! Algo está errado, informe o suporte',
              onPressedButton: () => Modular.get<PostsBloc>()..add(const PostsListDataEvent()),
            );
          },
        ),
      ),
    );
  }
}
