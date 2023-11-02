import 'package:get/get.dart';
import 'package:punkte_app/screens/charging_points/models/charging_point_args.dart';
import 'package:punkte_app/screens/charging_points/models/charging_points_model.dart';

class ChargingPointDetailsController extends GetxController {

  ChargingPoint? chargingPoint;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      final arguments = Get.arguments as ChargingPointArgs;
      chargingPoint = arguments.chargingPoint;
    }
  }
}