import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/comments_bloc.dart';

class CommentsPage extends StatelessWidget {
  final int postId;

  const CommentsPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Comments')),
      body: BlocProvider(
        create: (context) => Modular.get<CommentsBloc>()..add(CommentsDataEvent(postId: postId)),
        child: BlocBuilder<CommentsBloc, CommentsState>(
          builder: (context, state) {
            if (state is CommentsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CommentsData) {
              return ListView.builder(
                itemCount: state.commentModel.length,
                itemBuilder: (context, index) {
                  final post = state.commentModel[index];
                  return ListTile(
                    title: Text(post.name),
                    subtitle: Text(post.body),
                  );
                },
              );
            } else if (state is CommentsError) {
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
