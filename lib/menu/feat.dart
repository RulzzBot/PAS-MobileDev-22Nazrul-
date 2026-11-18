import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/feat_controller.dart';
import '../routes.dart';

class Feat extends StatelessWidget {
  Feat({super.key});
  final controller = Get.put(FeatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feat"),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            edgeOffset: 0,
            backgroundColor: Colors.blue,
            color: Colors.white,
            displacement: 30,
            onRefresh: () async {
              await controller.getTeam();
            },
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: controller.teamList.length,
              itemBuilder: (context, index) {
                final produk = controller.teamList[index];
                return Dismissible(
                  key: ValueKey(produk.strTeam),
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
                    controller.teamList.removeAt(index);
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
                            'strTeam': produk.strTeam.toString(),
                            'strStadium': produk.strStadium.toString(),
                            'strBadge': produk.strBadge.toString(),
                            'strDescriptionEn': produk.strDescriptionEn.toString(),
                          },
                        );
                      },
                      child: ListTile(
                        leading: SizedBox(
                          width: 45,
                          height: 45,
                          child: Image.network(
                            produk.strBadge,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.sports_soccer,
                                size: 35,
                                color: Colors.blue,
                              );
                            },
                          ),
                        ),
                        title: Text(produk.strTeam),
                        subtitle: Text(produk.strStadium),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
