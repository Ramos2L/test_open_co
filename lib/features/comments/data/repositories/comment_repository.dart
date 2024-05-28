import '../../../../models/comments_model.dart';
import '../datasource/comments_datasource_impl.dart';

abstract class CommentRepository {
  Future<List<CommentModel>> getComment({required int id});
}
