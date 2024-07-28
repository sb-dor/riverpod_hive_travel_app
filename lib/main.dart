import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_hive_travel_app/core/getit/getit_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_hive_travel_app/features/trip/data/models/trip_model.dart';
import 'package:riverpod_hive_travel_app/features/trip/view/pages/my_trips_page.dart';
import 'package:riverpod_hive_travel_app/features/trip/view/pages/trip_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TripModelAdapter());
  await GetItHelper.initTrip();
  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: TripPage(),
      ),
    );
  }
}
