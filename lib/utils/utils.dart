import 'dart:math';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

int getRandomId() {
  return Random().nextInt(1000000);
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

String getFormattedDate(DateTime dt)
{
  return DateFormat('dd MMM - EEEE').format(dt);
}

String getDayName(DateTime dt)
{
  return DateFormat.E().format(dt);
}
