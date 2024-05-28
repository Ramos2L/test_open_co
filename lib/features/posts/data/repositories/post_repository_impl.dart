import 'package:teste_open_co/features/posts/data/repositories/post_repository.dart';

import '../../../../models/post_model.dart';
import '../datasource/posts_datasource.dart';

class PostRepositoryImpl implements PostRepository {
  final PostsDatasource _postsDatasource;

  PostRepositoryImpl({required PostsDatasource postsDatasource}) : _postsDatasource = postsDatasource;

  @override
  Future<List<PostModel>> getPosts() async {
    return await _postsDatasource.getPosts();
  }
}
