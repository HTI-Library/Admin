import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/di/injection.dart';
import 'package:hti_library_admin/core/error/exceptions.dart';
import 'package:hti_library_admin/core/models/top_borrow_model.dart';
import 'package:hti_library_admin/core/network/local/cache_helper.dart';
import 'package:hti_library_admin/core/network/repository.dart';
import 'package:hti_library_admin/core/util/cubit/state.dart';
import 'package:hti_library_admin/core/util/translation.dart';
import 'package:hti_library_admin/features/main/presentation/pages/books.dart';
import 'package:hti_library_admin/features/main/presentation/pages/home.dart';
import 'package:hti_library_admin/features/main/presentation/pages/messages.dart';
import 'package:hti_library_admin/features/main/presentation/pages/setings.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';

class MainCubit extends Cubit<MainState> {
  final Repository _repository;

  MainCubit({
    required Repository repository,
  })  : _repository = repository,
        super(Empty());

  static MainCubit get(context) => BlocProvider.of(context);
  TabController? controller;
  int currentIndex = 0;
  List<String> mainPageTitles = [
    'Home',
    'Categories',
    'Saved',
    'Account',
  ];
  List<Widget> mainPages = [
    const Home(),
    const Messages(),
    const Books(),
    const Settings(),
  ];

  void bottomChanged(int index) {
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
      scaffoldBackgroundColor: HexColor(surface),
      // canvasColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: Platform.isIOS
            ? null
            : SystemUiOverlayStyle(
                statusBarColor: HexColor(surface),
                statusBarIconBrightness: Brightness.dark,
              ),
        backgroundColor: HexColor(surface),
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
        backgroundColor: HexColor(surface),
        elevation: 0.0,
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
          color: HexColor(surface),
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
        elevation: 0.0,
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
          color: HexColor(surface),
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

  //TODO pick photo ------------ start
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
  //TODO pick photo ------------ end

  /// createUser ------------------- start

  void createUser({
    required String email,
    required String name,
    required String password,
  }) async {
    debugPrint('createUser------------loading');
    emit(CreateUserLoading());
    await _repository
        .createUserRepo(email: email, name: name, password: password)
        .then((value) {
      // success
      debugPrint('createUser------------success');
      emit(CreateUserSuccess());
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('createUser------------Error');
      ServerException exception = error as ServerException;
      debugPrint('createUser------------ServerException error');
      debugPrint(exception.error);
      emit(Error(error.toString()));
    });
  }

  // createUser ------------------- end

  /// getAllUsers ------------------- start

  void getAllUsers() async {
    debugPrint('getAllUsers------------loading');
    emit(GetAllUsersLoading());
    await _repository.getAllUsersRepo().then((value) {
      // success
      debugPrint('getAllUsers------------success');
      emit(GetAllUsersSuccess());
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('getAllUsers------------Error');
      ServerException exception = error as ServerException;
      debugPrint('getAllUsers------------ServerException error');
      debugPrint(exception.error);
      emit(Error(error.toString()));
    });
  }

// getAllUsers ------------------- end

  /// deleteUser ------------------- start

  void deleteUser({
    required String uId,
  }) async {
    debugPrint('deleteUser------------loading');
    emit(DeleteUserLoading());
    await _repository.deleteUserRepo(uId: uId).then((value) {
      // success
      debugPrint('deleteUser------------success');
      emit(DeleteUserSuccess());
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('deleteUser------------Error');
      ServerException exception = error as ServerException;
      debugPrint('deleteUser------------ServerException error');
      debugPrint(exception.error);
      emit(Error(error.toString()));
    });
  }

// deleteUser ------------------- end

  /// getAllBooks ------------------- start

  TopBorrowModel? getAllBooksModel;

  void getAllBooks({
    required int page,
  }) async {
    debugPrint('getAllBooks------------loading');
    emit(GetAllBooksLoading());
    await _repository
        .getAllBooksRepo(
      page: page,
    )
        .then((value) {
      // success
      getAllBooksModel = TopBorrowModel.fromJson(value.data);
      debugPrint('getAllBooks------------success');
      emit(GetAllBooksSuccess());
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('getAllBooks------------Error');
      ServerException exception = error as ServerException;
      debugPrint('getAllBooks------------ServerException error');
      debugPrint(exception.error);
      emit(Error(error.toString()));
    });
  }

// getAllBooks ------------------- end

  /// deleteBook ------------------- start

  void deleteBook({
    required String bookId,
  }) async {
    debugPrint('deleteBook------------loading');
    emit(DeleteBookLoading());
    await _repository
        .deleteBookRepo(
      bookId: bookId,
    )
        .then((value) {
      // success
      debugPrint('deleteBook------------success');
      emit(DeleteBookSuccess());
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('deleteBook------------Error');
      ServerException exception = error as ServerException;
      debugPrint('deleteBook------------ServerException error');
      debugPrint(exception.error);
      emit(Error(error.toString()));
    });
  }

// deleteBook ------------------- end

}
