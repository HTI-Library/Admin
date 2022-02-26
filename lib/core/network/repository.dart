import 'package:dio/dio.dart';
import 'package:hti_library_admin/core/network/remote/dio_helper.dart';
import 'package:hti_library_admin/core/util/constants.dart';

import 'end_points.dart';
import 'local/cache_helper.dart';

abstract class Repository {
  // Future<Response> getCategories();
  //
  // Future<Response> getBrands();
  //
  // Future<Response> getAboutUs();
  //
  // Future<Response> getOrders();
  //
  // Future<Response> getUsedMarket();
  //
  // Future<Response> getCheckout();
  //
  // Future<Response> createCheckout({
  //   required String name,
  //   required String email,
  //   required String phone,
  //   required String government,
  //   required String city,
  //   required String streetName,
  //   required String buildingNumber,
  //   required String specialMarker,
  //   required String paymentMethod,
  //   required String shippingPrice,
  //   required String extraShipping,
  //   required String overweightPrice,
  //   required String promoCode,
  //   required String notes,
  //   required List<CreateCheckoutItemModel> items,
  // });
  //
  // Future<Response> newsLetter({
  //   required String email,
  // });
  //
  // Future<Response> getFAQs();
  //
  // Future<Response> contactUs({
  //   required String name,
  //   required String email,
  //   required String phone,
  //   required String subject,
  //   required String message,
  // });
  //
  // Future<Response> changePassword({
  //   required String oldPassword,
  //   required String newPassword,
  //   required String confirmPassword,
  // });
  //
  // Future<Response> getAllBrands();
  //
  // Future<Response> getBrandDetails({required int id});
  //
  // Future<Response> getUsedMarketCatDetails({required int id});
  //
  // Future<Response> getBlogDetails({required int id});
  //
  // Future<Response> getBlogs();
  //
  // Future<Response> getHome();
  //
  // Future<Response> getCategoryProducts({
  //   required int id,
  //   required int page,
  // });
  //
  // Future<Response> login({
  //   required String email,
  //   required String password,
  // });
  //
  // Future<Response> register({
  //   required String name,
  //   required String phone,
  //   required String email,
  //   required String password,
  //   required String confirmPassword,
  // });
  //
  // Future<Response> getWishList();
  //
  // Future<Response> getOrderDetails({required int id});
  //
  // Future<Response> addToWishList({
  //   required int productId,
  // });
  //
  // Future<Response> deleteFromWishList({
  //   required int productId,
  // });
  //
  // Future<Response> readNotification({
  //   required String notificationId,
  // });
  //
  // Future<Response> getProductDetails({
  //   required String slug,
  // });
  //
  // Future<Response> getAddress();
  //
  // Future<Response> getSearch({
  //   required String productName,
  //   int? categoryId,
  //    int? brandId,
  // });
  //
  // Future<Response> getMyAccount();
  //
  // Future<Response> updateAccount({
  //   required String name,
  //   required String email,
  //   required String phone,
  //   File? image,
  // });
  //
  // Future<Response> addAddress({
  //   required int governorate,
  //   required int city,
  //   required String street_name,
  //   required String building_number,
  //   required String special_marker,
  // });
  //
  // Future<Response> deleteAddress({
  //   required int addressId,
  // });
  //
  // Future<Response> getNotification();
  //
  // Future<Response> getCompares();
  //
  // Future<Response> addCompares({
  //   required int productId,
  // });
  //
  // Future<Response> usedMarketProduct({
  //   required int productId,
  // });
  //
  // Future<Response> addReview({
  //   required int productId,
  //   required double rating,
  //   required String review,
  // });
  //
  // Future<Response> removeCompare({
  //   required int compareId,
  // });

  Future<Response> getNotificationsRepo();

  Future<Response> login({
    required String email,
    required String password,
  });

  Future<Response> topBorrowRepo({
    required int page,
  });

  Future<Response> bookDetailsRepo({
    required String bookId,
  });

  Future<Response> categoriesRepo();

