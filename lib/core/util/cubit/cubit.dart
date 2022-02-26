import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/di/injection.dart';
import 'package:hti_library_admin/core/error/exceptions.dart';
import 'package:hti_library_admin/core/models/book_details_model.dart';
import 'package:hti_library_admin/core/models/categories_model.dart';
import 'package:hti_library_admin/core/models/login_model.dart';
import 'package:hti_library_admin/core/models/top_borrow_model.dart';
import 'package:hti_library_admin/core/network/local/cache_helper.dart';
import 'package:hti_library_admin/core/network/repository.dart';
import 'package:hti_library_admin/core/util/cubit/state.dart';
import 'package:hti_library_admin/core/util/translation.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/notification_model.dart';
import '../constants.dart';

class MainCubit extends Cubit<MainState> {
  final Repository _repository;

  MainCubit({
    required Repository repository,
  })  : _repository = repository,
        super(Empty());

  static MainCubit get(context) => BlocProvider.of(context);

  PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  int currentIndex = 0;
  List<String> mainPageTitles = [
    'Home',
    'Categories',
    'Saved',
    'Account',
  ];

  void bottomChanged(int index) {
    if (index == 3) {
      currentIndex = index;
      emit(BottomChanged());
    }

    currentIndex = index;

    emit(BottomChanged());
  }

  // dark colors
  String scaffoldBackground = '333739';

  String mainColorDark = 'ffffff';
  String mainColorVariantDark = '8a8a89';

  int currentParentCategorySelected = 0;

  void changeParentCategorySelection(int index) {
    currentParentCategorySelected = index;
    emit(CategoriesChangeParentCategoryState(
      index: currentParentCategorySelected,
    ));
  }

  // dark colors
  String secondaryDark = 'ffffff';
  String secondaryVariantDark = '8a8a89';

  late ThemeData lightTheme;
  late ThemeData darkTheme;

  late String family;

  bool isRtl = false;
  bool isDark = false;

  void setThemes({
    required bool dark,
    required bool rtl,
  }) {
    isDark = dark;
    isRtl = rtl;

    debugPrint('dark mode ------------- $isDark');

    changeTheme();

    emit(ThemeLoaded());
  }

