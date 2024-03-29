import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/di/injection.dart';
import 'package:hti_library_admin/core/models/book_details_model.dart';
import 'package:hti_library_admin/core/models/borrow_model.dart';
import 'package:hti_library_admin/core/models/categories_model.dart';
import 'package:hti_library_admin/core/models/chat_model.dart';
import 'package:hti_library_admin/core/models/get_all_library_model.dart';
import 'package:hti_library_admin/core/models/get_all_types_model.dart';
import 'package:hti_library_admin/core/models/login_model.dart';
import 'package:hti_library_admin/core/models/top_borrow_model.dart';
import 'package:hti_library_admin/core/network/local/cache_helper.dart';
import 'package:hti_library_admin/core/network/repository.dart';
import 'package:hti_library_admin/core/util/cubit/state.dart';
import 'package:hti_library_admin/core/util/translation.dart';
import 'package:hti_library_admin/features/main/presentation/pages/books.dart';
import 'package:hti_library_admin/features/main/presentation/pages/home.dart';
import 'package:hti_library_admin/features/main/presentation/pages/messages.dart';
import 'package:hti_library_admin/features/settings/pages/settings/settings.dart';
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
  List<Map> mainPageTitles = [
    {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
    {
      'en': 'Messages',
      'ar': 'المحادثات',
    },
    {
      'en': 'Books',
      'ar': 'الكتب',
    },
    {
      'en': 'Settings',
      'ar': 'الاعدادات',
    },
  ];
  List<Widget> mainPages = [
    const Home(),
    const Messages(),
    const Books(),
    SettingsPage(),
  ];

  void bottomChanged(int index) {
    currentIndex = index;
    emit(BottomChanged());
  }

  // dark colors
  String scaffoldBackground = '15202b';

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
    family = isRtl ? 'Cairo' : 'DroidNaksh';

    lightTheme = ThemeData(
      primaryColor: HexColor(mainColorL),
      primaryColorLight: HexColor(greyWhite),
      primaryColorDark: HexColor(mainColorL),

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
        selectedItemColor: HexColor(mainColorL),
        unselectedItemColor: HexColor(darkBlue),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          height: 1.5,
        ),
      ),
      primarySwatch: MaterialColor(int.parse('0xff$mainColorL'), color),
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
          color: HexColor(mainColorL),
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
      primaryColor: HexColor(mainColorD),
      primaryColorLight: HexColor(secondaryColorD),
      primaryColorDark: HexColor(textColorD),

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
          color: HexColor(darkBlue),
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: HexColor(scaffoldBackground),
        elevation: 0.0,
        selectedItemColor: HexColor(mainColorL),
        unselectedItemColor: HexColor(darkBlue),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          height: 1.5,
        ),
      ),
      primarySwatch: MaterialColor(int.parse('0xff$mainColorL'), color),
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

  /// createUser ------------------- start

  void createUser({
    required String email,
    required String name,
    required String password,
    required String phone,
  }) async {
    debugPrint('createUser------------loading');
    emit(CreateUserLoading());
    await _repository
        .createUserRepo(
      email: email,
      name: name,
      password: password,
      phone: phone,
    )
        .then((value) {
      // success
      debugPrint('createUser------------success');
      emit(CreateUserSuccess());
      getAllUsers();
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('createUser------------Error');

      emit(Error(error.toString()));
    });
  }

  // createUser ------------------- end

  /// getAllUsers ------------------- start
  AllUsersModel? allUsersModel;

  void getAllUsers() async {
    debugPrint('getAllUsers------------loading');
    emit(GetAllUsersLoading());
    await _repository.getAllUsersRepo().then((value) {
      // success
      allUsersModel = AllUsersModel.fromJson(value.data);
      debugPrint('getAllUsers------------success');
      emit(GetAllUsersSuccess());
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('getAllUsers------------Error');

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
      getAllUsers();
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('deleteUser------------Error');

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

      emit(Error(error.toString()));
    });
  }

// deleteBook ------------------- end

  /// getAllCategories ------------------- start

  CategoriesModel? categoriesModel;

  void getAllCategories({
    required String library,
    required String type,
  }) async {
    categoriesModel = null;
    debugPrint('getAllCategories------------loading');
    emit(GetAllCategoriesLoading());
    await _repository
        .getAllCategoriesRepo(
      type: type,
      library: library,
    )
        .then((value) {
      // success
      categoriesModel = CategoriesModel.fromJson(value.data);
      debugPrint('getAllCategories------------success');
      emit(GetAllCategoriesSuccess());
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('getAllCategories------------Error');

      emit(Error(error.toString()));
    });
  }

