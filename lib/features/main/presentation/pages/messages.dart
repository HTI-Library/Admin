import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/cubit/state.dart';
import 'package:hti_library_admin/features/main/presentation/widgets/chat_item.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              ChatItem(userId: MainCubit.get(context).users[index]),
          itemCount: MainCubit.get(context).users.length,
        );
      },
    );
  }
}
