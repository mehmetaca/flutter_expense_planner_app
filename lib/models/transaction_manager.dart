import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_expense_planner_app/models/transaction.dart';
import '../utils/utils.dart';

class TransactionManager
{

  Map<int, Map<String, dynamic>> getWeekSummarize(List<Transaction> listTransaction) {
    Map<int, Map<String, dynamic>> mapWeek = {
      1: {
        'weekDay': 1,
        'shortDayName': 'Mon',
        'expenseAmount': 0.0,
        'percantage': 0.0,
        'color': const Color.fromRGBO(0,63,92, 1)
      },
      2: {
        'weekDay': 2,
        'shortDayName': 'Tue',
        'expenseAmount': 0.0,
        'percantage': 0.0,
        'color': const Color.fromRGBO(55,76,128, 1,)
      },
      3: {
        'weekDay': 3,
        'shortDayName': 'Wed',
        'expenseAmount': 0.0,
        'percantage': 0.0,
        'color': const Color.fromRGBO(122,81,149, 1,)
      },
      4: {
        'weekDay': 4,
        'shortDayName': 'Thu',
        'expenseAmount': 0.0,
        'percantage': 0.0,
        'color': const Color.fromRGBO(188,80,144, 1,)
      },
      5: {
        'weekDay': 5,
        'shortDayName': 'Fri',
        'expenseAmount': 0.0,
        'percantage': 0.0,
        'color': const Color.fromRGBO(239,86,117, 1,)
      },
      6: {
        'weekDay': 6,
        'shortDayName': 'Sat',
        'expenseAmount': 0.0,
        'percantage': 0.0,
        'color': const Color.fromRGBO(255,118,74, 1,)
      },
      7: {
        'weekDay': 7,
        'shortDayName': 'Sun',
        'expenseAmount': 0.0,
        'percantage': 0.0,
        'color': const Color.fromRGBO(255,166,0, 1,)
      },
    };

    double totalAmount = 0.0;
    for (Transaction trans in listTransaction) {
      totalAmount += trans.amount;

      int weekDay = trans.date.weekday;

      mapWeek[weekDay]!['expenseAmount'] += trans.amount;
    }

    for (var weekDay in mapWeek.keys) {
      double dayTotalAmount = mapWeek[weekDay]!['expenseAmount']!;
      double dayPercantage = 0;

      if(totalAmount >0)
      {
        dayPercantage = dayTotalAmount / totalAmount;
      }

      mapWeek[weekDay]!['percantage'] = dayPercantage;
    }

    return mapWeek;
  }

  String getRandomShoppintItem() {

    final shoppingItems = [
      'Skinless white meat',
      'Lean cuts of red meat',
      'Pasta',
      'Rice',
      'Bread',
      'Salt',
      'Pepper',
      'Basil',
      'Oregano',
      'Coriander',
      'Milk',
      'Eggs',
      'Cheese',
      'Yogurt',
      'Cooking oil',
      'Butter'
    ];

    int randomIndex =  Random().nextInt(shoppingItems.length-1);

    String selected = shoppingItems[randomIndex];

    return selected;
  }


  List<Transaction> getRandomListTransaction()
  {
    List<Transaction> listTransaction = [];

    for(int i = 0; i<15; i++)
    {
      listTransaction.add(Transaction(
        title: getRandomShoppintItem(),
        date: DateTime.now().add(Duration(days: i)),
        amount: Random().nextDouble()*10,
        id: getRandomId(),
      )
      );
    }


    return listTransaction;
  }


}