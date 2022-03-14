import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/widgets/book_item.dart';
import 'package:hti_library_admin/core/util/widgets/loading.dart';

import '../../../../core/util/cubit/state.dart';

class Books extends StatelessWidget {
  const Books({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Container(
          child: MainCubit.get(context).getAllBooksModel != null
              ? Column(
                  children: [
                    if (state is DeleteBookLoading || state is GetAllBooksLoading)
                      const LinearProgressIndicator(),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => BookItem(
                          model: MainCubit.get(context)
                              .getAllBooksModel!
                              .books[index],
                        ),
                        itemCount: MainCubit.get(context)
                            .getAllBooksModel!
                            .books
                            .length,
                      ),
                    ),
                  ],
                )
              : const LoadingWidget(),
        );
      },
    );
  }
}
