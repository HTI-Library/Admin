import 'package:dio/dio.dart';
import 'package:hti_library_admin/core/network/remote/dio_helper.dart';

import 'end_points.dart';
import 'local/cache_helper.dart';

abstract class Repository {
  Future<Response> getAllUsersRepo();

  Future<Response> getAllLibrariesRepo();

  Future<Response> getBooksInBorrowRepo({
    required bool inBorrow,
    required int page,
  });

  Future<Response> getCatBooksRepo({
    required String category,
    required String library,
    required String type,
  });

  Future<Response> createUserRepo({
    required String email,
    required String name,
    required String password,
  });

  Future<Response> bookDetailsRepo({
    required String bookId,
  });

  Future<Response> createCategoryRepo({
    required String library,
    required String name,
    required String type,
  });

  Future<Response> startBorrowTimeRepo({
    required String borrowID,
  });

  Future<Response> returnBorrowRepo({
    required String borrowID,
  });

  Future<Response> createBookRepo({
    required String library,
    required String type,
    required String name,
    required num edition,
    required num rate,
    required String auther,
    required num pages,
    required String category,
    required num bookNum,
    required num amount,
    required String classificationNum,
    required String overview,
  });

  Future<Response> createLibraryRepo({
    required String code,
    required String name,
  });

  Future<Response> editLibraryRepo({
    required String code,
    required String name,
    required String libraryID,
  });

  Future<Response> createTypeRepo({
    required String library,
    required String name,
  });

  Future<Response> editTypeRepo({
    required String library,
    required String name,
    required String typeID,
  });


  Future<Response> editCatRepo({
    required String library,
    required String name,
    required String categoryID,
    required String type,
  });

  Future<Response> getAllTypesRepo({
    required String library,
  });

  Future<Response> deleteTypeRepo({
    required String typeID,
  });

  Future<Response> editBookRepo({
    required String library,
    required String type,
    required String name,
    required num edition,
    required num rate,
    required String auther,
    required num pages,
    required String category,
    required num bookNum,
    required num amount,
    required String classificationNum,
    required String overview,
    required String bookId,
  });

  Future<Response> getAllCategoriesRepo({
    required String library,
    required String type,
  });

  Future<Response> deleteCategoryRepo({
    required String catId,
  });

  Future<Response> deleteUserRepo({
    required String uId,
  });

  Future<Response> deleteLibraryRepo({
    required String library,
  });

