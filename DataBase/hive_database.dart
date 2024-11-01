import 'package:expensive_track/models/expensive_item.dart';
import 'package:flutter/gestures.dart';
import 'package:hive/hive.dart';

class Hive_database{
  //reference my box
  final _mybox = Hive.box("expense_database");
  //write data
  void saveData(List<ExpenseItem> allExpense){

    List<List<dynamic>> allExpensesFormatted = [];
    for(var expense in allExpense){
      //convert each expense into list of storable type(Sting , dateTime)
      List<dynamic> expenseFormatted = [
        expense.name,
        expense.amount,
        expense.dateTime,
      ];
      allExpensesFormatted.add(expenseFormatted);

    }
    //finally let store the data in our DATABASE
    _mybox.put("All_Expenses",allExpensesFormatted);

  }
  //read data
List<ExpenseItem> readData(){
    List savedExpenses = _mybox.get("ALl_EXPENSES") ?? [];
    List<ExpenseItem> allExpenses = [];

    for(int i=0; i<savedExpenses.length; i++){
      //collect individual expense data
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      DateTime dateTime = savedExpenses[i][2];

      //create expense item
      ExpenseItem expense = ExpenseItem(
          name: name,
          amount: amount,
          dateTime: dateTime,
      );
      //add expense to overall list of expenses
      allExpenses.add(expense);
    }
    return allExpenses;
}
}
