import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teste_open_co/core/utils/random_images.dart';
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
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListView.builder(
                  itemCount: state.postModel.length,
                  itemBuilder: (context, index) {
                    final post = state.postModel[index];
                    return Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            RandomImages.images(),
                            height: 160,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  post.title,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.grey[800],
                                  ),
                                ),
                                Container(height: 10),
                                Text(
                                  post.title,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    const Spacer(),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.transparent,
                                      ),
                                      child: const Text(
                                        "EXPLORE",
                                        style: TextStyle(color: Colors.lightGreen),
                                      ),
                                      onPressed: () =>
                                          Modular.to.pushNamed('/comments/${post.userId}'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(height: 5),
                        ],
                      ),
                    );
                  },
                ),
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
