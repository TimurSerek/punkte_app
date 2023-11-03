import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punkte_app/core/resources/colors.dart';
import 'package:punkte_app/core/resources/media_res.dart';
import 'package:punkte_app/core/resources/strings.dart';
import 'package:punkte_app/core/resources/text_styles.dart';
import 'package:punkte_app/screens/charging_points/models/charging_points_model.dart';

import 'charging_point_details_controller.dart';

class ChargingPointDetailsScreen extends StatelessWidget {
   const ChargingPointDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      body: _Body(),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  _AppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final ChargingPointDetailsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        padding: const EdgeInsets.only(left: 15),
        onPressed: () {
          Get.back();
        },
        splashColor: Colors.transparent,
        splashRadius: 1,
        icon: Image.asset(MediaRes.back),
      ),
      title: Text(
        _controller.chargingPoint?.location.title ?? '',
        style: AppTextStyles.size24RegularRoboto,
      ),
      actions: [
        IconButton(
            onPressed: () {},
            splashColor: Colors.transparent,
            splashRadius: 1,
            icon: const Icon(
              Icons.favorite_border,
              color: AppColors.black,
              size: 30,
            ) //Image.asset(MediaRes.favorite,),
            ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  _Body({Key? key}) : super(key: key);

  final ChargingPointDetailsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _JobStatus(
                  status: _controller.chargingPoint?.status,
                ),
                const SizedBox(height: 15),
                _ChargingPointID(
                    number: _controller.chargingPoint?.cpNumber ?? ''),
                const SizedBox(height: 4),
                _ChargingPointType(
                  title: _controller.chargingPoint?.model ?? '',
                  type: _controller.chargingPoint?.cpType.toUpperCase() ?? '',
                  power: '${_controller.chargingPoint?.power ?? ''}',
                ),
                const SizedBox(height: 30),
                _WorkTime(
                  startTime: _controller.chargingPoint?.location.workingHoursStart ?? '0:00',
                  endTime: _controller.chargingPoint?.location.workingHoursEnd ?? '0:00',
                ),
                const SizedBox(height: 20),
                _Address(
                    address: _controller.chargingPoint?.location.address ?? '',
                    longitude: _controller.chargingPoint?.location.longitude,
                    latitude: _controller.chargingPoint?.location.latitude),
                const SizedBox(height: 20),
                _Parking(description: _controller.chargingPoint?.location.parkingAccess ?? ''),
                const SizedBox(height: 40),
              ],
            ),
          ),
          _ChargingConnectorsList(),
        ],
      ),
    );
  }
}

class _JobStatus extends StatelessWidget {
  const _JobStatus({
    Key? key,
    required this.status,
  }) : super(key: key);

  final StatusType? status;

  @override
  Widget build(BuildContext context) {
    final color = status != null ? _getStatusColor(status!) : Colors.transparent;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
          color: color.withOpacity(0.16), borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 12,
            width: 12,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            status?.type ?? '',
            style: AppTextStyles.size15RegularRoboto,
          )
        ],
      ),
    );
  }

  Color _getStatusColor(StatusType status) {
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

class _ChargingPointID extends StatelessWidget {
  const _ChargingPointID({Key? key, required this.number}) : super(key: key);

  final String number;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(AppStrings.chargingPointID, style: AppTextStyles.size15RegularRobotoFGrey),
        Text(number, style: AppTextStyles.size15RegularRoboto),
      ],
    );
  }
}

class _ChargingPointType extends StatelessWidget {
  const _ChargingPointType({
    Key? key,
    required this.title,
    required this.type,
    required this.power,
  }) : super(key: key);

  final String title;
  final String type;
  final String power;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width / 2,
          ),
          child: Text(title,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.size15BoldRoboto),
        ),
        const SizedBox(width: 20),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: type == 'AC' ? AppColors.green : AppColors.red,
              borderRadius: BorderRadius.circular(6),),
          child: Center(
            child: Text(
              type,
              style: AppTextStyles.size12RegularRobotoBlack,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '$power ${AppStrings.kvt}',
          style: AppTextStyles.size15RegularRoboto,
        )
      ],
    );
  }
}

class _WorkTime extends StatelessWidget {
  const _WorkTime({
    Key? key,
    required this.startTime,
    required this.endTime,
  }) : super(key: key);

