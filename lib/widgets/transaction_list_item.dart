import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../utils/utils.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    Key? key,
    required this.transaction,
    required this.funcDeleteTask,
  }) : super(key: key);

  final Transaction transaction;
  final Function funcDeleteTask;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Text(
          '\$${transaction.amount.toStringAsFixed(1)}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(getFormattedDate(transaction.date)),
        trailing: IconButton(
          onPressed: () {
            funcDeleteTask(transaction.id);
          },
          icon: Icon(
            Icons.delete,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
    );
  }
}