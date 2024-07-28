import 'package:riverpod_hive_travel_app/features/trip/domain/entities/trip.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel extends Trip {
  @HiveField(1)
  @override
  final String title;

  @HiveField(2)
  @override
  final List<String> pictures;

  @HiveField(3)
  @override
  final String desc;

  @HiveField(4)
  @override
  final String date;

  @HiveField(5)
  @override
  final String location;

  TripModel({
    required this.title,
    required this.pictures,
    required this.desc,
    required this.date,
    required this.location,
  }) : super(
          title: title,
          pictures: pictures,
          desc: desc,
          date: date,
          location: location,
          id: const Uuid().v4(),
        );

  factory TripModel.fromEntity(Trip trip) {
    return TripModel(
      title: trip.title,
      pictures: trip.pictures,
      desc: trip.desc,
      date: trip.date,
      location: trip.location,
    );
  }

// Trip toEntity() => Trip(
//       title: title,
//       pictures: pictures,
//       desc: desc,
//       date: date,
//       location: location,
//     );
}
