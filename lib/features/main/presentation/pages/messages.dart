import 'package:flutter/material.dart';
import 'package:hti_library_admin/features/main/presentation/widgets/chat_item.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => const ChatItem(),
      itemCount: 10,
    );
  }
}
