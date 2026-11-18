import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/list_makanan_controller.dart';
import '../routes.dart';

class Home extends StatelessWidget {
  final controller = Get.put(ListMakananController());

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Obx(
        () => RefreshIndicator(
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          edgeOffset: 0,
          backgroundColor: Colors.blue,
          color: Colors.white,
          displacement: 30,
          onRefresh: controller.refreshProduk,
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: controller.makananList.length,
            itemBuilder: (context, index) {
              final produk = controller.makananList[index];
              return Dismissible(
                key: ValueKey(produk.namaMakanan),
                direction: DismissDirection.startToEnd,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                onDismissed: (direction) {
                  controller.makananList.removeAt(index);
                  Get.snackbar(
                    "Produk Dihapus",
                    "Produk berhasil dihapus",
                  );
                },
                child: Card(
                  elevation: 3,
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(
                        Routes.detailMakananPage,
                        arguments: {
                          'namaMakanan': produk.namaMakanan.toString(),
                          'harga': produk.harga.toString(),
                          'deskripsi': produk.deskripsi.toString(),
                          'image': produk.gambar.toString(),
                        },
                      );
                    },
                    child: GestureDetector(
                      onLongPressStart: (details) async {
                        final posisi = details.globalPosition;
                        final size = MediaQuery.of(context).size;
                        final pilihan = await showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(
                            posisi.dx,
                            posisi.dy,
                            size.width - posisi.dx,
                            size.height - posisi.dy,
                          ),
                          items: const [
                            PopupMenuItem(
                              value: 'detail',
                              child: Text('Detail Produk'),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete Produk'),
                            ),
                          ],
                        );
                        switch (pilihan) {
                          case 'detail':
                            Get.toNamed(
                              Routes.detailMakananPage,
                              arguments: {
                                'namaMakanan': produk.namaMakanan.toString(),
                                'harga': produk.harga.toString(),
                                'deskripsi': produk.deskripsi.toString(),
                                'image': produk.gambar.toString(),
                              },
                            );
                            break;
                          case 'delete':
                            controller.makananList.removeAt(index);
                            Get.snackbar(
                              "Produk Dihapus",
                              "Produk berhasil dihapus",
                            );
                            break;
                        }
                      },
                      child: ListTile(
                        leading: SizedBox(
                          width: 45,
                          height: 45,
                          child: Image.asset(
                            produk.gambar,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.fastfood,
                                size: 35,
                                color: Colors.orange,
                              );
                            },
                          ),
                        ),
                        title: Text(produk.namaMakanan),
                        subtitle: Text(produk.harga.toString()),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}