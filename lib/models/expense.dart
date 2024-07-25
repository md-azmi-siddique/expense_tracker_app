//the model file store the information which type of data should be used.
//Here this properties will describe about the expances like
//a expense might have a title, amount , category and created date and time
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
enum Category {food, travel, work, leisure}
//enum helps to create custom category which holds predefined values

final dateFormat = DateFormat.yMd();

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.travel_explore,
  Category.work: Icons.work,
  Category.leisure: Icons.movie,

};

class Expense {
  Expense
  (
    {
      required this.title, 
      required this.amount, 
      required this.date,
      required this.category
    }
  ) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formaterDate{
    return dateFormat.format(date);
  }
}
