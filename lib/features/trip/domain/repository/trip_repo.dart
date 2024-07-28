import 'package:riverpod_hive_travel_app/features/trip/domain/entities/trip.dart';

abstract interface class TripRepo {
  Future<List<Trip>> getTrips();

  Future<void> addTrips(Trip trip);

  Future<void> deleteTrip(Trip trip);
}
