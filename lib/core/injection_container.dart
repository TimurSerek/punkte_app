import 'package:get/get.dart';
import 'package:punkte_app/screens/charging_points/charging_points_controller.dart';
import 'package:punkte_app/screens/charging_points/charging_points_repository.dart';

import '../screens/charging_points/charging_point_details/charging_point_details_controller.dart';

class ChargingPointsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChargingPointsController>(() => ChargingPointsController(chargingPointsRepository: Get.find()));
    Get.lazyPut<ChargingPointsRepository>(() => const ChargingPointsRepository());
  }
}

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChargingPointsController>(() => ChargingPointsController(chargingPointsRepository: Get.find()));
    Get.lazyPut<ChargingPointsRepository>(() => const ChargingPointsRepository());
  }
}

class ChargingPointDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChargingPointDetailsController>(() => ChargingPointDetailsController());
  }
}
