class ExpenseItem {
  final String name;
  final String amount;      // Changed from String to double for easier calculations
  final DateTime dateTime;  // Changed from String to DateTime for easier date manipulation

  ExpenseItem({
    required this.name,
    required this.amount,
    required this.dateTime,
  });
}
