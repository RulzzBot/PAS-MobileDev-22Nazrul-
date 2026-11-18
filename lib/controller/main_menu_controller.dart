import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pas_nazrul_11pplg3/menu/feat.dart';
import 'package:pas_nazrul_11pplg3/menu/home.dart';

import '../menu/profile.dart';

class MainMenuController extends GetxController{
  final RxInt selectedIndex = 0.obs;
  final List<Widget> listPages = [
    Home(),
    Feat(),
    Profile()
  ];

  void changePage(int index){
    selectedIndex.value = index;
  }
}