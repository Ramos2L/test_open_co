class EndpointsConsts {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static const String comments = '/comments';
  static const String posts = '/posts';

  static String getComments(int id) => '$baseUrl/$posts/$id/$comments';

  static String getPosts() => '$baseUrl/$posts';
}