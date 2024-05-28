import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_open_co/features/posts/bloc/posts_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: BlocProvider(
        create: (context) => Modular.get<PostsBloc>()..add(const PostsListDataEvent()),
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is PostsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PostsData) {
              return ListView.builder(
                itemCount: state.postModel.length,
                itemBuilder: (context, index) {
                  final post = state.postModel[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                    onTap: () {
                      Modular.to.pushNamed('/comments/${post.userId}');
                    },
                  );
                },
              );
            } else if (state is PostsError) {
              return Center(child: Text(state.error));
            } else {
              return Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }
}
