import 'package:flutter/material.dart';
import 'package:week8/week10/START-CODE/ui/expenses/summary_card.dart';
import '../../models/expense.dart';
import 'expense_form.dart';
import 'expense_item.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _expenses = [
    Expense(
      title: 'Flutter Course',
      amount: 20,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 16,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void onAddClicked(BuildContext context)  async{
    Expense? newExpense = await showModalBottomSheet<Expense>(
      isScrollControlled: false,
      context: context,
      builder: (c) => Center(child: ExpenseForm()),
    );

    // TODO YOUR CODE HERE
    if(newExpense != null){
      setState(() {
        _expenses.add(newExpense);
      });
    } 
    else {
      print("created has been canceled");
    }
  }

  void onExpenseRemoved(int index, DismissDirection direction){
    final removedExpense = _expenses[index];
    final removedIndex = index;  
    setState(() {
      _expenses.removeAt(index);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense deleted.'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _expenses.insert(removedIndex, removedExpense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => {onAddClicked(context)},
            icon: Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: Column(
        children: [
          SummaryCard(expenses: _expenses),
          SizedBox(width: 20,),
          Expanded(
            child: _expenses.isEmpty?
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 24),
                      child: Text(
                        'No expenses found. Start adding some!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                  : ListView.builder(
                    itemCount: _expenses.length,
                    itemBuilder: (context, index) => ExpenseItem(
                      expense: _expenses[index],
                      onExpenseRemoved: (direction)=>onExpenseRemoved(index, direction),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

