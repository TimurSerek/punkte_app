import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punkte_app/core/app_pages.dart';
import 'package:punkte_app/core/resources/colors.dart';
import 'package:punkte_app/core/resources/media_res.dart';
import 'package:punkte_app/core/resources/strings.dart';
import 'package:punkte_app/core/resources/text_styles.dart';
import 'charging_points_controller.dart';
import 'models/charging_point_args.dart';
import 'models/charging_points_model.dart';

class ChargingPointsScreen extends StatelessWidget {
  const ChargingPointsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _AppBar(),
      body: _Body(),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 20,
      title: SizedBox(
        height: 45,
        child: TextField(
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            filled: true,
            fillColor: AppColors.lightGrey,
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Image.asset(MediaRes.search),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
            hintText: AppStrings.search,
            hintStyle: AppTextStyles.size12RegularRoboto,
          ),
        ),
      ),
    );
  }
}

class _Body extends GetView<ChargingPointsController> {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Obx(
        () => ListView.builder(
            itemCount: controller.chargingPoints.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  Get.toNamed(AppPages.toChargingPointDetailsScreen,
                  arguments: ChargingPointArgs(chargingPoint: controller.chargingPoints[index]));
                },
                  child: _ListItem(chargingPoint: controller.chargingPoints[index]));
            }),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({Key? key, this.chargingPoint}) : super(key: key);
  final ChargingPoint? chargingPoint;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.lightGrey, borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: chargingPoint?.cpType == 'ac'
                        ? AppColors.green
                        : AppColors.red,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                    child: Text(
                  chargingPoint?.cpType.toUpperCase() ?? '',
                  style: AppTextStyles.size20MediumRoboto,
                )),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          chargingPoint?.cpNumber ?? '',
                          style: AppTextStyles.size12RegularRoboto,
                        ),
                        const SizedBox(width: 10),
                        _Clip(
                            backgroundColor: AppColors.white,
                            textColor: AppColors.black,
                            title:
                                '${chargingPoint?.connectors.first.tariffs.first.price.toString()} ${AppStrings.search}'),
                      ],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      chargingPoint?.location.title ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: AppTextStyles.size15BoldRoboto,
                    ),
                    Text(
                      chargingPoint?.location.address ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: AppTextStyles.size10MediumRoboto,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
          Positioned(
              top: 0,
              right: 0,
              child: _Clip(
                title: chargingPoint?.status.type ?? '',
                backgroundColor: chargingPoint?.status != null ? _getStatusColor(chargingPoint!.status) : AppColors.red,
                textColor: AppColors.white,
              )),
        ],
      ),
    );
  }

  Color _getStatusColor(StatusType status){
     switch (status) {
      case StatusType.operative:
        return AppColors.green;
      case StatusType.repair:
        return AppColors.yellow;
      case StatusType.gettingReadyForLaunch:
        return AppColors.green;
      case StatusType.inoperative:
        return AppColors.red;
      case StatusType.unsupervised:
        return AppColors.red;
      default:
        return AppColors.red;
    }
  }
}

class _Clip extends StatelessWidget {
  const _Clip({
    Key? key,
    required this.backgroundColor,
    required this.title,
    required this.textColor,
  }) : super(key: key);

  final Color backgroundColor;
  final Color textColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(16)),
      child: Text(title,
          style: AppTextStyles.size10MediumRoboto.copyWith(color: textColor)),
    );
  }
}
