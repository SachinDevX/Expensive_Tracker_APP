import 'package:expensive_track/bar%20graph/bar_graph.dart';
import 'package:expensive_track/datetime/date_time_helper.dart';
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
    //get yyyymmdd for each day of this week
    String sunday = convertDateTimeToString(startOfweek.add(const Duration(days: 0)));
    String monday = convertDateTimeToString(startOfweek.add(const Duration(days: 1)));
    String tuesday = convertDateTimeToString(startOfweek.add(const Duration(days: 2)));
    String wednesday = convertDateTimeToString(startOfweek.add(const Duration(days: 3)));
    String thursday = convertDateTimeToString(startOfweek.add(const Duration(days: 4)));
    String friday = convertDateTimeToString(startOfweek.add(const Duration(days: 5)));
    String saturday = convertDateTimeToString(startOfweek.add(const Duration(days: 6)));

    return Consumer<ExpenseData>(
      

      builder: (context, value, child) =>
          SizedBox(
            height: 200,
            child: MyBarGraph(
              maxY: 100,
              monamount: value.calculateDailyExpensesummary()[monday]??0,
              tuesamount: value.calculateDailyExpensesummary()[tuesday]??0,
              wedamount: value.calculateDailyExpensesummary()[wednesday]??0,
              thursamount: value.calculateDailyExpensesummary()[thursday]??0,
              friamount: value.calculateDailyExpensesummary()[friday]??0,
              satamount: value.calculateDailyExpensesummary()[saturday]??0,
              sunamount: value.calculateDailyExpensesummary()[sunday]??0,
            ),

          ),
    );
  }
}
