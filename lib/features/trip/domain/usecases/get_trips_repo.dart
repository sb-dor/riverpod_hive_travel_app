import 'package:riverpod_hive_travel_app/features/trip/domain/entities/trip.dart';
import 'package:riverpod_hive_travel_app/features/trip/domain/repository/trip_repo.dart';

class GetTripsRepo {
  final TripRepo _repo;

  GetTripsRepo(this._repo);

  Future<List<Trip>> call() {
    return _repo.getTrips();
  }
}
