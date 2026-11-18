import 'package:flutter/material.dart';
import 'package:pas_nazrul_11pplg3/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Belajar Flutter",
      initialRoute: Routes.loginPage,
      getPages: Routes.pages,
    );
  }
}