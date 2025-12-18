import 'package:flutter/material.dart';
import 'package:week8/week10/START-CODE/models/expense.dart';
import 'package:week8/week10/START-CODE/ui/expenses/statistic_card.dart';

class SummaryCard extends StatelessWidget {
  final List<Expense> expenses;
  const SummaryCard({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10), 
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(12), 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: Category.values.map((category) {
          return StatisticCard(
            expenses: expenses,
            category: category,
          );
        }).toList(),
      ),
    );
  }
}