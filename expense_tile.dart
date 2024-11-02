import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpenseTile extends StatelessWidget {
  final String amount;
  final String name;
  final DateTime dateTime;
  void Function(BuildContext) ? deleTapped;
   ExpenseTile({
    super.key,
    required this.amount,
    required this.name,
    required this.dateTime,
    required this.deleTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
          motion: const StretchMotion(), 
          children: [
            //delete button
            SlidableAction(
              onPressed: deleTapped,
              icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(4.0),)
          ]),
      child: ListTile(
        title: Text(name),
        subtitle:Text(
          '${dateTime.day}/${dateTime.month}/${dateTime.year}',
        ),
        trailing: Text('\$'+amount)
          ,
      ),
    );
  }
}
