import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/cubit/state.dart';
import 'package:hti_library_admin/core/util/widgets/asset_svg.dart';
import 'package:hti_library_admin/core/util/widgets/main_scaffold.dart';
import 'package:hti_library_admin/features/add_new_book/presentation/pages/add_new_book.dart';
import 'package:hti_library_admin/features/search/presentation/search.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return MainScaffold(
          scaffold: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    navigateTo(context, AddNewBook());
                  },
                  icon: Icon(
                    Icons.note_add_outlined,
                    size: 20.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    navigateTo(context, SearchPage());
                  },
                  icon: AssetSvg(
                    imagePath: 'search',
                    size: 20.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
              title: Text(
                MainCubit.get(context).isRtl
                    ? MainCubit.get(context)
                            .mainPageTitles[MainCubit.get(context).currentIndex]
                        ['ar']
                    : MainCubit.get(context)
                            .mainPageTitles[MainCubit.get(context).currentIndex]
                        ['en'],
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              titleSpacing: 16.0,
            ),
            body: MainCubit.get(context)
                .mainPages[MainCubit.get(context).currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (int index) {
                MainCubit.get(context).bottomChanged(index);
              },
              unselectedLabelStyle: TextStyle(
                color: MainCubit.get(context).isDark
                    ? HexColor(darkBlue)
                    : HexColor(darkBlue),
                height: 15.0,
                fontSize: 1.0,
              ),
              selectedLabelStyle: const TextStyle(
                height: 15.0,
                fontSize: 1.0,
              ),
              currentIndex: MainCubit.get(context).currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: AssetSvg(
                      color: Theme.of(context).primaryColor,
                      imagePath: MainCubit.get(context).currentIndex == 0
                          ? 'home_soled'
                          : 'home',
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: AssetSvg(
                      color: Theme.of(context).primaryColor,
                      imagePath: MainCubit.get(context).currentIndex == 1
                          ? 'message_account_solid'
                          : 'message_account',
                    ),
                  ),
                  label: 'Messages',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    // child: AssetSvg(
                    //   color: HexColor(mainColor),
                    //   imagePath: MainCubit.get(context).currentIndex == 2
                    //       ? 'save_soled'
                    //       : 'save',
                    // ),
                    child: Icon(
                      MainCubit.get(context).currentIndex == 2
                          ? Icons.book_rounded
                          : Icons.book_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  label: 'Books',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: AssetSvg(
                      color:MainCubit.get(context).isDark
                          ? HexColor(mainColorD)
                          : HexColor(mainColorL),
                      imagePath: MainCubit.get(context).currentIndex == 3
                          ? 'user_soled'
                          : 'user',
                    ),
                  ),
                  label: 'User',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
//test
