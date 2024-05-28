part of 'comments_bloc.dart';

abstract class CommentsState extends Equatable {
  const CommentsState();

  @override
  List<Object?> get props => [];
}

class CommentsInitial extends CommentsState {
  const CommentsInitial();

  @override
  List<Object?> get props => [];
}

class CommentsLoading extends CommentsState {
  const CommentsLoading();

  @override
  List<Object?> get props => [];
}

class CommentsError extends CommentsState {
  final String error;
  const CommentsError(this.error);

  @override
  List<Object?> get props => [error];
}

class CommentsData extends CommentsState {
  final List<CommentModel> commentModel;
  const CommentsData({required this.commentModel});

  @override
  List<Object?> get props => [commentModel];
}