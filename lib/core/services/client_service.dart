import 'package:teste_open_co/core/services/client_response.dart';

abstract class ClientService {
  Future<ClientResponse> get(String url);
  Future<ClientResponse> post(String url, {dynamic data});
  Future<ClientResponse> put(String url, {dynamic data});
  Future<ClientResponse> delete(String url);
}