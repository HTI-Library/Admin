import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/widgets/book_item.dart';
import 'package:hti_library_admin/core/util/widgets/empty_widget.dart';
import 'package:hti_library_admin/core/util/widgets/loading.dart';

import '../../../../core/util/constants.dart';
import '../../../../core/util/cubit/state.dart';

class Books extends StatelessWidget {
  const Books({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Container(
          child: MainCubit.get(context).getAllBooksModel != null
              ? MainCubit.get(context).getAllBooksModel!.books.isNotEmpty
                  ? Column(
                      children: [
                        if (state is DeleteBookLoading ||
                            state is GetAllBooksLoading)
                          const LinearProgressIndicator(),
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              return MainCubit.get(context)
                                  .getAllBooks(page: 1);
                            },
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
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Expanded(
                          child: EmptyWidget(text: 'No books to present'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FloatingActionButton.extended(
                            elevation: 0.0,
                            backgroundColor: HexColor(mainColor),
                            onPressed: () {
                              MainCubit.get(context)
                                  .getAllBooks(page: 1);
                            },
                            label: const Text('Reload'),
                            icon: const Icon(Icons.refresh_rounded),
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
