import 'package:expensive_track/components/expense_tile.dart';
import 'package:expensive_track/data/expense_data.dart';
import 'package:expensive_track/models/expensive_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  //text controller
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();
  //add new expense
  void addNewExpense(){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Add New Expense'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //expense name
              TextField(
                controller: newExpenseNameController,
              ),

              //expense amount
              TextField(
                controller: newExpenseAmountController,
              ),
            ],
          ),
          actions: [
            //save button
            MaterialButton(
                onPressed: save,
                child: Text('Save'),
            ),
            //cancel button
            MaterialButton(
                onPressed: cancel,
                child: Text('Cancel'))
          ],
        )
    );
  }
  void save(){
    //create expense item
    ExpenseItem newExpense = ExpenseItem(
    name: newExpenseNameController.text,
    amount: newExpenseAmountController.text,
    dateTime: DateTime.now(),
    );
    Provider.of<ExpenseData>(context,listen: false).addNewExpense(newExpense);
    Navigator.pop(context);
    clear();
  }


  void cancel(){
    Navigator.pop(context);
    clear();
  }
  void clear(){
    newExpenseAmountController.clear();
    newExpenseNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
        builder: (context, value, child) =>Scaffold(
          backgroundColor: Colors.grey[300],
          floatingActionButton: FloatingActionButton(
            onPressed: addNewExpense,
            child: Icon(Icons.add),
          ),
          body: ListView.builder(
              itemCount: value.getAllExpenseList().length,
              itemBuilder :(context, index) => ExpenseTile(
                  amount: value.getAllExpenseList()[index].amount,
                  name: value.getAllExpenseList()[index].name,
                  dateTime: value.getAllExpenseList()[index].dateTime,
              ),

          ),
        ),
    );
  }
}
