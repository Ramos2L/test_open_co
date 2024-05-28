part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object?> get props => [];
}

class PostsInitial extends PostsState {
  const PostsInitial();

  @override
  List<Object?> get props => [];
}

class PostsLoading extends PostsState {
  const PostsLoading();

  @override
  List<Object?> get props => [];
}

class PostsError extends PostsState {
  final String error;
  const PostsError(this.error);

  @override
  List<Object?> get props => [error];
}

class PostsData extends PostsState {
  final List<PostModel> postModel;
  const PostsData({required this.postModel});

  @override
  List<Object?> get props => [postModel];
}