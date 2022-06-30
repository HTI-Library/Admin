import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/widgets/app_button.dart';
import 'package:hti_library_admin/core/util/widgets/app_text_form_field.dart';
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
  TextEditingController nameController = TextEditingController();
  TextEditingController editionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController pagesController = TextEditingController();
  TextEditingController overviewController = TextEditingController();
  TextEditingController bookNumController = TextEditingController();
  TextEditingController classificationNumController = TextEditingController();

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
                        getBooksMethod: () {
                          MainCubit.get(context).getCatBooks(
                              category: widget.category,
                              library: widget.library,
                              type: widget.type);
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
                                hint: appTranslation(context).bookName,
                                textEditingController: nameController,
                              ),
                              space15Vertical,
                              AppTextFormField(
                                type: TextInputType.number,
                                hint: appTranslation(context).bookEdition,
                                textEditingController: editionController,
                              ),
                              space15Vertical,
                              AppTextFormField(
                                type: TextInputType.name,
                                hint: appTranslation(context).bookAuthor,
                                textEditingController: authorController,
                              ),
                              space15Vertical,
                              AppTextFormField(
                                type: TextInputType.number,
                                hint: appTranslation(context).bookPages,
                                textEditingController: pagesController,
                              ),
                              space15Vertical,
                              AppTextFormField(
                                type: TextInputType.number,
                                hint: appTranslation(context).bookNumber,
                                textEditingController: bookNumController,
                              ),
                              space15Vertical,
                              AppTextFormField(
                                type: TextInputType.number,
                                hint: appTranslation(context).bookCopies,
                                textEditingController: amountController,
                              ),
                              space15Vertical,
                              AppTextFormField(
                                type: TextInputType.number,
                                hint: 'Classification Number',
                                textEditingController:
                                classificationNumController,
                              ),
                              space15Vertical,
                              AppTextFormField(
                                type: TextInputType.text,
                                hint: 'Overview',
                                textEditingController: overviewController,
                              ),
                              space30Vertical,
                              AppButton(
                                label: appTranslation(context).save,
                                onPress: () {
                                  Navigator.pop(context);
                                  MainCubit.get(context).createBook(
                                    library: widget.library,
                                    type: widget.type,
                                    name: nameController.text,
                                    edition: num.parse(editionController.text),
                                    rate: 1,
                                    auther: authorController.text,
                                    pages: num.parse(pagesController.text),
                                    category: widget.category,
                                    bookNum: num.parse(bookNumController.text),
                                    amount: num.parse(amountController.text),
                                    classificationNum:
                                    classificationNumController.text,
                                    overview: overviewController.text,
                                  );
                                  MainCubit.get(context).getCatBooks(
                                      category: widget.category, library: widget.library, type: widget.type);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
            label: Text(appTranslation(context).addBook),
            icon: const Icon(Icons.add),
            backgroundColor: HexColor(mainColorL),
          ),
        );
      },
    );
  }
}