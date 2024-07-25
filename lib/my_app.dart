import 'package:expense_tracker_app/widgets/expenses.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Expenses(),
    );
  }
}