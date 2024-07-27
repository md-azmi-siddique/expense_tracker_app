import 'package:expense_tracker_app/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.red);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        // appBarTheme: AppBarTheme().copyWith(
        //   backgroundColor: kColorScheme.onPrimaryContainer,
        //   foregroundColor: kColorScheme.primaryContainer,
        // )
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const Expenses(),
    );
  }
}
