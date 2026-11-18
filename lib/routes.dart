
import 'package:pas_nazrul_11pplg3/page/detail_makanan_page.dart';
import 'package:pas_nazrul_11pplg3/page/login_page.dart';
import 'package:get/get.dart';
import 'package:pas_nazrul_11pplg3/page/main_menu_page.dart';
class Routes {
  static const String loginPage ='/loginPage';
  static const String mainMenuPage = '/mainMenuPage';
  static const String detailMakananPage = '/detailMakananPage';

  static final pages = [
    GetPage(name: loginPage, page: () => LoginPage()),
    GetPage(name: mainMenuPage, page: () => MainMenuPage()),
    GetPage(name: detailMakananPage, page: () => DetailMakananPage()),
  ];
}