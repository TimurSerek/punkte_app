import 'package:get/get.dart';
import 'charging_points_repository.dart';
import 'models/charging_points_model.dart';

class ChargingPointsController extends GetxController {
  ChargingPointsController({
    required this.chargingPointsRepository,
  });

  ChargingPointsRepository chargingPointsRepository;

  RxList<ChargingPoint> chargingPoints = RxList.empty();

  @override
  void onInit() {
    super.onInit();
    _getChargingPoints();
  }

  _getChargingPoints() async {
    final list = await chargingPointsRepository.getChargingPoints();
    return chargingPoints.assignAll(list);
  }
}
