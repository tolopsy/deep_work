import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deep Work',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: TimerScreen(),
    );
  }
}

class TimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deep Work Timer'),
      ),
      body: Center(
        child: Text('Focus on what matters'),
      ),
    );
  }
}
