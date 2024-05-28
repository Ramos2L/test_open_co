import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_open_co/features/posts/data/repositories/post_repository_impl.dart';
import 'package:teste_open_co/models/post_model.dart';

import '../../../../mocks.dart';

void main() {
  late PostDatasourceMock postsDatasource;
  late PostRepositoryImpl repository;

  setUp(() {
    postsDatasource = PostDatasourceMock();
    repository = PostRepositoryImpl(postsDatasource: postsDatasource);
  });

  group('PostRepositoryImpl', () {
    final postsModelListMock =
    postsModelMock.map((post) => PostModel.fromJson(post)).toList();

    test('deve retornar uma lista de PostModel quando a chamada for bem-sucedida', () async {
      when(() => postsDatasource.getPosts()).thenAnswer(
        (_) async => postsModelListMock,
      );

      final result = await repository.getPosts();

      verify(() => postsDatasource.getPosts()).called(1);
      expect(result, equals(postsModelListMock));
    });

    test('deve lançar uma exceção quando a chamada ao datasource falhar', () async {
      when(() => postsDatasource.getPosts()).thenThrow(Exception());

      expect(() => repository.getPosts(), throwsA(isA<Exception>()));
      verify(() => postsDatasource.getPosts()).called(1);
    });
  });
}
