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
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) =>
            NewExpense(onAddExpense: _addNewExpense));
  }

  void _addNewExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar( 
        duration: const Duration(seconds: 3),
        content: const Text(
          "Expense Deleted",
        ),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No Expenses Found!!"),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    } else {
      mainContent;
    }
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
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
