import 'package:expensive_track/data/expense_data.dart';
import 'package:expensive_track/pages/home_pages.dart';
import'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenseData(),
      builder: (context,child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(),
      ),
    );
  }
}