  final String startTime;
  final String endTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          AppStrings.workTime,
          style: AppTextStyles.size15RegularRobotoFGrey,
        ),
        SizedBox(
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    startTime,
                    style: AppTextStyles.size15RegularRoboto,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.lightFadeGrey, width: 2))),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    endTime,
                    style: AppTextStyles.size15RegularRoboto,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.greenLine, width: 2))),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _Address extends StatelessWidget {
  const _Address({
    Key? key,
    required this.address,
    required this.longitude,
    required this.latitude,
  }) : super(key: key);

  final String address;
  final double? longitude;
  final double? latitude;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        const Text(
          AppStrings.address,
          style: AppTextStyles.size15RegularRobotoFGrey,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                address,
                maxLines: 2,
                style: AppTextStyles.size15RegularRoboto,
              ),
              const SizedBox(height: 4),
              if(longitude != null && latitude != null)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$longitude $latitude',
                    style: AppTextStyles.size13MediumRobotoFGrey,
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(MediaRes.copy)),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class _Parking extends StatelessWidget {
  const _Parking({Key? key, required this.description}) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          AppStrings.parking,
          style: AppTextStyles.size15RegularRobotoFGrey,
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Text(
              description,
              style: AppTextStyles.size15RegularRoboto,
            ))
      ],
    );
  }
}

class _ChargingConnectorsList extends StatelessWidget {
  _ChargingConnectorsList({Key? key}) : super(key: key);

  final ChargingPointDetailsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      padding: const EdgeInsets.only(left: 20),
      child: ListView.builder(
        itemCount: _controller.chargingPoint?.connectors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _ItemList(connector:  _controller.chargingPoint?.connectors[index]);
        },
      ),
    );
  }
}

class _ItemList extends StatelessWidget {
  const _ItemList({Key? key, required this.connector}) : super(key: key);

  final Connector? connector;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: Container(
          margin: const EdgeInsets.only(right: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.lightFadeGrey,
              width: 1.0,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _ConnectorStatus(status: connector?.status),
              //не нашел поле image connector в GraphQL
              const _ConnectorImage(image: MediaRes.connector),
              _ConnectorDescription(
                id: connector?.typeId,
                name: '${connector?.typeName}',
                power: '${connector?.tariffs.first.price} ${AppStrings.tariff}',
              ),
            ],
          )),
    );
  }
}

class _ConnectorStatus extends StatelessWidget {
  _ConnectorStatus({
    Key? key,
    required this.status,
  }) : super(key: key);

  ConnectorStatusType? status;

  @override
  Widget build(BuildContext context) {
    final color = status != null ? _getStatusColor(status!) : AppColors.red;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
        decoration: BoxDecoration(
            color: color.withOpacity(0.16),
            borderRadius: BorderRadius.circular(6)),
        child: Text(
          status?.type ?? '',
          style: AppTextStyles.size11MediumRoboto.copyWith(color: color),
        ));
  }

  Color _getStatusColor(ConnectorStatusType status){
    switch (status) {
      case ConnectorStatusType.available:
        return AppColors.green;
      case ConnectorStatusType.unavailable:
        return AppColors.red;
      case ConnectorStatusType.preparing:
        return AppColors.yellow;
      case ConnectorStatusType.charging:
        return AppColors.red;
      case ConnectorStatusType.suspendedev:
        return AppColors.red;
      case ConnectorStatusType.finishing:
        return AppColors.yellow;
      case ConnectorStatusType.reserved:
        return AppColors.orange;
      case ConnectorStatusType.faulted:
        return AppColors.red;
      case ConnectorStatusType.occupied:
        return AppColors.red;
      default:
        return AppColors.red;
    }
  }
}

class _ConnectorImage extends StatelessWidget {
  const _ConnectorImage({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 60, height: 60, child: Image.asset(image));
  }
}

class _ConnectorDescription extends StatelessWidget {
  const _ConnectorDescription({
    Key? key,
    required this.id,
    required this.name,
    required this.power,
  }) : super(key: key);

  final int? id;
  final String name;
  final String power;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(id != null)
        Text(
          '$id',
          style: AppTextStyles.size11MediumRobotoGrey,
        ),
        Text(
          name,
          style: AppTextStyles.size18MediumRoboto,
        ),
        Text(
          power,
          style: AppTextStyles.size13MediumRobotoBlack,
        ),
      ],
    );
  }
}
