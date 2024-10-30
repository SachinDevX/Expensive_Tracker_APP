import 'package:flutter/material.dart';

class ExpenseTile extends StatelessWidget {
  final String amount;
  final String name;
  final DateTime dateTime;
  const ExpenseTile({
    super.key,
    required this.amount,
    required this.name,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle:Text(
        '${dateTime.day}/${dateTime.month}/${dateTime.year}',
      ),
      trailing: Text('\$'+amount)
        ,
    );
  }
}
