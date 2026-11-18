import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailMakananController extends GetxController{
  late String namaMakanan;
  late String harga;
  late String deskripsi;
  late String gambar;

  TextEditingController txtProduk = TextEditingController();
  // Menghitung Total
  // Menghitung Jumlah Produk dari input
  // Hitung ppn 0.05 dari harga makanan
  // menghitung total harga makanan dengan ppn
  var hargaMakanan = 0.0.obs;
  var jumlahProduk = 0.obs;
  var total = 0.0.obs;
  var ppn = 0.05.obs;

  void hitungTotal(){

    hargaMakanan.value = double.parse(harga) * int.parse(txtProduk.text);
    ppn.value = hargaMakanan.value * 5 / 100;
    total.value = hargaMakanan.value + ppn.value;
  }

  @override
  void onInit(){
    super.onInit();
    namaMakanan = Get.arguments['namaMakanan'];
    harga = Get.arguments['harga'];
    deskripsi = Get.arguments['deskripsi'];
    gambar = Get.arguments['image'];
  }
}