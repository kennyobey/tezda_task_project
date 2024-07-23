import 'package:get/get.dart';
import 'package:tezda_task_project/screens/authentication/login_page.dart';
import 'package:tezda_task_project/screens/pages/home_page.dart';

import '../screens/screen_binding.dart';


abstract class Routes {
  Routes._();
  static const home = '/home';
  static const loginPage = '/login';
  static const signupPage = '/signup';
 
}

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () =>  HomePage(),
      binding: BottomNavBinding(),
      middlewares: [
       // SubscribersMiddleware()
      ]
    ),
    GetPage(
      name: Routes.loginPage,
      page: () =>  LoginPage(),
      binding: LoginBinding(),
    ),
   
  ];
}
