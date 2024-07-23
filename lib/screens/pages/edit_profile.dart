import 'package:flutter/material.dart';

import '../../constant.dart/colors.dart';
import '../../widgets/appBar.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBarWidget(
        title: "Edit Profile",
      ),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [],),
      ),
    );
  }
}
