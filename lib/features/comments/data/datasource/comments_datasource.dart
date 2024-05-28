import '../../../../models/comments_model.dart';

abstract class CommentDatasource {
  Future<List<CommentModel>> getCommmet(int id);
}
