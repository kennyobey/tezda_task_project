
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tezda_task_project/mixins/loading_mixin.dart';

export 'package:get/get.dart';

abstract class BaseUiController extends GetxController
    with LoadingMixin {

  Future<bool> hasNetwork() async {
    final bool isConnected = await Connectivity().checkConnectivity() != ConnectivityResult.none;
    if (!isConnected) {
      Get.showSnackbar(GetSnackBar(
        dismissDirection: DismissDirection.horizontal,
        duration: Durations.short1,
        message: "No internet connection found.",
        backgroundColor: Colors.red,
        icon: const Icon(Icons.signal_wifi_connected_no_internet_4, color: Colors.white70),
        onTap: (snack) => Get.back(),
      ));
    }
    return isConnected;
  }
}