  void changeTheme() {
    family = isRtl ? 'Roboto' : 'Roboto';

    lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      // canvasColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: Platform.isIOS
            ? null
            : const SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 20.0,
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 50.0,
        selectedItemColor: HexColor(mainColor),
        unselectedItemColor: HexColor(grey),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          height: 1.5,
        ),
      ),
      primarySwatch: MaterialColor(int.parse('0xff$mainColor'), color),
      textTheme: TextTheme(
        headline5: TextStyle(
          fontSize: 24.0,
          fontFamily: family,
          fontWeight: FontWeight.w400,
          color: HexColor(secondary),
          height: 1.4,
        ),
        headline6: TextStyle(
          fontSize: 18.0,
          fontFamily: family,
          fontWeight: FontWeight.w600,
          color: HexColor(secondary),
          height: 1.3,
        ),
        // appbarTitle: TextStyle(
        //   fontSize: 20.0,
        //   fontFamily: family,
        //   fontWeight: FontWeight.w500,
        //   color: secondaryVariant,
        //   height: 1.4,
        // ),
        // mainTitle: TextStyle(
        //   fontSize: 35.0,
        //   fontFamily: family,
        //   fontWeight: FontWeight.w500,
        //   color: secondaryVariant,
        //   height: 1.4,
        // ),
        bodyText1: TextStyle(
          fontSize: 14.0,
          fontFamily: family,
          fontWeight: FontWeight.w400,
          color: secondaryVariant,
          height: 1.4,
        ),
        bodyText2: TextStyle(
          fontSize: 25.0,
          fontFamily: family,
          fontWeight: FontWeight.w700,
          color: secondaryVariant,
          height: 1.4,
        ),
        subtitle1: TextStyle(
          fontSize: 16.0,
          fontFamily: family,
          fontWeight: FontWeight.w700,
          color: HexColor(secondary),
          height: 1.4,
        ),
        subtitle2: TextStyle(
          fontSize: 15.0,
          fontFamily: family,
          fontWeight: FontWeight.w400,
          color: HexColor(mainColor),
          height: 1.4,
        ),
        caption: TextStyle(
          fontSize: 12.0,
          fontFamily: family,
          fontWeight: FontWeight.w400,
          color: HexColor(secondary),
          height: 1.4,
        ),
        button: TextStyle(
          fontSize: 16.0,
          fontFamily: family,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          height: 1.4,
        ),
      ),
    );

    darkTheme = ThemeData(
      scaffoldBackgroundColor: HexColor(scaffoldBackground),
      // canvasColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: Platform.isIOS
            ? null
            : SystemUiOverlayStyle(
                statusBarColor: HexColor(scaffoldBackground),
                statusBarIconBrightness: Brightness.light,
              ),
        backgroundColor: HexColor(scaffoldBackground),
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(
          size: 20.0,
        ),
        titleTextStyle: TextStyle(
          color: HexColor(grey),
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: HexColor(scaffoldBackground),
        elevation: 50.0,
        selectedItemColor: HexColor(mainColor),
        unselectedItemColor: HexColor(grey),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          height: 1.5,
        ),
      ),
      primarySwatch: MaterialColor(int.parse('0xff$mainColor'), color),
      textTheme: TextTheme(
        headline5: TextStyle(
          fontSize: 24.0,
          fontFamily: family,
          fontWeight: FontWeight.w400,
          color: HexColor(secondaryDark),
          height: 1.4,
        ),
        headline6: TextStyle(
          fontSize: 20.0,
          fontFamily: family,
          fontWeight: FontWeight.w600,
          color: HexColor(secondaryDark),
          height: 1.3,
        ),
        // mainTitle: TextStyle(
        //   fontSize: 35.0,
        //   fontFamily: family,
        //   fontWeight: FontWeight.w500,
        //   color: secondaryVariant,
        //   height: 1.4,
        // ),
        // appbarTitle: TextStyle(
        //   fontSize: 25.0,
        //   fontFamily: family,
        //   fontWeight: FontWeight.w500,
        //   color: secondaryVariant,
        //   height: 1.4,
        // ),
        bodyText1: TextStyle(
          fontSize: 14.0,
          fontFamily: family,
          fontWeight: FontWeight.w400,
          color: HexColor(secondaryVariantDark),
          height: 1.4,
        ),
        bodyText2: TextStyle(
          fontSize: 25.0,
          fontFamily: family,
          fontWeight: FontWeight.w700,
          color: HexColor(secondaryVariantDark),
          height: 1.4,
        ),
        subtitle1: TextStyle(
          fontSize: 16.0,
          fontFamily: family,
          fontWeight: FontWeight.w700,
          color: HexColor(secondaryDark),
          height: 1.4,
        ),
        subtitle2: TextStyle(
          fontSize: 16.0,
          fontFamily: family,
          fontWeight: FontWeight.w400,
          color: HexColor(secondaryDark),
          height: 1.4,
        ),
        caption: TextStyle(
          fontSize: 12.0,
          fontFamily: family,
          fontWeight: FontWeight.w400,
          color: HexColor(secondaryDark),
          height: 1.4,
        ),
        button: TextStyle(
          fontSize: 16.0,
          fontFamily: family,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          height: 1.4,
        ),
      ),
    );
  }

  void changeMode({required bool value}) {
    isDark = value;

    sl<CacheHelper>().put('isDark', isDark);

    emit(ChangeModeState());
  }

  void changeLanguage({required bool value}) async {
    isRtl = value;

    sl<CacheHelper>().put('isRtl', isRtl);

    String translation = await rootBundle
        .loadString('assets/translations/${isRtl ? 'ar' : 'en'}.json');

    setTranslation(
      translation: translation,
    );

    changeTheme();

    emit(ChangeLanguageState());
  }

  late TranslationModel translationModel;

  void setTranslation({
    required String translation,
  }) {
    translationModel = TranslationModel.fromJson(json.decode(
      translation,
    ));

    emit(LanguageLoaded());
  }

  bool noInternetConnection = false;

  void checkConnectivity() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      debugPrint('Internet Connection ------------------------');
      debugPrint('${result.index}');
      debugPrint(result.toString());
      if (result.index == 0 || result.index == 1) {
        noInternetConnection = false;
      } else if (result.index == 2) {
        noInternetConnection = true;
      }

      emit(InternetState());
    });
  }

  void checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      noInternetConnection = false;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      noInternetConnection = false;
    } else {
      noInternetConnection = true;
    }
    emit(InternetState());
  }

  PickedFile? imageFile;

  void openGallery(BuildContext context) async {
    await ImagePicker()
        .getImage(
      source: ImageSource.gallery,
    )
        .then((value) {
      imageFile = value;
      emit(ChangeImageSuccessState());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(ChangeImageLoadingState());
    });
    Navigator.pop(context);
  }

  void openCamera(BuildContext context) async {
    await ImagePicker()
        .getImage(
      source: ImageSource.camera,
    )
        .then((value) {
      imageFile = value;
      emit(ChangeImageSuccessState());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(ChangeImageLoadingState());
    });
    Navigator.pop(context);
  }

  ///TODO pick photo ------------ start
  // final ImagePicker _picker = ImagePicker();
  // File? imageFile;
  //
  // void selectImage() async {
  //   _picker.pickImage(source: ImageSource.gallery).then((value) {
  //     imageFile = File(value!.path);
  //   });
  //
  //   emit(PickImageSuccessState());
  // }
  //
  // File? cameraFile;
  //
  // void selectCamera() async {
  //   _picker.pickImage(source: ImageSource.camera).then((value) {
  //     cameraFile = File(value!.path);
  //   });
  //
  //   emit(PickImageSuccessState());
  // }
  ///TODO pick photo ------------ end

  // login ------------------- start

  bool userSigned = false;

  void changeUser(bool user) {
    userSigned = user;
    emit(SignInState());
  }

  LoginModel? loginModel;

  void login({
    required String email,
    required String password,
  }) async {
    debugPrint('login------------loading');
    emit(LoginLoading());
    await _repository.login(email: email, password: password).then((value) {
      // success
      debugPrint(value.data['message']);
      debugPrint('success');
      loginModel = LoginModel.fromJson(value.data);
      changeUser(true);
      currentIndex = 0;
      debugPrint('login------------success');
      emit(LoginSuccess(loginModel: loginModel!));
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('error');
      ServerException exception = error as ServerException;
      debugPrint('login------------error');
      debugPrint(exception.error);
      emit(Error(error.toString()));
    });
  }

