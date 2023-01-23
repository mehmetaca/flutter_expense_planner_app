
import 'package:flutter/material.dart';
import '../models/transaction.dart';

import '../utils/utils.dart';
import '../widgets/header_bar.dart';
import '../widgets/transaction_list.dart';
import 'new_transaction_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Transaction> listTransaction = [];

  @override
  void initState() {
    super.initState();

    // for testing with random items uncomment the below line if it is in comment
    listTransaction = getRandomListTransaction();
  }



  void addNewTaskWithParams( String title, double amount,  DateTime date) {
    final Transaction trans = Transaction(
        title: title, date: date, amount: amount, id: getRandomId());

    setState(() {
      listTransaction.add(trans);
    });
  }

  void addNewTask(Transaction trans) {
    setState(() {
      listTransaction.add(trans);
    });
  }

  void deleteTask(int id) {
    //TODO: refactore method by using listTransaction.removeWhere
    for (Transaction trans in listTransaction) {
      if (trans.id == id) {
        setState(() {
          listTransaction.remove(trans);
        });
        return;
      }
    }
  }

  void showAddNewTransactionModal(BuildContext ctx) {

    showModalBottomSheet(context: ctx, builder: (context)
    {
      return NewTransactionScreen(funcAddNewTaskWithParams: addNewTaskWithParams);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Planner'),
        actions: [
          IconButton(
              onPressed: () {
                showAddNewTransactionModal(context);
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddNewTransactionModal(context);
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        HeaderBar(listTransaction: listTransaction,),
          Expanded(
            child: TransactionList(listTransaction: listTransaction, funcDeleteTask: deleteTask, ),
          ),

        ],
      ),
    );
  }
}
