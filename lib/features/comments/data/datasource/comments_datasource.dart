import 'package:dio/dio.dart';

import '../../../../models/comments_model.dart';

class CommentDatasource {
  final Dio _dio;

  CommentDatasource({required Dio dio}) : _dio = dio;

  Future<List<CommentModel>> getCommmet(int id) async {
    final response = await _dio.get('/posts/$id/comments');
    if (response.statusCode == 200) {
      return (response.data as List).map((comments) => CommentModel.fromJson(comments)).toList();
    } else {
      throw Exception('Erro ao buscar os comment');
    }
  }
}
