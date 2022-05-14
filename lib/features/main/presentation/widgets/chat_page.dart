import 'package:flutter/material.dart';
import 'package:hti_library_admin/core/util/widgets/main_scaffold.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainScaffold(
      scaffold: Scaffold(
        body: Center(
          child: Text(
            'Chat Page',
          ),
        ),
      ),
    );
  }
}
