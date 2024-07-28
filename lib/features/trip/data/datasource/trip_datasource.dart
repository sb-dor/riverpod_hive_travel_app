import 'package:riverpod_hive_travel_app/features/trip/data/models/trip_model.dart';
import 'package:riverpod_hive_travel_app/features/trip/domain/entities/trip.dart';

abstract interface class TripDatasource {
  Future<List<TripModel>> getTrips();

  Future<void> addTrips(Trip trip);

  Future<void> deleteTrip(Trip trip);
}
