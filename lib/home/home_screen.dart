import 'package:evently_app/home/tabs/favourit/favourite_tab.dart';
import 'package:evently_app/home/tabs/home/home_tab.dart';
import 'package:evently_app/home/tabs/profile/profile_tab.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabsList = [
    HomeTab(), FavouriteTab(), ProfileTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {

            });
          },
          items: [
            buildBottomNavigationBarItem(
              index: 0,
              unSelectedIcon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              lable: AppLocalizations.of(context)!.home,),
            buildBottomNavigationBarItem(
                index: 1,
                unSelectedIcon: Icon(Icons.favorite_border_outlined),
                selectedIcon: Icon(Icons.favorite),
                lable: AppLocalizations.of(context)!.favorite),
            buildBottomNavigationBarItem(
              index: 3,
              unSelectedIcon: Icon(Icons.person_2_outlined),
              selectedIcon: Icon(Icons.person),
              lable: AppLocalizations.of(context)!.profile,),

          ]
      ),
      body: tabsList[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // todo : navigate to add event screen
          Navigator.of(context).pushNamed(AppRoutes.addEventRouteName);
        },
        child: Icon(Icons.add, size: 30, color: AppColors.whiteColor,),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required Widget selectedIcon, required Widget unSelectedIcon,
    required String lable, required int index
  }) {
    return BottomNavigationBarItem(icon: selectedIndex == index ?
    selectedIcon : unSelectedIcon,
        label: lable);
  }
}
