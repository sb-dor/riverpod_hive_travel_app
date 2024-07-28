import 'package:riverpod_hive_travel_app/features/trip/domain/entities/trip.dart';
import 'package:riverpod_hive_travel_app/features/trip/domain/repository/trip_repo.dart';

class DeleteTripRepo {
  final TripRepo _repo;

  DeleteTripRepo(this._repo);

  Future<void> call(Trip trip) => _repo.deleteTrip(trip);
}
