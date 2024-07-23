import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constant.dart/colors.dart';
import '../screens/pages/favourite_page.dart';
import '../screens/pages/home_page.dart';
import '../screens/pages/profile_page.dart';

class MyNavigationBar extends StatefulWidget {
  int selectedIndex;
  MyNavigationBar({super.key, this.selectedIndex = 0});

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    FavouritePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Center(
        child: _widgetOptions.elementAt(widget.selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.primaryWhite,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset("asset/svgs/home_icon.svg"),
              icon: SvgPicture.asset("asset/svgs/un_home_icon.svg"),
              label: "Home",
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset("asset/svgs/shop_icon.svg"),
              icon: SvgPicture.asset("asset/svgs/un_shop_icon.svg"),
              label: "Favourite",
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset("asset/svgs/profile_icon.svg"),
              icon: SvgPicture.asset("asset/svgs/un_profile_icon.svg"),
              label: "Profile",
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: AppColors.primaryGray3,
          unselectedLabelStyle:
              const TextStyle(color: AppColors.primaryGray3, fontSize: 10),
          selectedLabelStyle:
              const TextStyle(color: AppColors.primaryOrange, fontSize: 10),
          selectedItemColor: AppColors.primaryOrange,
          iconSize: 20,
          selectedFontSize: 20,
          unselectedFontSize: 20,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
