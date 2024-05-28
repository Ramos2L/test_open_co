import 'package:dio/dio.dart';
import 'package:teste_open_co/core/services/client_response.dart';

import 'client_service.dart';

class DioService implements ClientService {
  final Dio _dio;

  DioService(this._dio);

  @override
  Future<ClientResponse> get(String url) async {
    try {
      final response = await _dio.get(url);
      return ClientResponse(data: response.data, statusCode: response.statusCode!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ClientResponse> post(String url, {dynamic data}) async {
    try {
      final response = await _dio.post(url, data: data);
      return ClientResponse(data: response.data, statusCode: response.statusCode!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ClientResponse> put(String url, {dynamic data}) async {
    try {
      final response = await _dio.put(url, data: data);
      return ClientResponse(data: response.data, statusCode: response.statusCode!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ClientResponse> delete(String url) async {
    try {
      final response = await _dio.delete(url);
      return ClientResponse(data: response.data, statusCode: response.statusCode!);
    } catch (e) {
      rethrow;
    }
  }
}