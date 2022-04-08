import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/models/login_model.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/cubit/state.dart';
import 'package:hti_library_admin/core/util/widgets/app_button.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    Key? key,
    required this.model,
  }) : super(key: key);
  final UserModel model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder <MainCubit, MainState>(
      builder: (context, state){
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
                    backgroundColor:
                    model.blocked ? HexColor(red) : HexColor(green),
                    radius: 37,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 6.0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 6.0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 6.0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
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
                    width: MediaQuery.of(context).size.width-100,
                    label: 'Block',
                    onPress: () {},
                  ),
                  space10Horizontal,
                  SizedBox(
                    height: 40.0,
                    width: 40.0,
                    child: Material(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.circular(10.0),
                      color: Theme.of(context).primaryColor.withOpacity(.1),
                      child:  IconButton(
                        onPressed: () {
                          MainCubit.get(context).deleteUser(uId: model.id);
                        },
                        icon: Icon(
                          Icons.delete_rounded,
                          size: 16.0,
                          color: HexColor(red),
                        ),
                      ),
                    ),
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