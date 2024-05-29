part of 'comments_bloc.dart';

abstract class CommentsEvent extends Equatable {
  const CommentsEvent();

  @override
  List<Object?> get props => [];
}

class GetCommentsDataByPostIdEvent extends CommentsEvent {
  final int postId;
  const GetCommentsDataByPostIdEvent({required this.postId});

  @override
  List<Object?> get props => [postId];
}