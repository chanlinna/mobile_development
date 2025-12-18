import 'package:flutter/material.dart';
import 'package:week8/week10/START-CODE/models/expense.dart';

class StatisticCard extends StatelessWidget {
  final List<Expense> expenses;
  final Category category;
  const StatisticCard({super.key, required this.expenses, required this.category});

  IconData? get expenseIcon {
    switch (category) {
      case Category.food:
        return Icons.free_breakfast;
      case Category.travel:
        return Icons.travel_explore;
      case Category.leisure:
        return Icons.holiday_village;
      case Category.work:
        return Icons.work;
    }
  }

  double get totalAmount{
    double total = 0;
    for(final expense in expenses){
      if(expense.category == category){
        total += expense.amount;
      }
    }
    return total;
  }
  @override
  Widget build(BuildContext context) {
    final double total = totalAmount;
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text("\$$total",
              style: const TextStyle(fontSize: 16),
            ),
            Icon(expenseIcon),
          ],
        ),
      ),
    );
  }
}