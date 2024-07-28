import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_hive_travel_app/core/getit/getit_helper.dart';
import 'package:riverpod_hive_travel_app/features/trip/domain/entities/trip.dart';
import 'package:riverpod_hive_travel_app/features/trip/domain/repository/trip_repo.dart';
import 'package:riverpod_hive_travel_app/features/trip/facade/trip_facade.dart';

part 'trip_provider.g.dart';

@riverpod
class TripRiverpod extends _$TripRiverpod {
  @override
  Future<List<Trip>> build() async {
    bool internet = await InternetConnectionChecker().hasConnection;
    final TripRepo repo;

    // if (internet) {
    //   repo = getIt<TripRepo>(instanceName: "remote");
    // } else {
    // }
    return getIt<TripFacade>().getTripsRepo.call();
  }

  void deleteTrip(Trip trip) async {
    await getIt<TripFacade>().deleteTripRepo.call(trip);
    ref.invalidateSelf();
  }

  void addTrip(Trip trip) async {
    await getIt<TripFacade>().addTrimRepo.call(trip);
    ref.invalidateSelf();
  }
}
