import 'package:dio/dio.dart';

import '../../../../models/comments_model.dart';
import 'comments_datasource.dart';

///CRIAR ABSTRACAO PARA DIO
class CommentDatasourceImpl implements CommentDatasource {
  final Dio _dio;

  CommentDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<CommentModel>> getCommmet(int id) async {
    final response = await _dio.get('/posts/$id/comments');
    if (response.statusCode == 200) {
      return (response.data as List).map((comments) => CommentModel.fromJson(comments)).toList();
    } else {
      throw Exception('Erro ao buscar os comment');
    }
  }
}
