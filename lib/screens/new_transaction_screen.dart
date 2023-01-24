import 'package:flutter/material.dart';

import '../utils/utils.dart';

class NewTransactionScreen extends StatefulWidget {
  final Function funcAddNewTaskWithParams;

  const NewTransactionScreen({Key? key, required this.funcAddNewTaskWithParams})
      : super(key: key);

  @override
  State<NewTransactionScreen> createState() => _NewTransactionScreenState();
}

class _NewTransactionScreenState extends State<NewTransactionScreen> {
  DateTime? selectedDate;
  TextEditingController tecTitle = TextEditingController();
  TextEditingController tecAmount = TextEditingController();

  void openDatePicker(BuildContext ctx) {
    {
      showDatePicker(
        context: context,
        initialDate: selectedDate != null ? selectedDate! : DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime.now(),
      ).then((selectedValue) {
        if (selectedValue == null) {
          return;
        }
        setState(() {
          selectedDate = selectedValue;
        });
      });
    }
  }

  void addNewTransaction(BuildContext ctx) {
    if (tecAmount.text.isEmpty ||
        tecTitle.text.isEmpty ||
        selectedDate == null) {
      return;
    }

    widget.funcAddNewTaskWithParams(
        tecTitle.text, double.parse(tecAmount.text), selectedDate!);

    Navigator.pop(ctx);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      width: double.infinity,
      height: 500,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            controller: tecTitle,
            keyboardType: TextInputType.text,
            onSubmitted: (_) => addNewTransaction(context),
          ),
          TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: tecAmount,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => addNewTransaction(context),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
              child: Text(
            'Date',
            style: Theme.of(context).textTheme.bodyText2,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(selectedDate != null
                  ? getFormattedDate(selectedDate!)
                  : ''),
              IconButton(
                icon: const Icon(Icons.calendar_month),
                  onPressed: () {
                    openDatePicker(context);
                  }, ),
            ],
          ),

          Divider(height: 5, thickness: 1, color:Colors.grey),
          ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                addNewTransaction(context);
              })
        ],
      ),
    );
  }
}
