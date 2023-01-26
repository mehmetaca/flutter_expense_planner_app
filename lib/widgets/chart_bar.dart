
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../models/transaction_manager.dart';
import 'bar.dart';

class ChartBar extends StatelessWidget {
  final List<Transaction> listTransaction;

  const ChartBar({Key? key, required this.listTransaction}) : super(key: key);

  List<Widget> getDayBarWidgets() {
    List<Widget> listWidget = [];

    Map<int, Map<String, dynamic>> mapWeek = TransactionManager().getWeekSummarize(listTransaction);

    for (var mapDay in mapWeek.values) {
      
      double expenseAmount = mapDay['expenseAmount']!;
      String expenseAmountValue = '\$${expenseAmount.toStringAsFixed(1)}';
      
      Widget dayBarWidget = Expanded(
        child: Bar(
            title: mapDay['shortDayName'],
            value: expenseAmountValue,
            fillPercantage: mapDay['percantage'],
            fillColor: mapDay['color']),
      );

      listWidget.add(dayBarWidget);
    }

    return listWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(2.0),
        height: 160,
        width: double.infinity,
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: getDayBarWidgets(),
        ),
      ),
    );
  }
}
