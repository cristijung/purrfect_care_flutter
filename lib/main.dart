import 'package:flutter/material.dart';
import 'views/purrfect_home_view.dart';

void main() {
  runApp(const PurrfectCareApp());
}

class PurrfectCareApp extends StatelessWidget {
  const PurrfectCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PurrfectCare MVVM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const PurrfectHomeView(),
    );
  }
}