import 'package:riverpod_hive_travel_app/features/trip/data/datasource/trip_datasource.dart';
import 'package:riverpod_hive_travel_app/features/trip/data/models/trip_model.dart';
import 'package:riverpod_hive_travel_app/features/trip/domain/entities/trip.dart';

class TripRemoteDatabase implements TripDatasource {
  @override
  Future<void> addTrips(Trip trip) {
    // TODO: implement addTrips
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTrip(Trip trip) {
    // TODO: implement deleteTrip
    throw UnimplementedError();
  }

  @override
  Future<List<TripModel>> getTrips() {
    // TODO: implement getTrips
    throw UnimplementedError();
  }
}
