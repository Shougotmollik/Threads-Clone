import 'package:flutter/material.dart';

class AddThreadsScreen extends StatefulWidget {
  const AddThreadsScreen({super.key});

  @override
  State<AddThreadsScreen> createState() => _AddThreadsScreenState();
}

class _AddThreadsScreenState extends State<AddThreadsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('add threads screen screen'),
      ),
    );
  }
}
