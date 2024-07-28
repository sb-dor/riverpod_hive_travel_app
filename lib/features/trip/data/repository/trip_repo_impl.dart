import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_hive_travel_app/core/getit/getit_helper.dart';
import 'package:riverpod_hive_travel_app/features/trip/data/datasource/trip_datasource.dart';
import 'package:riverpod_hive_travel_app/features/trip/domain/entities/trip.dart';
import 'package:riverpod_hive_travel_app/features/trip/domain/repository/trip_repo.dart';

class TripRepoImpl implements TripRepo {
  late final TripDatasource _tripDatasource;

  Future<void> initDataSource() async {
    // if there is an internet connection
    // check internet and get specific datasource
    // but in our case checking internet is not necessary

    // final internet = await InternetConnectionChecker().hasConnection;
    // if (internet) {
    //   _tripDatasource = getIt<TripDatasource>(instanceName: "remote");
    // } else {
      _tripDatasource = getIt<TripDatasource>(instanceName: "local");
    // }
  }

  @override
  Future<void> addTrips(Trip trip) => _tripDatasource.addTrips(trip);

  @override
  Future<void> deleteTrip(Trip trip) => _tripDatasource.deleteTrip(trip);

  @override
  Future<List<Trip>> getTrips() => _tripDatasource.getTrips();
}
