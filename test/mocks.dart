import 'package:mocktail/mocktail.dart';
import 'package:teste_open_co/core/services/client_service.dart';
import 'package:teste_open_co/features/comments/data/datasource/comments_datasource.dart';
import 'package:teste_open_co/features/posts/data/datasource/posts_datasource.dart';

class ClientServiceMock extends Mock implements ClientService {}

class CommentDatasourceMock extends Mock implements CommentDatasource {}

class PostDatasourceMock extends Mock implements PostsDatasource {}

const commentModelMock = [
  {
    'postId': 1,
    'body': 'body',
    'id': 1,
    'name': 'name',
    'email': 'email',
  },
];

const postsModelMock = [{
  'userId': 1,
  'id': 1,
  'body': 'body',
  'title': 'title',
},];