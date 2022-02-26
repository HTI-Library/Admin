import 'package:dio/dio.dart';
import 'package:hti_library_admin/core/network/remote/dio_helper.dart';
import 'package:hti_library_admin/core/util/constants.dart';

import 'end_points.dart';
import 'local/cache_helper.dart';

abstract class Repository {
  Future<Response> login({
    required String email,
    required String password,
  });

  Future<Response> logOut();
}

class RepoImplementation extends Repository {
  final DioHelper dioHelper;
  final CacheHelper cacheHelper;

  RepoImplementation({
    required this.dioHelper,
    required this.cacheHelper,
  });

  @override
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    return await dioHelper.post(
      url: loginUrl,
      data: {
        'email': email,
        'password': password,
      },
    );
  }

  @override
  Future<Response> logOut() async {
    return await dioHelper.get(
      url: logOutUrl,
      token: token,
    );
  }
}
