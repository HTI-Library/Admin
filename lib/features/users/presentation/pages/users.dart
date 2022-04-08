import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/cubit/state.dart';
import 'package:hti_library_admin/core/util/widgets/app_button.dart';
import 'package:hti_library_admin/core/util/widgets/app_text_form_field.dart';
import 'package:hti_library_admin/core/util/widgets/asset_svg.dart';
import 'package:hti_library_admin/core/util/widgets/back_scaffold.dart';
import 'package:hti_library_admin/core/util/widgets/loading.dart';
import 'package:hti_library_admin/features/edit_book/presentation/widgets/user_item.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
                    if (state is DeleteUserLoading ||
                        state is CreateUserLoading ||
                        state is UnblockUserLoading ||
                        state is BlockUserLoading)
                      const LinearProgressIndicator(),
                    if (state is DeleteUserLoading ||
                        state is CreateUserLoading ||
                        state is UnblockUserLoading ||
                        state is BlockUserLoading)
                      space15Vertical,
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
      floatingButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 15.0),
                            height: 4,
                            width: MediaQuery.of(context).size.width / 5,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          AppTextFormField(
                            type: TextInputType.name,
                            hint: 'Name',
                            textEditingController: nameController,
                          ),
                          space15Vertical,
                          AppTextFormField(
                            type: TextInputType.emailAddress,
                            hint: 'Email',
                            textEditingController: emailController,
                          ),
                          space15Vertical,
                          AppTextFormField(
                            type: TextInputType.visiblePassword,
                            hint: 'Password',
                            textEditingController: passwordController,
                          ),
                          space15Vertical,
                          AppTextFormField(
                            type: TextInputType.phone,
                            hint: 'Phone',
                            textEditingController: phoneController,
                          ),
                          space30Vertical,
                          AppButton(
                            label: 'SAVE',
                            onPress: () {
                              Navigator.pop(context);
                              MainCubit.get(context).createUser(
                                email: emailController.text,
                                name: nameController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                              );
                              emailController.clear();
                              nameController.clear();
                              passwordController.clear();
                              phoneController.clear();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        label: const Text('add user'),
        icon: const Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
