import 'package:teste_open_co/core/services/client_service.dart';

import '../../../../models/comments_model.dart';
import 'comments_datasource.dart';

class CommentDatasourceImpl implements CommentDatasource {
  final ClientService _clientService;

  CommentDatasourceImpl({required ClientService clientService}) : _clientService = clientService;

  @override
  Future<List<CommentModel>> getCommmet(int id) async {
    final response = await _clientService.get('/posts/$id/comments');
    if (response.statusCode == 200) {
      return (response.data as List).map((comments) => CommentModel.fromJson(comments)).toList();
    } else {
      throw Exception('Erro ao buscar os comment');
    }
  }
}
