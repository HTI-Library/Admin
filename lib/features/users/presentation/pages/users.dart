import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/cubit/state.dart';
import 'package:hti_library_admin/core/util/widgets/back_scaffold.dart';
import 'package:hti_library_admin/core/util/widgets/loading.dart';
import 'package:hti_library_admin/features/edit_book/presentation/widgets/user_item.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MainCubit.get(context).getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return BackScaffold(
      title: 'Users',
      body: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return MainCubit.get(context).allUsersModel != null
              ? Column(
                  children: [
                    if (state is DeleteUserLoading)
                      const LinearProgressIndicator(),
                    if (state is DeleteUserLoading) space15Vertical,
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          return MainCubit.get(context).getAllUsers();
                        },
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => UserItem(
                            model: MainCubit.get(context)
                                .allUsersModel!
                                .users[index],
                          ),
                          itemCount: MainCubit.get(context)
                              .allUsersModel!
                              .users
                              .length,
                        ),
                      ),
                    ),
                  ],
                )
              : const LoadingWidget();
        },
      ),
      scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
