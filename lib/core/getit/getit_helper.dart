import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_hive_travel_app/features/trip/data/datasource/impl/trip_local_database.dart';
import 'package:riverpod_hive_travel_app/features/trip/data/datasource/impl/trip_remote_database.dart';
import 'package:riverpod_hive_travel_app/features/trip/data/datasource/trip_datasource.dart';
import 'package:riverpod_hive_travel_app/features/trip/data/models/trip_model.dart';
import 'package:riverpod_hive_travel_app/features/trip/data/repository/trip_repo_impl.dart';
import 'package:riverpod_hive_travel_app/features/trip/domain/repository/trip_repo.dart';
import 'package:riverpod_hive_travel_app/features/trip/facade/trip_facade.dart';

final getIt = GetIt.instance;

abstract final class GetItHelper {
  static Future<void> initTrip() async {
    final tripBox = await Hive.openBox<TripModel>("trip_model_box");

    getIt.registerLazySingleton<TripDatasource>(
      () => TripLocalDatabase(tripBox),
      instanceName: "local",
    );

    getIt.registerLazySingleton<TripDatasource>(
      () => TripRemoteDatabase(),
      instanceName: "remote",
    );

    final repoImpl = TripRepoImpl();

    repoImpl.initDataSource();

    getIt.registerLazySingleton<TripRepo>(
      () => repoImpl,
    );

    getIt.registerLazySingleton<TripFacade>(
      () => TripFacade(
        getIt<TripRepo>(),
      ),
    );
  }
}
