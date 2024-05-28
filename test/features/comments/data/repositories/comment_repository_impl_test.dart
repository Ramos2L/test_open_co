import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_open_co/features/comments/data/repositories/comment_repository_impl.dart';
import 'package:teste_open_co/models/comments_model.dart';

import '../../../../mocks.dart';

void main() {
  late CommentDatasourceMock commentDatasource;
  late CommentRepositoryImpl repository;

  setUp(() {
    commentDatasource = CommentDatasourceMock();
    repository = CommentRepositoryImpl(commentDatasource: commentDatasource);
  });

  group('CommentRepositoryImpl', () {
    final commentModelListMock =
        commentModelMock.map((comment) => CommentModel.fromJson(comment)).toList();

    test('deve retornar uma lista de CommentModel quando a chamada for bem-sucedida', () async {
      when(() => commentDatasource.getCommmet(any())).thenAnswer(
        (_) async => commentModelListMock,
      );

      final result = await repository.getComment(id: 1);

      verify(() => commentDatasource.getCommmet(1)).called(1);
      expect(result, equals(commentModelListMock));
    });

    test('deve lançar uma exceção quando a chamada ao datasource falhar', () async {
      when(() => commentDatasource.getCommmet(any())).thenThrow(Exception());

      expect(() => repository.getComment(id: 1), throwsA(isA<Exception>()));
      verify(() => commentDatasource.getCommmet(1)).called(1);
    });
  });
}
