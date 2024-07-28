import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_hive_travel_app/features/trip/view/providers/trip_provider.dart';

import 'widgets/custom_search_bar.dart';
import 'widgets/travel_card.dart';

class MyTripsPage extends ConsumerWidget {
  const MyTripsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ref.read(tripListNotifierProvider.notifier).loadTrips();
    final tripList = ref.watch(tripRiverpodProvider);

    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          CustomSearchBar(),
          tripList.isLoading
              ? const CircularProgressIndicator()
              : tripList.when(
                  data: (data) => ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final trip = data[index];
                      return TravelCard(
                        imageUrl: trip.pictures[0],
                        title: trip.title,
                        description: trip.desc,
                        date: DateFormat.yMMMEd()
                            .format(
                              DateTime.parse(trip.date),
                            )
                            .toString(),
                        location: trip.location,
                        onDelete: () {
                          ref.read(tripRiverpodProvider.notifier).deleteTrip(trip);
                        },
                      );
                    },
                  ),
                  error: (e, s) => Text("Error is: $e"),
                  loading: () => const CircularProgressIndicator(),
                ),
        ],
      ),
    );
  }
}
