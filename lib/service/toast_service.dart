import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tezda_task_project/constant.dart/colors.dart';


class ToastService {
  void success(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.inputBoxStroke,
        textColor: Colors.green,
        fontSize: 12.0);
  }

  void error(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.inputBoxStroke,
        textColor: Colors.red,
        fontSize: 12.0);
  }
}
