import 'package:expense_tracker_app/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  //recives name parameter from the expenses.dart.
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  //this expenses recived from expenses.dart where the _registeredExpenses passed to this file.
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    //ListView for scrorabble item to view in lists
    return ListView.builder(
      itemCount: expenses.length,

      //Here the declered final value passed on anothe file.
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(
          expenses[index],
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(
          expense: expenses[index],
        ),
      ),
    );
  }
}
