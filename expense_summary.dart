import 'package:expensive_track/bar%20graph/bar_graph.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/expense_data.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfweek;

  const ExpenseSummary({
    super.key,
    required this.startOfweek,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(

      builder: (context, value, child) =>
          SizedBox(
            height: 20,
            child: MyBarGraph(
              maxY: 100,
              monamount: 20,
              tuesamount: 40,
              wedamount: 10,
              thursamount: 70,
              friamount: 35,
              satamount: 25,
              sunamount: 45,
            ),

          ),
    );
  }
}
