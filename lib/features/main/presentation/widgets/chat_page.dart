import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/models/chat_model.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/cubit/state.dart';
import 'package:hti_library_admin/core/util/widgets/back_scaffold.dart';
import 'package:hti_library_admin/core/util/widgets/main_scaffold.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key,required this.uId}) : super(key: key);
  final String uId;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late MainCubit cubit;
  final TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cubit = context.read<MainCubit>();
    cubit.getMessages(receiverId: widget.uId);
    cubit.listenToMessages(widget.uId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainCubit, MainState>(
      listener: (context, state) {},
      child: BackScaffold(
        scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: 'Admin',
        body: Column(
          children: [
            buildChattingListView(),
            buildTextChat(),
          ],
        ),
      ),
    );
  }

  Widget buildChattingListView() {
    return Expanded(
      child: BlocBuilder<MainCubit, MainState>(
        buildWhen: (previous, current) => current is GetMessagesSuccess,
        builder: (context, state) {
          return ListView.builder(
            itemCount: cubit.messages.length,
            itemBuilder: (context, index) {
              MessageModel message = cubit.messages[index];

              if (message.senderId == 'admin') {
                return buildSenderMessage(message.message!);
              } else {
                return buildReceiverMessage(message.message!);
              }
            },
          );
        },
      ),
    );
  }

  Widget buildSenderMessage(String message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: Container(
            margin: const EdgeInsets.only(
              top: 5,
              bottom: 5,
              right: 15,
              left: 25,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            // width: double.infinity,
            // alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              color: Colors.blue[500],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(end: 8),
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              Icons.done,
              size: 10,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildReceiverMessage(String message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsetsDirectional.only(start: 10),
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.white,
            // backgroundImage: Image.network(),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              right: 25,
              left: 15,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTextChat() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15 / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 32,
            color: HexColor(mainColorD).withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15 * 0.75,
                ),
                decoration: BoxDecoration(
                  color: HexColor(mainColorD).withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: HexColor(mainColorD).withOpacity(0.64),
                    ),
                    const SizedBox(width: 15 / 4),
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        decoration: const InputDecoration(
                          hintText: "Type message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
                onPressed: () => sendMessage(),
                icon: Icon(Icons.send_rounded, color: HexColor(mainColorD))),
          ],
        ),
      ),
    );
  }

  void sendMessage() {
    String messageContent = messageController.text;
    String userId = 'admin';
    String time = DateTime.now().toString();
    if (messageController.text.isNotEmpty) {
      MessageModel message = MessageModel(
        messageId: time + userId,
        senderId: userId,
        reciverId: 'admin',
        message: messageContent,
        time: DateTime.now().toString(),
      );
      cubit.sendMessage(text: messageController.text,receiverId: widget.uId);
      messageController.clear();
    }
  }
}
