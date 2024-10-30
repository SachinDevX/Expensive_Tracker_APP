import 'package:flutter/material.dart';

import '../datetime/date_time_helper.dart';
import '../models/expensive_item.dart';


class ExpenseData extends ChangeNotifier{
  // List of the expenses
  List<ExpenseItem> overallExpenseList = [];

  // Get expense list
  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

  // Add new expense
  void addNewExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);
    notifyListeners();
  }

  // Delete expense
  void deleteExpense(ExpenseItem expense) {
    overallExpenseList.remove(expense);
    notifyListeners();
  }

  // Get weekday (Mon, Tues, etc.) from a DateTime object
  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tues';
      case 3:
        return 'Wed';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  // Get the date for the start of the week (Sunday)
  DateTime startOfWeekData() {
    DateTime? startOfWeek;
    //get today date
    DateTime today = DateTime.now();

    // Go backward from today to find Sunday
    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sun') {
        return today.subtract(Duration(days: i));
      }
    }
    return today; // Return today if no Sunday is found (default)
  }

  // Calculate daily expense summary
  Map<String, double> calculateDailyExpensesummary() {
    Map<String, double> dailyExpensesSummary = {};

    for (var expense in overallExpenseList) {
      String date = convertDateTimeToString(expense.dateTime);
      double amount = double.parse(expense.amount);

      // Add to the total for the day, or initialize it if not present
      if (dailyExpensesSummary.containsKey(date)) {
        double currentAmount = dailyExpensesSummary[date]!;
        currentAmount += amount;
        dailyExpensesSummary[date] = currentAmount;
      } else {
        dailyExpensesSummary.addAll({date: amount});
      }
    }

    return dailyExpensesSummary;
  }
}
