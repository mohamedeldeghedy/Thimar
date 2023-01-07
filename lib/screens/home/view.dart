import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/shared/res/colors.dart';

import '../../generated/locale_keys.g.dart';
import 'pages/favorites/view.dart';
import 'pages/feeds/view.dart';
import 'pages/my_account/view.dart';
import 'pages/my_notification/view.dart';
import 'pages/my_order/view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screen = [
    const FeedsScreen(),
     const OrderScreen(),
    const NotificationScreen(),
    const FavoritesScreen(),
    const AccountScreen()
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: LocaleKeys.home.tr()),
          BottomNavigationBarItem(
              icon: const Icon(Icons.text_snippet),
              label: LocaleKeys.my_orders.tr()),
          BottomNavigationBarItem(
              icon: const Icon(Icons.notifications_none_rounded),
              label: LocaleKeys.notifications.tr()),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_border_outlined),
            label: LocaleKeys.favorites.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            label: LocaleKeys.my_account.tr(),
          )
        ],
        selectedItemColor: white,
        unselectedItemColor: Colors.grey,
        backgroundColor: green,
        selectedFontSize: 12.sp,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      body: screen[currentIndex],
    );
  }
}
