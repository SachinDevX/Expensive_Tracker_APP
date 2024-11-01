import 'package:expensive_track/components/expense_summary.dart';
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
  final newExpenseDollarController = TextEditingController();
  final newExpenseCentsController = TextEditingController();

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
                decoration: InputDecoration(
                  hintText: "Expense Name"
                ),
              ),

              Row(children: [
                //dollars
                Expanded(
                  child: TextField(
                    controller: newExpenseDollarController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Dollar"
                    ),
                  ),
                ),
                //cents
                Expanded(
                  child: TextField(
                    controller: newExpenseCentsController,
                    decoration: const InputDecoration(
                      hintText: "Cents"
                    ),
                  ),
                ),
              ],),

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
    //put dollars and cents together
    String amount = '${newExpenseDollarController.text}.${newExpenseCentsController.text}';
    //create expense item
    ExpenseItem newExpense = ExpenseItem(
      name: newExpenseNameController.text,
      amount: amount,
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
    newExpenseNameController.clear();
    newExpenseCentsController.clear();
    newExpenseCentsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
        builder: (context, value, child) =>Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: addNewExpense,
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      body:ListView(children: [
        //weekly summary
        ExpenseSummary(startOfweek: value.startOfWeekData()),
        const SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics() ,
          itemCount: value.getAllExpenseList().length,
          itemBuilder :(context, index) => ExpenseTile(
            amount: value.getAllExpenseList()[index].amount,
            name: value.getAllExpenseList()[index].name,
            dateTime: value.getAllExpenseList()[index].dateTime,
                ),
               ),
             ],
           ),
        ),
    );
  }
}
