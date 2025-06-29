import 'package:flutter/material.dart';

class DoneTasksScreen extends StatelessWidget {
  const DoneTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Done Tasks"),
      ),
      body: Center(
        child: Text(
          "Done Tasks Screen",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
