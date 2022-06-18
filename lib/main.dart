import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_library_admin/core/di/injection.dart' as di;

import 'core/di/injection.dart';
import 'core/network/local/cache_helper.dart';
import 'core/util/bloc_observer.dart';
import 'core/util/constants.dart';
import 'core/util/cubit/cubit.dart';
import 'core/util/cubit/state.dart';
import 'features/main/presentation/pages/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc.observer = MyBlocObserver();

  await di.init();

  bool isRtl = false;
  await Firebase.initializeApp();
  await sl<CacheHelper>().get('isRtl').then((value) {
    debugPrint('trl ------------- $value');
    if (value != null) {
      isRtl = value;
    }
  });

  String translation = await rootBundle
      .loadString('assets/translations/${isRtl ? 'ar' : 'en'}.json');

  bool isDark = false;

  await sl<CacheHelper>().get('isDark').then((value) {
    debugPrint('dark mode ------------- $value');
    if (value != null) {
      isDark = value;
    }
  });

  sl<CacheHelper>().get('token').then((value) {
    debugPrint('token_---------------------------- $value');
    if (value == null) {
      token = '';
    } else {
      token = value;
    }
  });

  debugPrint('dark mode ------------- $isDark');

  runApp(MyApp(
    isDark: isDark,
    isRtl: isRtl,
    translation: translation,
  ));
}

class MyApp extends StatefulWidget {
  final bool isDark;
  final bool isRtl;
  final String translation;

  const MyApp({
    Key? key,
    required this.isDark,
    required this.isRtl,
    required this.translation,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => sl<MainCubit>()
            ..setThemes(
              rtl: widget.isRtl,
              dark: widget.isDark,
            )
            ..setTranslation(
              translation: widget.translation,
            )
            ..checkInternet()
            ..checkConnectivity()
            ..getBooksInBorrowTrue(page: 1)
            ..getBooksInBorrowFalse(page: 1)
            ..getAllBooks(page: 1)
            // ..sendMessage(
            //   text: 'test4',
            //   receiverId: '627fe5899bed66c66b63b978',
            // )
            // ..getMessages(
            //   receiverId: '627fe5899bed66c66b63b978',
            // )
            ..getAllUsersInChat(),
        ),
      ],
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Library',
            debugShowCheckedModeBanner: false,
            themeMode: MainCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: MainCubit.get(context).lightTheme,
            darkTheme: MainCubit.get(context).darkTheme,
            // home: token == '' ? LoginPage() : MainPage(),
            home: const MainPage(),
          );
        },
      ),
    );
  }
}

//s library
//1
//test