  Future<Response> searchRepo({
    required String word,
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

  @override
  Future<Response> getAllCategoriesRepo({
    required String library,
    required String type,
  }) async {
    return await dioHelper.get(
      url: getAllCategoriesUrl,
      query: {
        'library': library,
        'type': type,
      },
    );
  }

  @override
  Future<Response> createBookRepo({
    required String library,
    required String type,
    required String name,
    required num edition,
    required num rate,
    required String auther,
    required num pages,
    required String category,
    required num bookNum,
    required num amount,
    required String classificationNum,
    required String overview,
  }) async {
    // FormData staticData = FormData();
    List author = [
      {"name": "mina 1"}
    ];
    // String stringAuthor = author.toString();

    // staticData.fields.add(const MapEntry('library', 'a'));
    // staticData.fields.add(const MapEntry('type', 'b'));
    // staticData.fields.add(const MapEntry('category', 'category1'));
    // staticData.fields.add(const MapEntry('name', 'name form'));
    // staticData.fields.add(const MapEntry('amount', '12'));
    // staticData.fields.add(const MapEntry('overview', 'test over view text'));
    // staticData.fields.add(MapEntry('auther', stringAuthor));
    // staticData.fields.add(const MapEntry('rate', '2.7'));
    // staticData.fields.add(const MapEntry('edition', '2'));
    // staticData.fields.add(const MapEntry('pages', '200'));
    // staticData.fields.add(const MapEntry('bookNum', '51'));
    // staticData.fields.add(const MapEntry('classificationNum', '251.2'));

    return await dioHelper.post(
      url: createBookUrl,
      data: FormData.fromMap({
        'name': 'name',
        'amount': 'amount',
        'overview': 'overview',
        'auther': [
          {"name": "mina 1"}
        ],
        'rate': 2.5,
        'edition': 1,
        'pages': 200,
        'library': 'aaa',
        'type': 'ssbs',
        'category': 'name',
        'bookNum': 117,
        'classificationNum': 620.2,
      }),
    );
  }

  @override
  Future<Response> editBookRepo({
    required String library,
    required String type,
    required String name,
    required num edition,
    required num rate,
    required String auther,
    required num pages,
    required String category,
    required num bookNum,
    required num amount,
    required String classificationNum,
    required String overview,
    required String bookId,
  }) async {
    return await dioHelper.post(
      url: editBookUrl,
      data: {
        'data': {
          'library': library,
          'type': type,
          'name': name,
          'rate': rate,
          'edition': edition,
          'auther': [
            {'name': auther}
          ],
          'pages': pages,
          'category': category,
          'bookNum': bookNum,
          'amount': amount,
          'overview': overview,
          'classificationNum': classificationNum,
        },
        'book_id': bookId,
      },
    );
  }

  @override
  Future<Response> searchRepo({
    required String word,
  }) async {
    return await dioHelper.get(
      url: searchUrl,
      query: {
        'word': word,
      },
    );
  }

  @override
  Future<Response> createLibraryRepo({
    required String code,
    required String name,
  }) async {

    return await dioHelper.post(
      url: createLibraryUrl,
      data: FormData.fromMap({
        'name': name,
        'code': code,
      }),
    );
  }

  @override
  Future<Response> editLibraryRepo({
    required String code,
    required String name,
    required String libraryID,
  }) async {
    return await dioHelper.post(
      url: editLibraryUrl,
      data: FormData.fromMap({
        'name': name,
        'code': code,
        'libraryID': libraryID,
      }),
    );
  }

  @override
  Future<Response> getAllLibrariesRepo() async {
    return await dioHelper.get(
      url: getAllLibrariesUrl,
    );
  }

  @override
  Future<Response> deleteLibraryRepo({
    required String library,
  }) async {
    return await dioHelper.delete(
      url: deleteLibraryUrl,
      query: {
        'libraryID': library,
      },
    );
  }

  @override
  Future<Response> createTypeRepo({
    required String library,
    required String name,
  }) async {
    return await dioHelper.post(
      url: createTypeUrl,
      data: FormData.fromMap({
        'name': name,
        'library': library,
      }),
    );
  }

  @override
  Future<Response> editTypeRepo({
    required String library,
    required String name,
    required String typeID,
  }) async {
    return await dioHelper.post(
      url: createTypeUrl,
      data: FormData.fromMap({
        'name': name,
        'library': library,
        'typeID': typeID,
      }),
    );
  }

  @override
  Future<Response> getAllTypesRepo({
    required String library,
  }) async {
    return await dioHelper.get(url: getAllTypesUrl, query: {
      'library': library,
      'page': 1,
    });
  }

  @override
  Future<Response> deleteTypeRepo({
    required String typeID,
  }) async {
    return await dioHelper.delete(
      url: deleteTypeUrl,
      query: {
        'typeID': typeID,
        'page': 1,
      },
    );
  }

  @override
  Future<Response> deleteCategoryRepo({
    required String catId,
  }) async {
    return await dioHelper.delete(
      url: deleteCategoryUrl,
      query: {
        'categoryID': catId,
      },
    );
  }

  @override
  Future<Response> createCategoryRepo({
    required String library,
    required String name,
    required String type,
  }) async {
    // FormData staticData = FormData();
    // staticData.fields.add(const MapEntry('library', 'a'));
    // staticData.fields.add(const MapEntry('type', 'b'));
    // staticData.fields.add(const MapEntry('name', 'category101'));

    return await dioHelper.post(
      url: createCategoryUrl,
      data: FormData.fromMap(
        {
          'library': library,
          'type': type,
          'name': name,
        },
      ),
    );
  }

  @override
  Future<Response> bookDetailsRepo({
    required String bookId,
  }) async {
    return await dioHelper.get(
      url: bookDetailsUrl,
      query: {
        'book_id': bookId,
      },
    );
  }

  @override
  Future<Response> getBooksInBorrowRepo({
    required bool inBorrow,
    required int page,
  }) async {
    return await dioHelper.get(
      url: booksInBorrowUrl,
      query: {
        'inBorrow': inBorrow,
        'page': page,
      },
    );
  }

  @override
  Future<Response> startBorrowTimeRepo({
    required String borrowID,
  }) async {
    return await dioHelper.post(
      url: '$startBorrowTimeUrl?borrowID=$borrowID',
    );
  }

  @override
  Future<Response> returnBorrowRepo({
    required String borrowID,
  }) async {
    return await dioHelper.post(
      url: '$returnBookUrl?borrow_id=$borrowID',
    );
  }

  @override
  Future<Response> getCatBooksRepo({
    required String category,
    required String library,
    required String type,
  }) async {
    return await dioHelper.get(
      url: deleteCategoryUrl,
      query: {
        'category': category,
        'library': library,
        'type': type,
      },
    );
  }


  @override
  Future<Response> editCatRepo({
    required String library,
    required String name,
    required String categoryID,
    required String type,
  }) async {
    return await dioHelper.post(
      url: editCat,
      data: FormData.fromMap(
        {
          'library': library,
          'type': type,
          'name': name,
          'categoryID': categoryID,
        },
      ),
    );
  }

}

