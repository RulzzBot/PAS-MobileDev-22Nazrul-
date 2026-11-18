import 'package:get/get.dart';
import 'package:http/http.dart' as httpp;
import '../modul/feat_model.dart';

class FeatController extends GetxController {
  var isLoading = false.obs;
  var teamList = <Team>[].obs;

  @override
  void onInit() {
    super.onInit();
    getTeam();
  }

  Future<void> getTeam() async {
    try {
      isLoading.value = true;
      final url = Uri.parse("https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League");
      final response = await httpp.get(url);
      isLoading.value = false;
      if (response.statusCode == 200) {
        final data = premierLeagueModelFromJson(response.body);
        teamList.assignAll(data.teams);
      } else {
        Get.snackbar('Error', 'Failed to get Team');
      }
    } catch (err) {
      isLoading.value = false;
      Get.snackbar('Error', err.toString());
    }
  }
}