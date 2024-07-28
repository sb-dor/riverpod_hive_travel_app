import 'package:riverpod_hive_travel_app/features/trip/domain/entities/trip.dart';
import 'package:riverpod_hive_travel_app/features/trip/domain/repository/trip_repo.dart';

class AddTrimRepo {
  final TripRepo _repo;

  AddTrimRepo(this._repo);

  Future<void> call(Trip trip) => _repo.addTrips(trip);
}
