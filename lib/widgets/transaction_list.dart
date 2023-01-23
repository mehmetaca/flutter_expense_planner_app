
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../utils/utils.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listTransaction;
  final Function funcDeleteTask;

  const TransactionList({
    Key? key,
    required this.listTransaction,
    required this.funcDeleteTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(bottom: 100.0),
        //physics: const NeverScrollableScrollPhysics(),
        //shrinkWrap: false,
        itemCount: listTransaction.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 1,
            margin: const EdgeInsets.all(10),
            child: ListTile(
                leading: Text('\$${listTransaction[index].amount.toStringAsFixed(1)}'),
                title: Text(
                  listTransaction[index].title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                subtitle: Text(getFormattedDate(listTransaction[index].date)),
                trailing: IconButton(
                  onPressed: () {
                    funcDeleteTask(listTransaction[index].id);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                )),
          );
        });
  }
}
