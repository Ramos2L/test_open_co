part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object?> get props => [];
}

class PostsListDataEvent extends PostsEvent {
  const PostsListDataEvent();

  @override
  List<Object?> get props => [];
}