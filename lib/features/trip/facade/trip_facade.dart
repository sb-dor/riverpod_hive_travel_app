import 'package:riverpod_hive_travel_app/features/trip/domain/repository/trip_repo.dart';
import 'package:riverpod_hive_travel_app/features/trip/domain/usecases/add_trim_repo.dart';
import 'package:riverpod_hive_travel_app/features/trip/domain/usecases/delete_trip_repo.dart';
import 'package:riverpod_hive_travel_app/features/trip/domain/usecases/get_trips_repo.dart';

class TripFacade {
  final AddTrimRepo addTrimRepo;
  final DeleteTripRepo deleteTripRepo;
  final GetTripsRepo getTripsRepo;

  TripFacade(TripRepo repo)
      : addTrimRepo = AddTrimRepo(repo),
        deleteTripRepo = DeleteTripRepo(repo),
        getTripsRepo = GetTripsRepo(repo);
}
