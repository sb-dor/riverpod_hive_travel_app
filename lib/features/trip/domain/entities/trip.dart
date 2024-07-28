import 'package:uuid/uuid.dart';

class Trip {
  final String title;
  final List<String> pictures;
  final String desc;
  final String date;
  final String location;

  final String id;

  Trip({
    required this.title,
    required this.pictures,
    required this.desc,
    required this.date,
    required this.location,
    required this.id,
  });
}
