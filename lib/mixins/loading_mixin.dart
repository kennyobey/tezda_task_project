import 'package:get/get.dart';

mixin LoadingMixin {
  final isLoading = false.obs;

  void setBusy(bool value) => isLoading.value = value;
  bool get isBusy => isLoading.value;
}
