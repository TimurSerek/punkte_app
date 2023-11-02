class ChargingPointsModel {
  final int limit;
  final int count;
  final List<String> ids;
  final List<ChargingPoint> data;

  ChargingPointsModel({
    required this.limit,
    required this.count,
    required this.ids,
    required this.data,
  });

  factory ChargingPointsModel.fromJson(Map<String, dynamic> json) {
    final data = (json['data'] as List)
        .map((item) => ChargingPoint.fromJson(item))
        .toList();
    return ChargingPointsModel(
      limit: json['limit'],
      count: json['count'],
      ids: List<String>.from(json['ids']),
      data: data,
    );
  }
}

class ChargingPoint {
  final String id;
  final String boxId;
  final String cpNumber;
  final String locationId;
  final List<String> connectorsIds;
  final String cpType;
  final double power;
  final int reservationLimit;
  final int statusId;
  final int modelId;
  final String model;
  final int ownerCompanyId;
  final StatusType status;
  final Location location;
  final List<Connector> connectors;

  ChargingPoint({
    required this.id,
    required this.boxId,
    required this.cpNumber,
    required this.locationId,
    required this.connectorsIds,
    required this.cpType,
    required this.power,
    required this.reservationLimit,
    required this.statusId,
    required this.modelId,
    required this.model,
    required this.ownerCompanyId,
    required this.status,
    required this.location,
    required this.connectors,
  });

  factory ChargingPoint.fromJson(Map<String, dynamic> json) {
    return ChargingPoint(
      id: json['id'],
      boxId: json['boxId'],
      cpNumber: json['cpNumber'],
      locationId: json['locationId'],
      connectorsIds: List<String>.from(json['connectorsIds']),
      cpType: json['cpType'],
      power: json['power'],
      reservationLimit: json['reservationLimit'],
      statusId: json['statusId'],
      modelId: json['modelId'],
      model: json['model'],
      ownerCompanyId: json['ownerCompanyId'],
      status: (json['status'] as String).toEnumStatusType(),
      location: Location.fromJson(json['location']),
      connectors: (json['connectors']['data'] as List)
          .map((item) => Connector.fromJson(item))
          .toList(),
    );
  }
}

enum StatusType {
  operative('В работе'),
  repair('Ремонт'),
  gettingReadyForLaunch('Подготовка к запуску'),
  inoperative('Не в работе'),
  unsupervised('Автаномно');

  const StatusType(this.type);

  final String type;
}
extension ConvertStatusType on String {
  StatusType toEnumStatusType() {
    switch (this) {
      case 'OPERATIVE':
        return StatusType.operative;
      case 'REPAIR':
        return StatusType.repair;
      case 'GETTING READY FOR LAUNCH':
        return StatusType.gettingReadyForLaunch;
      case 'INOPERATIVE':
        return StatusType.inoperative;
      case 'UNSUPERVISED':
        return StatusType.unsupervised;
      default:
        return StatusType.unsupervised;
    }
  }
}

class Location {
  final String title;
  final String address;
  final String region;
  final double? latitude;
  final double? longitude;
  final String? parkingAccess;
  final String? workingHoursStart;
  final String? workingHoursEnd;
  final List<Device> devices;

  Location({
    required this.title,
    required this.address,
    required this.region,
    required this.latitude,
    required this.longitude,
    required this.parkingAccess,
    required this.workingHoursStart,
    required this.workingHoursEnd,
    required this.devices,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    final devices = (json['devices']['data'] as List)
        .map((item) => Device.fromJson(item))
        .toList();
    return Location(
      title: json['title'],
      address: json['address'],
      region: json['region'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      workingHoursStart: json['workingHoursStart'],
      workingHoursEnd: json['workingHoursEnd'],
      parkingAccess: _getParkingAccess(json['parkingAccess']),
      devices: devices,
    );
  }

  static String _getParkingAccess(String? value){
       if(value == "free"){
         return 'Бесплатный въезд';
       }
       if(value == "not free") {
         return 'Оплачиваемый въезд';
       }
       else {
         return 'Нет данных';
       }
  }
}

class Device {
  final String name;
  final String? type;
  final String? deviceId;

  Device({
    required this.name,
    required this.type,
    this.deviceId,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      name: json['name'],
      type: json['type'],
      deviceId: json['deviceId'],
    );
  }
}

class Connector {
  final double power;
  final int? typeId;
  final String typeName;
  final ConnectorStatusType status;
  final List<Tariff> tariffs;

  Connector({
    required this.power,
    required this.typeName,
    required this.typeId,
    required this.status,
    required this.tariffs,
  });

  factory Connector.fromJson(Map<String, dynamic> json) {
    return Connector(
      power: json['power'],
      typeId: json['typeId'],
      typeName: _getTypeName(json['typeName']),
      status: (json['status'] as String).toEnumConnectorStatusType(),
      tariffs: (json['tariffs'] as List)
          .map((item) => Tariff.fromJson(item))
          .toList(),
    );
  }

  static String _getTypeName(int? value){
    if(value == 1){
      return 'CHAdeMO';
    }
    if(value == 2) {
      return 'CCS 2';
    }
    if(value == 3) {
      return 'TYPE 2';
    }
    else {
      return 'CCS 1';
    }
  }
}

enum ConnectorStatusType {
  available('Свободен'),
  unavailable('Недоступен'),
  preparing('Занят'),
  charging('Заряжает'),
  suspendedev('Разомкнут'),
  finishing('Недоступен'),
  reserved('Забронирован'),
  faulted('Ошибка'),
  occupied('Занят');

  const ConnectorStatusType(this.type);

  final String type;
}
extension ConvertConnectorStatusType on String {
  ConnectorStatusType toEnumConnectorStatusType() {
    switch (this) {
      case 'AVAILABLE':
        return ConnectorStatusType.available;
      case 'PREPARING':
        return ConnectorStatusType.preparing;
      case 'CHARGING':
        return ConnectorStatusType.charging;
      case 'SUSPENDEDEV':
        return ConnectorStatusType.suspendedev;
      case 'FINISHING':
        return ConnectorStatusType.finishing;
      case 'RESERVED':
        return ConnectorStatusType.reserved;
      case 'UNAVAILABLE':
        return ConnectorStatusType.unavailable;
      case 'FAULTED':
        return ConnectorStatusType.faulted;
      case 'OCCUPIED':
        return ConnectorStatusType.occupied;
      default:
        return ConnectorStatusType.faulted;
    }
  }
}

class Tariff {
  final double price;

  Tariff({
    required this.price,
  });

  factory Tariff.fromJson(Map<String, dynamic> json) {
    return Tariff(
      price: json['price'],
    );
  }
}
