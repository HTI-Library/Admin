import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/cubit/state.dart';
import 'package:hti_library_admin/core/util/widgets/empty_widget.dart';
import 'package:hti_library_admin/core/util/widgets/loading.dart';
import 'package:hti_library_admin/core/util/widgets/order_book_item.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: Column(
            children: [
              if (state is GetBooksInBorrowLoading)
                const LinearProgressIndicator(),
              if (state is StartBorrowTimeLoading)
                const LinearProgressIndicator(),
              if (state is ReturnBorrowLoading) const LinearProgressIndicator(),
              TabBar(
                labelStyle: Theme.of(context).textTheme.subtitle2,
                labelPadding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                controller: MainCubit.get(context).controller,
                padding: EdgeInsets.zero,
                unselectedLabelColor: HexColor(grey),
                isScrollable: true,
                indicatorColor: HexColor(mainColor),
                labelColor: HexColor(mainColor),
                indicatorSize: TabBarIndicatorSize.label,
                enableFeedback: true,
                tabs: [
                  Container(
                    height: 22.0,
                    alignment: AlignmentDirectional.center,
                    width: MediaQuery.of(context).size.width / 2,
                    child: const Tab(
                      text: 'ORDERS',
                    ),
                  ),
                  Container(
                    height: 22.0,
                    alignment: AlignmentDirectional.center,
                    width: MediaQuery.of(context).size.width / 2,
                    child: const Tab(
                      text: 'DELIVERIES',
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  controller: MainCubit.get(context).controller,
                  children: [
                    Container(
                      child: MainCubit.get(context).borrowModelOrdered != null
                          ? MainCubit.get(context)
                                  .borrowModelOrdered!
                                  .books
                                  .isNotEmpty
                              ? RefreshIndicator(
                                  onRefresh: () async {
                                    return MainCubit.get(context)
                                        .getBooksInBorrowFalse(page: 1);
                                  },
                                  child: ListView.builder(
                                    itemBuilder: (context, index) =>
                                        OrderBookItem(
                                      orders: true,
                                      model: MainCubit.get(context)
                                          .borrowModelOrdered!
                                          .books[index],
                                    ),
                                    itemCount: MainCubit.get(context)
                                        .borrowModelOrdered!
                                        .books
                                        .length,
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Expanded(
                                      child: EmptyWidget(
                                          text: 'No books to present'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FloatingActionButton.extended(
                                        elevation: 0.0,
                                        backgroundColor: HexColor(mainColor),
                                        onPressed: () {
                                          MainCubit.get(context)
                                              .getBooksInBorrowFalse(page: 1);
                                        },
                                        label: const Text('Reload'),
                                        icon: const Icon(Icons.refresh_rounded),
                                      ),
                                    ),
                                  ],
                                )
                          : const LoadingWidget(),
                    ),
                    Container(
                      child: MainCubit.get(context).borrowModelDelivered != null
                          ? MainCubit.get(context)
                                  .borrowModelDelivered!
                                  .books
                                  .isNotEmpty
                              ? RefreshIndicator(
                                  onRefresh: () async {
                                    return MainCubit.get(context)
                                        .getBooksInBorrowTrue(page: 1);
                                  },
                                  child: ListView.builder(
                                    itemBuilder: (context, index) =>
                                        OrderBookItem(
                                      orders: false,
                                      model: MainCubit.get(context)
                                          .borrowModelDelivered!
                                          .books[index],
                                    ),
                                    itemCount: MainCubit.get(context)
                                        .borrowModelDelivered!
                                        .books
                                        .length,
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Expanded(
                                      child: EmptyWidget(
                                          text: 'No books to present'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FloatingActionButton.extended(
                                        elevation: 0.0,
                                        backgroundColor: HexColor(mainColor),
                                        onPressed: () {
                                          MainCubit.get(context)
                                              .getBooksInBorrowTrue(page: 1);
                                        },
                                        label: const Text('Reload'),
                                        icon: const Icon(Icons.refresh_rounded),
                                      ),
                                    ),
                                  ],
                                )
                          : const LoadingWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
