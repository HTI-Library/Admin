import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hti_library_admin/core/error/exceptions.dart';

import '../end_points.dart';

abstract class DioHelper {
  Future<dynamic> post({
    required String url,
    dynamic data,
    String? token,
  });

  Future<dynamic> get({
    required String url,
    dynamic query,
    String? token,
  });

  Future<dynamic> delete({
    required String url,
    dynamic query,
    String? token,
  });
}

class DioImpl extends DioHelper {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ),
  );

  @override
  Future post({
    required String url,
    dynamic data,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token'
    };

    if (url.contains('??')) {
      url = url.replaceAll('??', '?');
    }
    print('URL => ${dio.options.baseUrl + url}');
    print('Header => ${dio.options.headers.toString()}');
    print('Body => $data');
    return await request(
      () async => await dio.post(url, data: data),
    );
  }

  @override
  Future get({required String url, query, String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token'
    };

    if (url.contains('??')) {
      url = url.replaceAll('??', '?');
    }
    print('URL => ${dio.options.baseUrl + url}');
    print('Header => ${dio.options.headers.toString()}');
    print('Body => $query');
    return await request(
      () async => await dio.get(url, queryParameters: query),
    );
  }

  @override
  Future delete({required String url, query, String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token'
    };

    if (url.contains('??')) {
      url = url.replaceAll('??', '?');
    }
    print('Body => $query');
    return await request(
      () async => await dio.delete(url, queryParameters: query),
    );
  }
}

extension on DioHelper {
  Future request(Future<Response> Function() request) async {
    try {
      final r = await request.call();
      print("Response => ${r.data}");

      return r;
    } on DioError catch (e) {
      print("Error => ${e.response!.data['error']}");

      throw ServerException(
        error: e.response!.data['error'],
        code: e.response!.statusCode!,
      );
    } catch (e) {
      throw Exception();
    }
  }
}
