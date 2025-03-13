import 'package:flutter/material.dart';
import '../../data/models/entry_model.dart';

class EntryCard extends StatelessWidget {
  final EntryModel entry;

  const EntryCard({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Glycémie: ${entry.sgv} mg/dL"),
        subtitle:
            Text("Direction: ${entry.direction}, Date: ${entry.dateString}"),
      ),
    );
  }
}
