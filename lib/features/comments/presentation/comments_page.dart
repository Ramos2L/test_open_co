import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_open_co/core/utils/initials_name.dart';

import '../../../core/ui/helpers/error_helper.dart';
import '../../../core/ui/helpers/loader.dart';
import '../../../core/utils/random_colors.dart';
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
                    final post = state.commentModel[index];
                    return Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: RandomColors.getRandomColor(),
                                  radius: 16,
                                  child: Text(
                                    InitialsName.nameUser(name: post.email).toUpperCase(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(post.email),
                              ],
                            ),
                          ),
                          ListTile(title: Text(post.name), subtitle: Text(post.body)),
                          const SizedBox(height: 10),
                        ],
                      ),
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
