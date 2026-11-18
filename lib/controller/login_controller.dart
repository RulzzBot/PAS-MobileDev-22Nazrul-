import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../modul/login_model.dart';
import '../routes.dart';

class LoginController extends GetxController{

  TextEditingController txtUser = TextEditingController();
  TextEditingController txtPass = TextEditingController();

  var isLoading = false.obs;
  var loginModel = Rxn<LoginModel>();

  void login() async{
    if(txtUser.text.isEmpty && txtPass.text.isEmpty){
      Get.snackbar('Error', 'Please input username and password');
    }else{
      try{
        isLoading.value = true;
        final url =Uri.parse("https://mediadwi.com/api/latihan/login");
        final response = await http.post(url, body: {
          "username": txtUser.text,
          "password": txtPass.text
        });
        isLoading.value = false;
        if(response.statusCode == 200){
          Get.snackbar('Success', 'Login Success');
          loginModel.value = loginModelFromJson(response.body);
          Get.offNamed(Routes.mainMenuPage);
        }else{
          Get.snackbar('Error', 'Login Failed');
        };
      }catch(err){
        Get.snackbar('Error', err.toString());
      }
    }
  }
}