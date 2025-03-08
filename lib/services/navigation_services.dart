import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theadsclone/views/main_nav_Screen/home_screen/home_screen.dart';
import 'package:theadsclone/views/main_nav_Screen/notification_screen/notification_screen.dart';
import 'package:theadsclone/views/main_nav_Screen/profile_screen/profile_screen.dart';
import 'package:theadsclone/views/main_nav_Screen/search_screen/search_screen.dart';
import 'package:theadsclone/views/main_nav_Screen/threads_screen/add_threads_screen.dart';

class NavigationService extends GetxService {
  RxInt currentIndex = 0.obs;
  RxInt previousIndex = 0.obs;

  void updateIndex(int index) {
    previousIndex.value = currentIndex.value;
    currentIndex.value = index;
  }

  void backToPrevIndex() {
    currentIndex.value = previousIndex.value;
  }

  List<Widget> pages() {
    return [
      HomeScreen(),
      SearchScreen(),
      AddThreadsScreen(),
      NotificationScreen(),
      ProfileScreen(),
    ];
  }
}
