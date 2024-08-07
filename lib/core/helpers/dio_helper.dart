import 'package:dio/dio.dart';
import 'package:todo_workshop/core/helpers/cache_helper.dart';
import 'package:todo_workshop/core/network/api_constants.dart';

class DioHelper {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.apiBaseUrl,
      headers: {
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
      },
    ),
  );

  Future<Response> post(String path, Map<String, dynamic> data) async {
    try {
      return await dio.post(path, data: data);
    } on DioException catch (e) {
      return e.response!;
    }
  }

  Future<Response> get(String path) async {
    try {
      return await dio.get(path);
    } on DioException catch (e) {
      return e.response!;
    }
  }

  Future<Response> patch(String path, Map<String, dynamic> data) async {
    try {
      return await dio.patch(path, data: data);
    } on DioException catch (e) {
      return e.response!;
    }
  }

  Future<Response> delete(String path) async {
    try {
      return await dio.delete(path);
    } on DioException catch (e) {
      return e.response!;
    }
  }
}
