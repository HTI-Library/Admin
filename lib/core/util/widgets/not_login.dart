import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NotLogin extends StatelessWidget {
  const NotLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login First',
              style: Theme.of(context).textTheme.headline6,
            ),
            Lottie.asset('assets/images/login_page.json'),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: MyBtnAccount(
            //     voidCallback: () {
            //       navigateTo(context, LoginPage());
            //     },
            //     text: 'Log In',
            //     imagePath: 'arrow_start',
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
