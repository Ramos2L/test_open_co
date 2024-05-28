import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_open_co/core/services/client_response.dart';
import 'package:teste_open_co/features/comments/data/datasource/comments_datasource_impl.dart';
import 'package:teste_open_co/models/comments_model.dart';

import '../../../../mocks.dart';

void main() {
  late ClientServiceMock clientService;
  late CommentDatasourceImpl datasource;

  setUp(() {
    clientService = ClientServiceMock();
    datasource = CommentDatasourceImpl(clientService: clientService);
  });

  group('CommentDatasourceImpl', () {
    final commentModelListMock = commentModelMock
        .map((comment) => CommentModel.fromJson(comment))
        .toList();

    test('deve retornar uma lista de CommentModel quando a chamada for bem-sucedida', () async {
      when(() => clientService.get(any())).thenAnswer(
            (_) async => ClientResponse(data: commentModelMock, statusCode: 200),
      );

      final result = await datasource.getCommmet(1);

      verify(() => clientService.get('/posts/1/comments')).called(1);
      expect(result, equals(commentModelListMock));
    });

    test('deve lançar uma exceção quando a chamada falhar', () async {
      when(() => clientService.get(any())).thenAnswer(
            (_) async => ClientResponse(data: 'Erro', statusCode: 500),
      );
      expect(() => datasource.getCommmet(1), throwsA(isA<Exception>()));
      verify(() => clientService.get('/posts/1/comments')).called(1);
    });
  });
}