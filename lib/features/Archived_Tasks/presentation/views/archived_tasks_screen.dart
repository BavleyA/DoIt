import 'package:flutter/material.dart';

class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Archived Tasks"),
      ),
      body: Center(
        child: Text(
          "Archived Tasks Screen",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
