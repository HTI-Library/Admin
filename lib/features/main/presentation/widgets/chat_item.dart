import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/features/main/presentation/widgets/chat_page.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return userId != 'admin'
        ? Container(
            margin: const EdgeInsetsDirectional.only(
                start: 15.0, end: 15.0, top: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Theme.of(context).primaryColorLight,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(8.0),
              onTap: () {
                navigateTo(context, ChatPage());
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 28.0,
                      backgroundImage: NetworkImage(
                          'https://www.darkmatterday.com/wp-content/uploads/2019/09/circle-cropped.png'),
                    ),
                    space10Horizontal,
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userId,
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: MainCubit.get(context).isDark
                                          ? HexColor(surface)
                                          : HexColor(black),
                                    ),
                            maxLines: 1,
                          ),
                          // Text(
                          //   'message text sssssss ss sssss ssss sssss sssss sssss',
                          //   style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          //         color:MainCubit.get(context).isDark ? HexColor(surface):HexColor(black),
                          //       ),
                          //   maxLines: 1,
                          // ),
                          // space5Vertical,
                          // Text(
                          //   '12/10/2022',
                          //   style: Theme.of(context).textTheme.caption!.copyWith(
                          //     color:  MainCubit.get(context).isDark ? HexColor(surface):HexColor(black),
                          //   ),
                          //   maxLines: 1,
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
