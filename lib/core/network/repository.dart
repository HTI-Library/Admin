import 'package:dio/dio.dart';
import 'package:hti_library_admin/core/network/remote/dio_helper.dart';

import 'end_points.dart';
import 'local/cache_helper.dart';

abstract class Repository {
  Future<Response> getAllUsersRepo();

  Future<Response> createUserRepo({
    required String email,
    required String name,
    required String password,
  });

  Future<Response> deleteUserRepo({
    required String uId,
  });

  Future<Response> getAllBooksRepo({
    required int page,
  });

  Future<Response> deleteBookRepo({
    required String bookId,
  });
}

class RepoImplementation extends Repository {
  final DioHelper dioHelper;
  final CacheHelper cacheHelper;

  RepoImplementation({
    required this.dioHelper,
    required this.cacheHelper,
  });

  @override
  Future<Response> getAllUsersRepo() async {
    return await dioHelper.get(
      url: getUsersUrl,
    );
  }

  @override
  Future<Response> createUserRepo({
    required String email,
    required String name,
    required String password,
  }) async {
    return await dioHelper.post(
      url: createUserUrl,
      data: {
        'email': email,
        'name': name,
        'password': password,
      },
    );
  }

  @override
  Future<Response> deleteUserRepo({
    required String uId,
  }) async {
    return await dioHelper.delete(
      url: deleteUserUrl,
      query: {
        'user_id': uId,
      },
    );
  }

  @override
  Future<Response> getAllBooksRepo({
    required int page,
  }) async {
    return await dioHelper.get(
      url: getAllBooksUrl,
      query: {
        'page': page,
      },
    );
  }

  @override
  Future<Response> deleteBookRepo({
    required String bookId,
  }) async {
    return await dioHelper.delete(
      url: deleteBookUrl,
      query: {
        'book_id': bookId,
      },
    );
  }
}
