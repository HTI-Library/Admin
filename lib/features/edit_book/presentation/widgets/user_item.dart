import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/models/login_model.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/cubit/state.dart';
import 'package:hti_library_admin/core/util/widgets/app_button.dart';
import 'package:hti_library_admin/core/util/widgets/app_icon_button.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    Key? key,
    required this.model,
  }) : super(key: key);
  final UserModel model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsetsDirectional.only(
            start: 15.0,
            end: 15.0,
            bottom: 15.0,
          ),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Theme.of(context).primaryColorLight,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: model.blocked
                        ? HexColor(red).withOpacity(.6)
                        : HexColor(green).withOpacity(.6),
                    radius: 38,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(model.avatar),
                      radius: 35.0,
                    ),
                  ),
                  space10Horizontal,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          model.email,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Text(
                          model.phone,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ],
                    ),
                  ),
                  space10Horizontal,
                  Column(
                    children: [
                      Container(
                        width: 40.0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Theme.of(context).primaryColor.withOpacity(.1),
                        ),
                        child: Row(
                          children: [
                            Text(
                              model.booksBorrows.length.toString(),
                              style: Theme.of(context).textTheme.caption,
                            ),
                            space4Horizontal,
                            Icon(
                              Icons.book_rounded,
                              size: 10.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      ),
                      space3Vertical,
                      Container(
                        width: 40.0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Theme.of(context).primaryColor.withOpacity(.1),
                        ),
                        child: Row(
                          children: [
                            Text(
                              model.booksSaved.length.toString(),
                              style: Theme.of(context).textTheme.caption,
                            ),
                            space4Horizontal,
                            Icon(
                              Icons.bookmark_added_rounded,
                              size: 10.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      ),
                      space3Vertical,
                      Container(
                        width: 40.0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Theme.of(context).primaryColor.withOpacity(.1),
                        ),
                        child: Row(
                          children: [
                            Text(
                              model.returnedBooks.length.toString(),
                              style: Theme.of(context).textTheme.caption,
                            ),
                            space4Horizontal,
                            Icon(
                              Icons.keyboard_return_rounded,
                              size: 10.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              space10Vertical,
              Row(
                children: [
                  AppButton(
                    width: MediaQuery.of(context).size.width - 150,
                    label: model.blocked ? 'Unblock' : 'Block',
                    onPress: () {
                      if (model.blocked) {
                        MainCubit.get(context)
                            .unblockUser(studentID: model.email);
                      } else {
                        MainCubit.get(context)
                            .blockUser(studentID: model.email);
                      }
                    },
                  ),
                  space10Horizontal,
                  AppIconButton(
                    onPressed: () {
                      makePhoneCall(model.phone);
                    },
                    icon: Icons.call_rounded,
                  ),
                  space10Horizontal,
                  AppIconButton(
                    onPressed: () {
                      MainCubit.get(context).deleteUser(uId: model.id);
                    },
                    icon: Icons.delete_rounded,
                    iconColor: HexColor(red),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
