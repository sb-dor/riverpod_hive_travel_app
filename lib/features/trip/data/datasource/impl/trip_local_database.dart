import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_hive_travel_app/features/trip/data/datasource/trip_datasource.dart';
import 'package:riverpod_hive_travel_app/features/trip/data/models/trip_model.dart';
import 'package:riverpod_hive_travel_app/features/trip/domain/entities/trip.dart';

class TripLocalDatabase implements TripDatasource {
  final Box<TripModel> _tripBox;

  TripLocalDatabase(this._tripBox);

  @override
  Future<void> addTrips(Trip trip) async {
    debugPrint("added trip");
    _tripBox.add(TripModel.fromEntity(trip));
  }

  @override
  Future<void> deleteTrip(Trip trip) =>
      _tripBox.deleteAt(_tripBox.values.toList().indexWhere((e) => e.id == trip.id));

  @override
  Future<List<TripModel>> getTrips() async {
    return _tripBox.values.toList();
  }
}
