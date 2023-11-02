import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:punkte_app/core/api/graphql_api_client.dart';
import 'models/charging_points_model.dart';

class ChargingPointsRepository {
  const ChargingPointsRepository();

  getChargingPoints() async {
    List<ChargingPoint>? chargingPoints = [];
    try {
      final String query = """query {
       chargingPoints(limit:20){
          limit
          count
          ids
          data{
            id
            boxId
          cpNumber
          locationId
          connectorsIds
          cpType
          power
          reservationLimit
          statusId
          modelId
          model
          ownerCompanyId
          status
          location{
            title
            address
            region
            devices{
              data{
               name
                type
                deviceId
          }
        }
      }
      connectors{
        data{
          power
          status
          tariffs{
            price
          }
        }
      }
    }
  }
      } """;

      final queryResult = await GraphQLApiClient.client.query(
        QueryOptions(document: gql(query)),
      );
      final data = queryResult.data?['chargingPoints'];
      if (data != null && data.isNotEmpty) {
        final chargingPoints = (data['data'] as List<dynamic>)
            .map((pointData) => ChargingPoint.fromJson(pointData))
            .toList();
        return chargingPoints;
      } else {
        return chargingPoints;
      }
    } catch (e) {
      print(e.toString());
      return chargingPoints;
    }
  }
}
