import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/di/injection.dart';
import 'package:hti_library_admin/core/network/local/cache_helper.dart';
import 'package:hti_library_admin/core/util/translation.dart';
import 'package:url_launcher/url_launcher.dart';

import 'cubit/cubit.dart';

const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';

const String mainColor = '00439c';
const String secondary = '005C89';
// const String secondColor = 'da7339';
// const String thirdColor = '1da1f2';
// const String darkWhite = 'e0e0e0';
const String black = '#5E5F61';
const Color secondaryVariant = Color.fromRGBO(33, 36, 36, 0.7019607843137254);
const Color starColor = Colors.amber;
// const String productBackground = '#F8F8F8';
// const String green = '#1fcd6c';
const String red = '#F21A0E';
const String grey = '#898989';
const String green = '#125c03';
// const String blueGrey = '#e1e7f0';
// const String black_e = '#282828';
const String surface = '#ffffff';
const String greyWhite = '#8fe1e7f0';
const String dialogColor = '#e1e7f0';
const String disableButton = '#A7B1D7';

//dark theme
const String secondBackground = '393d40';
const String secondaryVariantDark = '8a8a89';

const Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

dynamic parseMapFromServer(String text) => jsonDecode(
    text.replaceAll(r'\', r'').replaceAll(r'\\', r'').replaceAll(r'\\\', r''));
//todo
// List<Widget> bottomPages = [
//   const HomePage(),
//   const Categories(),
//   const SavedPage(),
//   AccountPage(),
// ];

String? token = '';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

void launchURL({required String url}) async {
  launch(url).then((value) {
    showToast(message: 'Could not launch $url', toastStates: ToastStates.ERROR);
    print('url oppend success');
  }).catchError((error) {
    print('url oppend error');
    print(error.toString());
  });
}

void showToast({
  required String message,
  required ToastStates toastStates,
}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: choseToastColor(toastStates),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { SUCCESS, ERROR, WARNING }

Color choseToastColor(ToastStates toastStates) {
  Color color;
  switch (toastStates) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
  }
  return color;
}

void signOut(context) {
  sl<CacheHelper>().clear('token').then((value) {
    if (value) {
      token = null;
      showToast(
          message: 'Sign out Successfully', toastStates: ToastStates.SUCCESS);
      // MainCubit.get(context).changeUser(false);
    }
  });
}

TranslationModel appTranslation(context) =>
    MainCubit.get(context).translationModel;

String displayTranslatedText({
  required BuildContext context,
  required String ar,
  required String en,
}) =>
    MainCubit.get(context).isRtl ? ar : en;

Widget myDivider(context) => Divider(
      height: 0.0,
      color: HexColor(grey),
    );

Widget bigDivider(context) => Container(
      width: double.infinity,
      height: 4.0,
      color: HexColor(grey),
    );

const space3Vertical = SizedBox(
  height: 3.0,
);

const space4Vertical = SizedBox(
  height: 4.0,
);

const space5Vertical = SizedBox(
  height: 5.0,
);

const space8Vertical = SizedBox(
  height: 8.0,
);

const space10Vertical = SizedBox(
  height: 10.0,
);

const space15Vertical = SizedBox(
  height: 15.0,
);

const space20Vertical = SizedBox(
  height: 20.0,
);

const space30Vertical = SizedBox(
  height: 30.0,
);

const space40Vertical = SizedBox(
  height: 40.0,
);

const space50Vertical = SizedBox(
  height: 50.0,
);

const space60Vertical = SizedBox(
  height: 60.0,
);

const space70Vertical = SizedBox(
  height: 70.0,
);

const space80Vertical = SizedBox(
  height: 80.0,
);

const space90Vertical = SizedBox(
  height: 90.0,
);

const space100Vertical = SizedBox(
  height: 100.0,
);

const space3Horizontal = SizedBox(
  width: 3.0,
);

const space4Horizontal = SizedBox(
  width: 4.0,
);

const space5Horizontal = SizedBox(
  width: 5.0,
);

const space10Horizontal = SizedBox(
  width: 10.0,
);
const space15Horizontal = SizedBox(
  width: 15.0,
);

const space6Horizontal = SizedBox(
  width: 6.0,
);

const space20Horizontal = SizedBox(
  width: 20.0,
);

const space30Horizontal = SizedBox(
  width: 30.0,
);

const space40Horizontal = SizedBox(
  width: 40.0,
);

const space50Horizontal = SizedBox(
  width: 50.0,
);

const space60Horizontal = SizedBox(
  width: 60.0,
);

const space70Horizontal = SizedBox(
  width: 70.0,
);

const space80Horizontal = SizedBox(
  width: 80.0,
);

const space90Horizontal = SizedBox(
  width: 90.0,
);

const space100Horizontal = SizedBox(
  width: 100.0,
);
