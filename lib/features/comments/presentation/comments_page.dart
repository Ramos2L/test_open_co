import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_open_co/features/comments/presentation/widget/card_comments_widget.dart';

import '../../../core/ui/helpers/error_helper.dart';
import '../../../core/ui/helpers/loader.dart';
import '../bloc/comments_bloc.dart';

class CommentsPage extends StatelessWidget {
  final int postId;

  const CommentsPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => Modular.get<CommentsBloc>()
          ..add(
            GetCommentsDataByPostIdEvent(postId: postId),
          ),
        child: BlocBuilder<CommentsBloc, CommentsState>(
          builder: (context, state) {
            if (state is CommentsLoading) {
              return const Loader();
            } else if (state is CommentsData) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListView.builder(
                  itemCount: state.commentModel.length,
                  itemBuilder: (context, index) {
                    final comment = state.commentModel[index];
                    return CardCommentsWidget(
                      email: comment.email,
                      name: comment.name,
                      body: comment.body,
                    );
                  },
                ),
              );
            } else if (state is CommentsError) {
              return ErrorHelper(
                onPressedButton: () =>
                    Modular.get<CommentsBloc>()..add(GetCommentsDataByPostIdEvent(postId: postId)),
              );
            } else {
              return ErrorHelper(
                message: 'Ops! Algo está errado, informe o suporte',
                onPressedButton: () =>
                    Modular.get<CommentsBloc>()..add(GetCommentsDataByPostIdEvent(postId: postId)),
              );
            }
          },
        ),
      ),
    );
  }
}
