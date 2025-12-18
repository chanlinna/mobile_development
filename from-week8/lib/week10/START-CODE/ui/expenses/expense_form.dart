import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:week8/week10/START-CODE/ui/widgets/error_dialog.dart';
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
  final String title = _titleController.text.trim();
  final String amountText = _amountController.text.trim();
  final Category category = _selectedCategory;
  final DateTime date = selectedDate ?? DateTime.now();

  bool isValid = true;
  String errorMessage = '';

  final bool isTitleInvalid = title.isEmpty;
  final bool isAmountInvalid = amountText.isEmpty;

  double? amount;

  if (isTitleInvalid) {
    isValid = false;
    errorMessage = 'The title cannot be empty.';
  }
  else if (isAmountInvalid) {
    isValid = false;
    errorMessage = 'The amount cannot be empty.';
  } 
  else {
    amount = double.tryParse(amountText);
    if (amount == null) {
      isValid = false;
      errorMessage = 'The amount cannot be empty.';
    } 
    else if (amount < 0) {
      isValid = false;
      errorMessage = 'The amount cannot be negative.';
    }
  }

  if (!isValid) {
    showDialog(
      context: context,
      builder: (_) => ErrorDialog(content: errorMessage),
    );
    return;
  }

  final newExpense = Expense(
    title: title,
    amount: amount!,
    date: date,
    category: category,
  );

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
              DropdownMenu<Category>(
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
