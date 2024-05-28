import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_open_co/core/services/client_response.dart';
import 'package:teste_open_co/features/posts/data/datasource/posts_datasource_impl.dart';
import 'package:teste_open_co/models/post_model.dart';

import '../../../../mocks.dart';

void main() {
  late ClientServiceMock clientService;
  late PostsDatasourceImpl datasource;

  setUp(() {
    clientService = ClientServiceMock();
    datasource = PostsDatasourceImpl(clientService: clientService);
  });

  group('PostsDatasourceImpl', () {
    final postsModelListMock = postsModelMock
        .map((posts) => PostModel.fromJson(posts))
        .toList();

    test('deve retornar uma lista de PostsModel quando a chamada for bem-sucedida', () async {
      when(() => clientService.get(any())).thenAnswer(
            (_) async => ClientResponse(data: postsModelMock, statusCode: 200),
      );

      final result = await datasource.getPosts();

      verify(() => clientService.get('/posts')).called(1);
      expect(result, equals(postsModelListMock));
    });

    test('deve lançar uma exceção quando a chamada falhar', () async {
      when(() => clientService.get(any())).thenAnswer(
            (_) async => ClientResponse(data: 'Erro', statusCode: 500),
      );
      expect(() => datasource.getPosts(), throwsA(isA<Exception>()));
      verify(() => clientService.get('/posts')).called(1);
    });
  });
}