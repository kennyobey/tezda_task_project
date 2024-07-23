import 'package:get/get.dart';
import 'package:tezda_task_project/routes/pages.dart';

class BottomNavController extends GetxController {
  final currentIndex = 0.obs;
  final _pages = [
    Routes.home,
    //Routes.shopPage,
  ];

  onTabSelected(int value) {
    if (currentIndex.value != value) {
      currentIndex.value = value;
      Get.offNamed(_pages[value]);
    }
  }
}
