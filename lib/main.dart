import 'package:flutter/material.dart';
import 'package:hello_flutter/screens/home_screen_6.dart';
import 'package:hello_flutter/services/api_service.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