  Future<Response> categoryDetailsRepo({
    required String categoryName,
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

//   @override
//   Future<Response> getCategories() async {
//     return await dioHelper.get(
//       url: categories,
//     );
//   }
//
//   @override
//   Future<Response> getBrands() async {
//     return await dioHelper.get(
//       url: brands,
//     );
//   }
//
//   @override
//   Future<Response> getAllBrands() async {
//     return await dioHelper.get(
//       url: brands,
//     );
//   }
//
//   @override
//   Future<Response> getBlogs() async {
//     return await dioHelper.get(
//       url: blogs,
//     );
//   }
//
//   @override
//   Future<Response> getHome() async {
//     return await dioHelper.get(
//       url: homeData,
//     );
//   }
//
//   @override
//   Future<Response> getWishList() async {
//     return await dioHelper.get(
//       url: wishlist,
//       token: token,
//     );
//   }
//
//   @override
//   Future<Response> addToWishList({
//     required int productId,
//   }) async {
//     return await dioHelper.post(
//         url: addToWishlist, token: token, data: {'product_id': productId});
//   }
//
//   @override
//   Future<Response> newsLetter({
//     required String email,
//   }) async {
//     return await dioHelper.post(
//       url: newsletter,
//       data: {'email': email},
//     );
//   }
//
//   @override
//   Future<Response> contactUs({
//     required String name,
//     required String email,
//     required String phone,
//     required String subject,
//     required String message,
//   }) async {
//     return await dioHelper.post(
//       url: contacts,
//       data: {
//         'name': name,
//         'email': email,
//         'phone': phone,
//         'subject': subject,
//         'message': message,
//       },
//     );
//   }
//
//   @override
//   Future<Response> deleteFromWishList({
//     required int productId,
//   }) async {
//     return await dioHelper.delete(
//       url: '$deleteFromWishlist/$productId',
//       token: token,
//     );
//   }
//
//
//
//   @override
//   Future<Response> register({
//     required String name,
//     required String phone,
//     required String email,
//     required String password,
//     required String confirmPassword,
//   }) async {
//     return await dioHelper.post(
//       url: registerUrl,
//       data: {
//         'name': name,
//         'phone': phone,
//         'email': email,
//         'password': password,
//         'c_password': confirmPassword,
//       },
//     );
//   }
//
//   @override
//   Future<Response> getCategoryProducts({
//     required int id,
//     required int page,
//   }) async {
//     return await dioHelper.get(
//       url: '$category/$id',
//       query: {
//         'page': page,
//       },
//     );
//   }
//
//   @override
//   Future<Response> getProductDetails({
//     required String slug,
//   }) async {
//     return await dioHelper.get(
//       url: '$productDetails/$slug',
//     );
//   }
//
//   @override
//   Future<Response> getAddress() async {
//     return await dioHelper.get(url: address, token: token);
//   }
//
//   @override
//   Future<Response> getCheckout() async {
//     return await dioHelper.get(
//       url: checkout,
//       token: token,
//     );
//   }
//
//   @override
//   Future<Response> getBrandDetails({required int id}) async {
//     return await dioHelper.get(
//       url: '$brandsDetails$id',
//     );
//   }
//
//   @override
//   Future<Response> getUsedMarketCatDetails({required int id}) async {
//     return await dioHelper.get(
//       url: '$usedCategoryUrl$id',
//     );
//   }
//
//   @override
//   Future<Response> getBlogDetails({required int id}) async {
//     return await dioHelper.get(
//       url: '$blog$id',
//     );
//   }
//
//   @override
//   Future<Response> getSearch({
//     required String productName,
//      int? categoryId,
//      int? brandId,
//   }) async {
//     return await dioHelper.get(
//       url: search,
//       query: {
//         'product_name': productName,
//         'category_id': categoryId,
//         'brand_id': brandId,
//       },
//     );
//   }
//
//   @override
//   Future<Response> getMyAccount() async {
//     return await dioHelper.get(url: myAccount, token: token);
//   }
//
//   @override
//   Future<Response> updateAccount({
//     required String name,
//     required String email,
//     required String phone,
//     File? image,
//   }) async {
//     return await dioHelper.post(
//       url: updateProfile,
//       token: token,
//       data: FormData.fromMap(
//         {
//           'name': name,
//           'email': email,
//           'phone': phone,
//           if (image != null)
//             'image': await MultipartFile.fromFile(
//               image.path,
//               filename: Uri.file(image.path).pathSegments.last,
//             ),
//         },
//       ),
//     );
//   }
//
//   @override
//   Future<Response> addAddress({
//     required int governorate,
//     required int city,
//     required String street_name,
//     required String building_number,
//     required String special_marker,
//   }) async {
//     return await dioHelper.post(url: addShippingAddress, token: token, data: {
//       'governorate': governorate,
//       'city': city,
//       'street_name': street_name,
//       'building_number': building_number,
//       'special_marker': special_marker,
//     });
//   }
//
//   @override
//   Future<Response> deleteAddress({
//     required int addressId,
//   }) async {
//     return await dioHelper.delete(
//       url: '$deletingShippingAddress/$addressId',
//       token: token,
//     );
//   }
//
//   @override
//   Future<Response> getNotification() async {
//     return await dioHelper.get(
//       url: notification,
//       token: token,
//     );
//   }
//
//   @override
//   Future<Response> getCompares() async {
//     return await dioHelper.get(
//       url: compares,
//       token: token,
//     );
//   }
//
//   @override
//   Future<Response> addCompares({
//     required int productId,
//   }) async {
//     return await dioHelper.post(url: addToCompare, token: token, data: {
//       'product_id': productId,
//     });
//   }
//
//   @override
//   Future<Response> getAboutUs() async {
//     return await dioHelper.get(
//       url: aboutUs,
//     );
//   }
//
//   @override
//   Future<Response> getFAQs() async {
//     return await dioHelper.get(
//       url: faqs,
//     );
//   }
//
//   @override
//   Future<Response> getOrders() async {
//     return await dioHelper.get(
//       url: orders,
//       token: token,
//     );
//   }
//
//   @override
//   Future<Response> usedMarketProduct({
//     required int productId,
//   }) async {
//     return await dioHelper.get(
//       url: '$usedProduct$productId',
//     );
//   }
//
//   @override
//   Future<Response> getUsedMarket() async {
//     return await dioHelper.get(
//       url: usedMarketUrl,
//     );
//   }
//
//   @override
//   Future<Response> addReview({
//     required int productId,
//     required double rating,
//     required String review,
//   }) async {
//     return await dioHelper
//         .post(url: '$submitReview/$productId', token: token, data: {
//       'review': review,
//       'rating': rating,
//     });
//   }
//
//   @override
//   Future<Response> getOrderDetails({required int id}) async {
//     return await dioHelper.get(
//       url: '$order$id',
//       token: token,
//     );
//   }
//
//   @override
//   Future<Response> readNotification({required String notificationId}) async {
//     return await dioHelper.get(
//       url: '$readNotificationApi$notificationId',
//       token: token,
//     );
//   }
//
//   @override
//   Future<Response> changePassword({
//     required String oldPassword,
//     required String newPassword,
//     required String confirmPassword,
//   }) async {
//     return await dioHelper.post(
//       url: changePasswordApi,
//       token: token,
//       data: {
//         'current_password': oldPassword,
//         'new_password': newPassword,
//         'confirm_new_password': confirmPassword,
//       },
//     );
//   }
//
//   @override
//   Future<Response> createCheckout({
//     required String name,
//     required String email,
//     required String phone,
//     required String government,
//     required String city,
//     required String streetName,
//     required String buildingNumber,
//     required String specialMarker,
//     required String paymentMethod,
//     required String shippingPrice,
//     required String extraShipping,
//     required String overweightPrice,
//     required String promoCode,
//     required String notes,
//     required List<CreateCheckoutItemModel> items,
//   }) async {
//     return await dioHelper.post(
//       url: checkout,
//       token: token,
//       data: {
//         "name": name,
//         "email": email,
//         "phone": phone,
//         "governate": government,
//         "city": city,
//         "street_name": streetName,
//         "building_number": buildingNumber,
//         "special_marker": specialMarker,
//         "payment_method": paymentMethod,
//         "shipping_price": shippingPrice,
//         "extra_shipping": extraShipping,
//         "overweight_price": overweightPrice,
//         "promo_code": promoCode,
//         "notes": notes,
//         "items": items,
//       },
//     );
//   }
//
//   @override
//   Future<Response> removeCompare({
//   required int compareId,
// }) async {
//     return await dioHelper.delete(
//       url: '$compareDelete$compareId',
//       token: token,
//     );
//   }
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

  @override
  Future<Response> topBorrowRepo({
    required int page,
  }) async {
    return await dioHelper.get(
      url: topBorrowUrl,
      token: token,
      query: {
        'page': page,
      },
    );
  }

  @override
  Future<Response> bookDetailsRepo({
    required String bookId,
  }) async {
    return await dioHelper.get(
      url: bookDetailsUrl,
      token: token,
      query: {
        'book_id': bookId,
      },
    );
  }

  @override
  Future<Response> categoriesRepo() async {
    return await dioHelper.get(
      url: categoriesUrl,
    );
  }

  @override
  Future<Response> categoryDetailsRepo({
    required String categoryName,
  }) async {
    return await dioHelper.get(
      url: categoryUrl,
      query: {
        'category': categoryName,
      },
    );
  }

  @override
  Future<Response> getNotificationsRepo() async {
    return await dioHelper.get(
      url: notificationsUrl,
      token: token,
    );
  }

}
