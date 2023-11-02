import 'package:get/get.dart';
import 'package:punkte_app/screens/charging_points/charging_point_details/charging_point_details_screen.dart';
import 'package:punkte_app/screens/charging_points/charging_points_screen.dart';
import 'package:punkte_app/screens/main/main_screen.dart';
import 'injection_container.dart';

class AppPages {
  static const toMainScreen = '/';
  static const toChargingPointsScreen = '/toChargingPointsScreen';
  static const toChargingPointDetailsScreen = '/toChargingPointDetailsScreen';

  static final routes = [
    GetPage(
      name: toChargingPointsScreen,
      page: () => const ChargingPointsScreen(),
      binding: ChargingPointsBinding(),
    ),

    GetPage(
      name: toMainScreen,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),

    GetPage(
      name: toChargingPointDetailsScreen,
      page: () => ChargingPointDetailsScreen(),
      binding: ChargingPointDetailsBinding(),
    ),
  ];
}
