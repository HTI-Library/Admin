import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/widgets/back_scaffold.dart';
import 'package:hti_library_admin/core/util/widgets/book_item.dart';
import 'package:hti_library_admin/core/util/widgets/empty_widget_with_reload.dart';
import 'package:hti_library_admin/core/util/widgets/loading.dart';

import '../../../../core/util/cubit/state.dart';

class CatBookPage extends StatefulWidget {
  const CatBookPage({
    Key? key,
    required this.type,
    required this.library,
    required this.category,
  }) : super(key: key);
  final String category;
  final String library;
  final String type;

  @override
  State<CatBookPage> createState() => _CatBookPageState();
}

class _CatBookPageState extends State<CatBookPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MainCubit.get(context).getCatBooks(
        category: widget.category, library: widget.library, type: widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return BackScaffold(
          scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Container(
            child: MainCubit.get(context).getCatBooksModel != null
                ? MainCubit.get(context).getCatBooksModel!.books.isNotEmpty
                    ? Column(
                        children: [
                          if (state is DeleteBookLoading ||
                              state is GetAllBooksLoading)
                            const LinearProgressIndicator(),
                          Expanded(
                            child: RefreshIndicator(
                              onRefresh: () async {
                                MainCubit.get(context).getCatBooks(
                                    category: widget.category,
                                    library: widget.library,
                                    type: widget.type);
                              },
                              child: ListView.builder(
                                itemBuilder: (context, index) => BookItem(
                                  getBooksMethod: (){
                                    MainCubit.get(context).getCatBooks(
                                        category: widget.category, library: widget.library, type: widget.type);
                                  },
                                  model: MainCubit.get(context)
                                      .getCatBooksModel!
                                      .books[index],
                                ),
                                itemCount: MainCubit.get(context)
                                    .getCatBooksModel!
                                    .books
                                    .length,
                              ),
                            ),
                          ),
                        ],
                      )
                    : EmptyWidgetReload(
                        emptyText: 'No books to present',
                        onPressed: () {
                          MainCubit.get(context).getCatBooks(
                              category: widget.category,
                              library: widget.library,
                              type: widget.type);
                        },
                      )
                : const LoadingWidget(),
          ),
        );
      },
    );
  }
}
