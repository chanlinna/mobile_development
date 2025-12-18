import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
 
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  Category _selectedCategory = Category.food;
  DateTime? selectedDate = DateTime.now();

  @override
  void dispose(){
    super.dispose();

    _titleController.dispose();
    _amountController.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2025, 12, 12),
      firstDate: DateTime(2025),
      lastDate: DateTime(2026),
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }

  void onCreate() {
    //  1 Build an expense

    // i also need to create repetition widget for showDialog
    if (_titleController.text.trim().isEmpty) { //should have a boolean to check if my title is valid or my amount is valid 
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text("The title cannot be empty."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return; 
    }

    if (_amountController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text("The amount cannot be empty."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return; 
    }
    String  title = _titleController.text;
    double amount = double.parse(_amountController.text);
    Category category = _selectedCategory;   // for now..
    DateTime? date = selectedDate ?? DateTime.now();

    // ignore: unused_local_variable
    Expense newExpense = Expense(title: title, amount: amount, date: date!, category: category);


    // TODO YOUR CODE HERE
    Navigator.pop<Expense>(context, newExpense);
  }
  
  void onCancel() {
   
    // Close the modal
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: InputDecoration(prefixText: '\$', labelText: "Amount"),
                  maxLength: 50,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              SizedBox(width: 20,),
              Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 20,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        selectedDate != null
                            ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                            : 'No date selected',
                      ),
                      SizedBox(width: 10,),
                      ElevatedButton(onPressed: _selectDate, child: Icon(Icons.calendar_month)),
                    ],
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownMenu<Category>( //should learn about dropdown button
                initialSelection: _selectedCategory,
                onSelected: (Category? value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
                dropdownMenuEntries: Category.values.map((category) {
                  return DropdownMenuEntry<Category>(
                    value: category,
                    label: category.name.toUpperCase(),
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: onCancel, child: Text("Cancel")),
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: onCreate, child: Text("Save Expense")),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
