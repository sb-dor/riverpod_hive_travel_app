import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_hive_travel_app/features/trip/domain/entities/trip.dart';
import 'package:riverpod_hive_travel_app/features/trip/view/providers/trip_provider.dart';
import 'package:uuid/uuid.dart';

class AddTripPage extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController(text: "City 1");
  final _descController = TextEditingController(text: "Best city ever");
  final _locationController = TextEditingController(text: "Paris");
  final _pictureController = TextEditingController(
      text:
          'https://images.unsplash.com/photo-1499856871958-5b9627545d1a?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D');
  List<String> pictures = [];

  AddTripPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextFormField(
              controller: _descController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            TextFormField(
              controller: _pictureController,
              decoration: const InputDecoration(labelText: 'Photo'),
            ),
            ElevatedButton(
              onPressed: () async {
                pictures.add(_pictureController.text);
                if (_formKey.currentState!.validate()) {
                  final newTrip = Trip(
                    title: _titleController.text,
                    desc: _descController.text,
                    date: DateTime.now().toString(),
                    location: _locationController.text,
                    pictures: pictures,
                    id: const Uuid().v4(),
                  );
                  ref.read(tripRiverpodProvider.notifier).addTrip(newTrip);
                  // Navigator.pop(context);
                }
              },
              child: const Text('Add Trip'),
            ),
          ],
        ),
      ),
    );
  }
}
