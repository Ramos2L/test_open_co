import 'package:teste_open_co/features/posts/data/datasource/posts_datasource.dart';
import 'package:teste_open_co/models/post_model.dart';

import '../../../../core/constants/endpoints_const.dart';
import '../../../../core/services/client_service.dart';
import '../../../../core/utils/enums.dart';

class PostsDatasourceImpl implements PostsDatasource {
  final ClientService _clientService;

  PostsDatasourceImpl({required ClientService clientService}) : _clientService = clientService;

  @override
  Future<List<PostModel>> getPosts() async {
    final response = await _clientService.get(EndpointsConsts.getPosts());
    if (response.statusCode == StatusCode.ok.code) {
      return (response.data as List).map((post) => PostModel.fromJson(post)).toList();
    } else {
      throw Exception('Erro ao buscar os posts');
    }
  }
}