// login ------------------- end

  // logOut ------------------- start

  void logOut({required BuildContext context}) async {
    emit(LogoutLoading());
    await _repository.logOut().then((value) {
      // success
      signOut(context);
      changeUser(false);
      emit(LogoutSuccess());
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      emit(Error(error.toString()));
    });
  }

// logOut ------------------- end

  num appBarHeight = AppBar().preferredSize.height;

  var currentMonth = DateTime.now().month;

  void setSelectedMonth(int value) {
    currentMonth = value;
    emit(SelectMonth(value: currentMonth));
  }

  int currentDay = 0;

  void setSelectedDay(int value) {
    currentDay = value;
    emit(SelectDay(value: currentDay));
  }

  // topBorrow ------------------- start

  TopBorrowModel? topBorrowModel;

  void topBorrow({required int page}) async {
    debugPrint('topBorrow------------loading');
    emit(TopBorrowLoading());
    await _repository.topBorrowRepo(page: page).then((value) {
      // success
      topBorrowModel = TopBorrowModel.fromJson(value.data);
      debugPrint(topBorrowModel!.books[1].bookImage);
      debugPrint('topBorrowModel!.books[1].bookImage');
      debugPrint('topBorrow------------success');
      emit(TopBorrowSuccess());
    }).catchError((error) {
      // error
      debugPrint('topBorrow------------error');
      debugPrint(error.toString());
      emit(Error(error.toString()));
    });
  }

// topBorrow ------------------- end

  // bookDetails ------------------- start

  BookDetailsModel? bookModel;

  void bookDetails({required String bookId}) async {
    debugPrint('bookDetails------------loading');
    bookModel = null;
    emit(BookDetailsLoading());
    await _repository
        .bookDetailsRepo(
      bookId: bookId,
    )
        .then((value) {
      // success
      bookModel = BookDetailsModel.fromJson(value.data);
      debugPrint(bookModel!.book.bookImage);
      debugPrint('bookDetails------------success');
      emit(BookDetailsSuccess());
    }).catchError((error) {
      // error
      debugPrint('bookDetails------------error');
      debugPrint(error.toString());
      emit(Error(error.toString()));
    });
  }

  // bookDetails ------------------- end

  // categories ------------------- start

  CategoriesModel? categoriesModel;

  void categories() async {
    debugPrint('categories------------loading');
    emit(CategoriesLoading());
    await _repository.categoriesRepo().then((value) {
      // success
      categoriesModel = CategoriesModel.fromJson(value.data);
      debugPrint('categories------------success');
      emit(CategoriesSuccess());
    }).catchError((error) {
      // error
      debugPrint('categories------------error');
      debugPrint(error.toString());
      emit(Error(error.toString()));
    });
  }

  // categories ------------------- end

  // categoryDetails ------------------- start

  TopBorrowModel? categoryDetailsModel;

  void categoryDetails({
    required String categoryName,
  }) async {
    categoryDetailsModel = null;
    debugPrint('categoryDetails------------loading');
    emit(CategoryLoading());
    await _repository
        .categoryDetailsRepo(categoryName: categoryName)
        .then((value) {
      // success
      categoryDetailsModel = TopBorrowModel.fromJson(value.data);
      debugPrint('categoryDetails------------success');
      emit(CategorySuccess());
    }).catchError((error) {
      // error
      debugPrint('categoryDetails------------error');
      debugPrint(error.toString());
      emit(Error(error.toString()));
    });
  }

// categoryDetails ------------------- end

  // getNotifications ------------------- start

  NotificationModel? getNotificationsModel;

  void getNotifications() async {
    debugPrint('getNotifications------------loading');
    emit(NotificationLoading());
    await _repository.getNotificationsRepo().then((value) {
      // success
      // getNotificationsModel = NotificationModel.fromJson(value.data);
      debugPrint('getNotifications------------success');
      print(getNotificationsModel!.notifications[0].message);
      emit(NotificationSuccess());
    }).catchError((error) {
      // error
      debugPrint('getNotifications------------error');
      debugPrint(error.toString());
      emit(Error(error.toString()));
    });
  }

// getNotifications ------------------- end

}
