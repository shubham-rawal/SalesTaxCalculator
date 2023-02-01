import 'package:flutter/material.dart';
import 'package:sales_tax_app/calculator_page.dart';
import 'package:sales_tax_app/constants.dart';
import 'package:sales_tax_app/receipt_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      initialRoute: calculator,
      routes: {
        calculator:(context) => const Calculator(),
        receipt:(context) => const Receipt(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

