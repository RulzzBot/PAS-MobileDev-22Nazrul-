import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_nazrul_11pplg3/modul/makanan_model.dart';

class ListMakananController extends GetxController{
  final List<MakananModel> listMakanan = [
    MakananModel(
        namaMakanan: "Nasi Goreng Spesial", 
        harga: 25000,
        deskripsi: "Nasi goreng bumbu rempah dengan telur mata sapi,ayam suwir, dan kerupuk." , 
        gambar: 'web/icons/Icon-192.png'),
    MakananModel(
        namaMakanan: "Ayam Bakar Madu",
        harga: 30000,
        deskripsi: "Ayam bakar olesan madu murni lengkap dengan sambalterasi dan lalapan." ,
        gambar: 'web/icons/Icon-192.png'),
    MakananModel(
        namaMakanan: "Sate Ayam Madura",
        harga: 28000,
        deskripsi: "10 tusuk sate ayam daging pilihan dengan siramanbumbu kacang kental." ,
        gambar: 'web/icons/Icon-maskable-192.png'),
    MakananModel(
        namaMakanan: "Mie Ayam Bakso ",
        harga: 28000,
        deskripsi: "10 tusuk sate ayam daging pilihan dengan siramanbumbu kacang kental." ,
        gambar: 'web/icons/Icon-maskable-192.png'),
    MakananModel(
        namaMakanan: "Es Teh Manis Jumbo ",
        harga: 8000,
        deskripsi: "Mie kenyal dengan topping ayam kecap, sawi hijau, dan2 butir bakso sapi." ,
        gambar: 'web/favicon.png'),
  ];
  final RxList<MakananModel> makananList = <MakananModel>[].obs;

  @override
  void onInit(){
    super.onInit();
    makananList.assignAll(listMakanan);
  }

  Future<void> refreshProduk() async {
    await Future.delayed(const Duration(seconds: 1));
    makananList.assignAll(listMakanan);
  }
}