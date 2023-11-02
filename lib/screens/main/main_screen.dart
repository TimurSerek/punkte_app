import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:punkte_app/core/resources/colors.dart';
import 'package:punkte_app/core/resources/media_res.dart';
import 'package:punkte_app/screens/charging_points/charging_points_controller.dart';
import 'package:punkte_app/screens/charging_points/charging_points_screen.dart';
import 'package:punkte_app/screens/filter/filter_screen.dart';
import 'package:punkte_app/screens/map/map_screen.dart';
import 'package:punkte_app/screens/profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
      index: _currentIndex,
      children: const [
        MapScreen(),
        ChargingPointsScreen(),
        FilterScreen(),
        ProfileScreen(),
      ],
    ),
      bottomNavigationBar: Container(
        height: 90,
        decoration: const BoxDecoration(
          color: AppColors.yellow,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _BottomNavigationItem(
              icon: MediaRes.menuOne,
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              isSelected: _currentIndex == 0,
            ),
            _BottomNavigationItem(
              icon: MediaRes.menuTwo,
              onTap: () {
                //_controller.onInit();
                setState(() {
                  _currentIndex = 1;
                });
              },
              isSelected: _currentIndex == 1,
            ),
            _BottomNavigationItem(
              icon: MediaRes.menuThree,
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
              isSelected: _currentIndex == 2,
            ),
            _BottomNavigationItem(
              icon: MediaRes.menuFour,
              onTap: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
              isSelected: _currentIndex == 3,
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final String icon;
  final Function onTap;
  final bool isSelected;

  const _BottomNavigationItem({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 28),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.lightYellow : AppColors.yellow,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          height: 35,
          width: 35,
          child: Image.asset(icon),
        ),
      ),
    );
  }
}
