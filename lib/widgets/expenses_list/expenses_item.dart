import 'package:expense_tracker_app/models/expense.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('৳${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    //Icons passed from the expense.dart located to model folder where it was connected with the List Category
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expense.formaterDate),
                    // SizedBox(height: 8,),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