// getAllCategories ------------------- end

  /// createBook ------------------- start

  void createBook({
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
    debugPrint('createBook------------loading');
    emit(CreateBookLoading());
    await _repository
        .createBookRepo(
            image: imageFile,
            pdf: pdfFile,
            library: library,
            type: type,
            name: name,
            edition: edition,
            rate: rate,
            auther: auther,
            pages: pages,
            category: category,
            bookNum: bookNum,
            amount: amount,
            classificationNum: classificationNum,
            overview: overview)
        .then((value) {
      // success
      debugPrint('createBook------------success');
      emit(CreateBookSuccess());
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('createBook------------Error');

      emit(Error(error.toString()));
    });
  }

// createBook ------------------- end

  /// search ------------------- start

  void search({
    required String word,
  }) async {
    debugPrint('search------------loading');
    emit(SearchLoading());
    await _repository
        .searchRepo(
      word: word,
    )
        .then((value) {
      // success
      debugPrint('search------------success');
      emit(SearchSuccess());
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('search------------Error');
      emit(Error(error.toString()));
    });
  }

// search ------------------- end

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

  /// editBook ------------------- start

  void editBook({
    required String library,
    required String type,
    String? name,
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
    debugPrint('editBook------------loading');
    emit(EditBookLoading());
    await _repository
        .editBookRepo(
      image: imageFile,
      pdf: pdfFile,
      library: library,
      type: type,
      name: name,
      edition: edition,
      rate: rate,
      auther: auther,
      pages: pages,
      category: category,
      bookNum: bookNum,
      amount: amount,
      classificationNum: classificationNum,
      overview: overview,
      bookId: bookId,
    )
        .then((value) {
      // success
      debugPrint('editBook------------success');
      emit(EditBookSuccess());
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('editBook------------Error');
      emit(Error(error.toString()));
    });
  }

// editBook ------------------- end

  /// createLibrary ------------------- start

  void createLibrary({
    required String code,
    required String name,
  }) async {
    debugPrint('createLibrary------------loading');
    emit(CreateLibraryLoading());
    await _repository
        .createLibraryRepo(
      code: code,
      name: name,
    )
        .then((value) {
      // success
      debugPrint('createLibrary------------success');
      emit(CreateLibrarySuccess());
      getAllLibraries();
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('createLibrary------------Error');

      emit(Error(error.toString()));
    });
  }

// createLibrary ------------------- end

  /// editLibrary ------------------- start

  void editLibrary({
    required String code,
    required String name,
    required String libraryID,
  }) async {
    debugPrint('editLibrary------------loading');
    emit(EditLibraryLoading());
    await _repository
        .editLibraryRepo(
      code: code,
      name: name,
      libraryID: libraryID,
    )
        .then((value) {
      // success
      debugPrint('editLibrary------------success');
      emit(EditLibrarySuccess());
      getAllLibraries();
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('editLibrary------------Error');

      emit(Error(error.toString()));
    });
  }

// editLibrary ------------------- end

  /// getAllLibraries ------------------- start

  GetAllLibraryModel? getAllLibraryModel;

  void getAllLibraries() async {
    getAllLibraryModel = null;
    debugPrint('getAllLibraries------------loading');
    emit(GetAllLibrariesLoading());
    await _repository.getAllLibrariesRepo().then((value) {
      // success
      getAllLibraryModel = GetAllLibraryModel.fromJson(value.data);
      debugPrint('getAllLibraries------------success');
      emit(GetAllLibrariesSuccess());
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('getAllLibraries------------Error');

      emit(Error(error.toString()));
    });
  }

// getAllLibraries ------------------- end
  /// deleteLibrary ------------------- start

  void deleteLibrary({required String library}) async {
    debugPrint('deleteLibrary------------loading');
    emit(DeleteLibraryLoading());
    await _repository.deleteLibraryRepo(library: library).then((value) {
      // success
      debugPrint('deleteLibrary------------success');
      emit(DeleteLibrarySuccess());
      getAllLibraries();
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('deleteLibrary------------Error');

      emit(Error(error.toString()));
    });
  }

// deleteLibrary ------------------- end

  /// createType ------------------- start

  void createType({
    required String library,
    required String name,
  }) async {
    debugPrint('createType------------loading');
    emit(CreateTypeLoading());
    await _repository
        .createTypeRepo(
      library: library,
      name: name,
    )
        .then((value) {
      // success
      debugPrint('createType------------success');
      emit(CreateTypeSuccess());
      getAllTypes(library: library);
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('createType------------Error');

      emit(Error(error.toString()));
    });
  }

// createType ------------------- end

  /// editType ------------------- start

  void editType({
    required String library,
    required String name,
    required String typeID,
  }) async {
    debugPrint('editType------------loading');
    emit(EditTypeLoading());
    await _repository
        .editTypeRepo(
      library: library,
      name: name,
      typeID: typeID,
    )
        .then((value) {
      // success
      debugPrint('editType------------success');
      emit(EditTypeSuccess());
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('editType------------Error');

      emit(Error(error.toString()));
    });
  }

// editType ------------------- end

  /// getAllTypes ------------------- start

  GetAllTypesModel? getAllTypesModel;

  void getAllTypes({
    required String library,
  }) async {
    getAllTypesModel = null;
    debugPrint('getAllTypes------------loading');
    emit(GetAllTypesLoading());
    await _repository.getAllTypesRepo(library: library).then((value) {
      // success
      getAllTypesModel = GetAllTypesModel.fromJson(value.data);
      debugPrint('getAllTypes------------success');
      emit(GetAllTypesSuccess());
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('getAllTypes------------Error');

      emit(Error(error.toString()));
    });
  }

// getAllTypes ------------------- end
  /// deleteType ------------------- start

  void deleteType({required String typeID}) async {
    debugPrint('deleteType------------loading');
    emit(DeleteTypeLoading());
    await _repository
        .deleteTypeRepo(
      typeID: typeID,
    )
        .then((value) {
      // success
      debugPrint('deleteType------------success');
      emit(DeleteTypeSuccess());
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('deleteType------------Error');

      emit(Error(error.toString()));
    });
  }

// deleteType ------------------- end

  /// deleteCategory ------------------- start

  void deleteCategory({required String catId}) async {
    debugPrint('deleteCategory------------loading');
    emit(DeleteCategoryLoading());
    await _repository
        .deleteCategoryRepo(
      catId: catId,
    )
        .then((value) {
      // success
      debugPrint('deleteCategory------------success');
      emit(DeleteCategorySuccess());
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('deleteCategory------------Error');

      emit(Error(error.toString()));
    });
  }

// deleteCategory ------------------- end

  /// createCategory ------------------- start

  void createCategory({
    required String library,
    required String name,
    required String type,
  }) async {
    debugPrint('createCategory------------loading');
    emit(CreateCategoryLoading());
    await _repository
        .createCategoryRepo(
      type: type,
      library: library,
      name: name,
    )
        .then((value) {
      // success
      debugPrint('createCategory------------success');
      emit(CreateCategorySuccess());
      getAllCategories(library: library, type: type);
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('createCategory------------Error');

      emit(Error(error.toString()));
    });
  }

// createCategory ------------------- end

  /// bookDetails ------------------- start

  BookDetailsModel? bookModel;

  Future<void> bookDetails({required String bookId}) async {
    bookModel = null;
    pdfFile = null;
    imageFile = null;

    debugPrint('bookDetails------------loading');
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

  /// getBooksInBorrow ------------------- start
  BorrowModel? borrowModelDelivered;
  BorrowModel? borrowModelOrdered;

  void getBooksInBorrowTrue({
    required int page,
  }) async {
    debugPrint('getBooksInBorrow------------loading');
    emit(GetBooksInBorrowLoading());
    await _repository
        .getBooksInBorrowRepo(
      page: page,
      inBorrow: true,
    )
        .then((value) {
      borrowModelDelivered = BorrowModel.fromJson(value.data);
      // success
      debugPrint('getBooksInBorrow------------success');
      emit(GetBooksInBorrowSuccess());
    }).catchError((error) {
      // error
      debugPrint('getBooksInBorrow------------error');
      debugPrint(error.toString());
      emit(Error(error.toString()));
    });
  }

  void getBooksInBorrowFalse({
    required int page,
  }) async {
    debugPrint('getBooksInBorrow------------loading');
    emit(GetBooksInBorrowLoading());
    await _repository
        .getBooksInBorrowRepo(
      page: page,
      inBorrow: false,
    )
        .then((value) {
      borrowModelOrdered = BorrowModel.fromJson(value.data);
      // success
      debugPrint('getBooksInBorrow------------success');
      emit(GetBooksInBorrowSuccess());
    }).catchError((error) {
      // error
      debugPrint('getBooksInBorrow------------error');
      debugPrint(error.toString());
      emit(Error(error.toString()));
    });
  }

// getBooksInBorrow ------------------- end

  /// startBorrowTime ------------------- start

  void startBorrowTime({required String borrowID}) async {
    debugPrint('startBorrowTime------------loading');
    emit(StartBorrowTimeLoading());
    await _repository
        .startBorrowTimeRepo(
      borrowID: borrowID,
    )
        .then((value) {
      // success
      debugPrint('startBorrowTime------------success');
      emit(StartBorrowTimeSuccess());
      getBooksInBorrowFalse(page: 1);
      getBooksInBorrowTrue(page: 1);
    }).catchError((error) {
      // error
      debugPrint('startBorrowTime------------error');
      debugPrint(error.toString());

      emit(Error(error.toString()));
    });
  }

// startBorrowTime ------------------- end

  /// returnBorrow ------------------- start

  void returnBorrow({required String borrowID}) async {
    debugPrint('returnBorrow------------loading');
    emit(ReturnBorrowLoading());
    await _repository
        .returnBorrowRepo(
      borrowID: borrowID,
    )
        .then((value) {
      // success
      debugPrint('returnBorrow------------success');
      emit(ReturnBorrowSuccess());
      getBooksInBorrowFalse(page: 1);
      getBooksInBorrowTrue(page: 1);
    }).catchError((error) {
      // error
      debugPrint('returnBorrow------------error');
      debugPrint(error.toString());

      emit(Error(error.toString()));
    });
  }

// returnBorrow ------------------- end

  /// getCatBooks ------------------- start
  TopBorrowModel? getCatBooksModel;

  void getCatBooks({
    required String category,
    required String library,
    required String type,
  }) async {
    getCatBooksModel = null;
    debugPrint('getCatBooks------------loading');
    emit(GetCatBooksLoading());
    await _repository
        .getCatBooksRepo(
      type: type,
      library: library,
      category: category,
    )
        .then((value) {
      // success
      getCatBooksModel = TopBorrowModel.fromJson(value.data);
      debugPrint('getCatBooks------------success');
      emit(GetCatBooksSuccess());
    }).catchError((error) {
      // error
      debugPrint('getCatBooks------------error');
      debugPrint(error.toString());

      emit(Error(error.toString()));
    });
  }

// getCatBooks ------------------- end

  /// editCat ------------------- start

  void editCat({
    required String library,
    required String name,
    required String categoryID,
    required String type,
  }) async {
    debugPrint('editCat------------loading');
    emit(EditCatLoading());
    await _repository
        .editCatRepo(
      type: type,
      library: library,
      name: name,
      categoryID: categoryID,
    )
        .then((value) {
      // success
      debugPrint('editCat------------success');
      emit(EditCatSuccess());
      getAllCategories(library: library, type: type);
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('editCat------------Error');

      emit(Error(error.toString()));
    });
  }

// editCat ------------------- end

  /// pick photo ------------ start
  final ImagePicker _picker = ImagePicker();
  File? imageFile;

  void selectImage(context) async {
    _picker.pickImage(source: ImageSource.gallery).then((value) {
      imageFile = File(value!.path);
      emit(PickImageSuccessState());
    });
    Navigator.pop(context);
  }

  void selectCamera(context) async {
    _picker.pickImage(source: ImageSource.camera).then((value) {
      imageFile = File(value!.path);
      emit(PickImageSuccessState());
    });

    Navigator.pop(context);
  }

  void clearSelectedImage() {
    imageFile = null;
    emit(ClearImageSuccessState());
  }

// pick photo ------------ end

  /// pick pdf ------------ start

  File? pdfFile;

  void pickPdf() async {
    await FilePicker.platform.pickFiles().then((value) {
      pdfFile = File(value!.files.single.path!);
      emit(PickPdfSuccess());
    });
  }

  void clearPickedPdf() {
    pdfFile = null;
    emit(ClearPickedPdfSuccess());
  }

// pick pdf ------------ end

  /// blockUser ------------------- start

  void blockUser({
    required String studentID,
  }) async {
    debugPrint('blockUser------------loading');
    emit(BlockUserLoading());
    await _repository
        .blockUserRepo(
      studentID: studentID,
    )
        .then((value) {
      // success
      debugPrint('blockUser------------success');
      emit(BlockUserSuccess());
      getAllUsers();
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('blockUser------------Error');

      emit(Error(error.toString()));
    });
  }

// blockUser ------------------- end

  /// unblockUser ------------------- start

  void unblockUser({
    required String studentID,
  }) async {
    debugPrint('unblockUser------------loading');
    emit(UnblockUserLoading());
    await _repository
        .unblockUserRepo(
      studentID: studentID,
    )
        .then((value) {
      // success
      debugPrint('unblockUser------------success');
      emit(UnblockUserSuccess());
      getAllUsers();
    }).catchError((error) {
      // error
      debugPrint(error.toString());
      debugPrint('unblockUser------------Error');

      emit(Error(error.toString()));
    });
  }

// unblockUser ------------------- end

  bool isSearch = false;

  void openSearch() {
    isSearch = !isSearch;
    emit(OpenSearch());
  }

  var db = FirebaseFirestore.instance;

  void sendMessage({
    required String receiverId,
    required String text,
  }) {
    MessageModel model = MessageModel(
      senderId: 'admin',
      message: text,
      reciverId: receiverId,
      time: DateTime.now().toString(),
      messageId: receiverId + DateTime.now().toString(),
    );

    // set my chats

    FirebaseFirestore.instance
        .collection('users')
        .doc('admin')
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(model.toJson())
        .then((value) {
      emit(SendMessageSuccess());
    }).catchError((error) {
      emit(SendMessageError());
    });

    // set receiver chats

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc('admin')
        .collection('messages')
        .add(model.toJson())
        .then((value) {
      emit(SendMessageSuccess());

      updateUser(id: receiverId);
    }).catchError((error) {
      emit(SendMessageError());
    });
  }

  List<MessageModel> messages = [];
  void getMessages({
    required String receiverId
  }) {
    FirebaseFirestore.instance
        .collection("users")
        .doc('admin')
        .collection("chats")
        .doc(receiverId)
        .collection("messages")
        .orderBy('time')
        .get()
        .then((value) {
      messages.clear();

      for (var element in value.docs) {
        MessageModel message = MessageModel.fromJson(element.data());
        messages.add(message);
      }
      emit(GetMessagesSuccess());
    });
  }

  List<String> users = [];

  void getAllUsersInChat() {
    FirebaseFirestore.instance.collection('users').snapshots().listen((event) {
      users = [];
      for (var element in event.docs) {
        users.add(element.id);
      }
      debugPrint('getAllUsersInChat------------success${users.length}');

      emit(GetAllUsersInChatSuccess());
    });
  }

  void  listenToMessages(String receiverId) {
    FirebaseFirestore.instance
        .collection("users")
        .doc('admin')
        .collection("chats")
        .doc(receiverId)
        .collection("messages")
    // sort data
        .orderBy("time")
    // stream snapshots
        .snapshots()
    // listen to message .
        .listen((event) {
      // messages.clear();

      // print('Docs => ${event.docs.length}');

      // another method
      // MessageModel message = MessageModel.fromJson(event.docs[0].data());
      for (var element in event.docs) {
        MessageModel model = MessageModel.fromJson(element.data());
        messages.add(model);
      }
      emit(GetMessagesSuccess());
    });
  }

  String? uName;
  String? uImage;
  String? uPhone;
  void getDataUser({required String uId}) {
    uName ='';
    uImage ='';
    uPhone ='';
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
      uName = value.get('name').toString();
      uImage = value.get('avatar').toString();
      uPhone = value.get('phone').toString();
      print('phone --------------------- $uPhone');
      emit(GetDataFromFirebaseSuccess());

    });

  }


  void updateUser({
    required String id,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set({'id': id}).then((value) {
      UserUpdateSuccess();
    }).catchError((error) {
      emit(UserUpdateError());
    });
  }


}
