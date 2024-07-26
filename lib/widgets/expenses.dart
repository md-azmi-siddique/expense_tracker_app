import 'package:expense_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  // Demo data for presenting a list to the UI
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Food',
        amount: 10.00,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Work',
        amount: 20.00,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Travel',
        amount: 20.00,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: 'Leisure',
        amount: 20.00,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpenses() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) => const NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Expense Tracker"),
        actions: [
          IconButton(
            onPressed: () {
              _openAddExpenses();
            },
            icon: const Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          // const Text("data"),
          Expanded(
            //Here the List sent to the expense_list.dart file.
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
