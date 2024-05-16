import 'package:flutter/material.dart';

import 'package:hive/hive.dart';

import '../../data/models/transaction_model.dart';

class AddTransactionDialogExpense extends StatelessWidget {
  const AddTransactionDialogExpense({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nominalController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    //TransactionCubit refresh = context.read<TransactionCubit>();
    return AlertDialog(
      title: const Text('Tambah Data'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nominalController,
            decoration: const InputDecoration(labelText: 'Expense'),
          ),
          TextField(
            controller: detailController,
            decoration: const InputDecoration(labelText: 'Detail'),
          ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            final int expanse = int.parse(nominalController.text);

            final String description = detailController.text;
            final Transaction transaction = Transaction(
              id: DateTime.now()
                  .millisecondsSinceEpoch
                  .toString(), // Atur ID sesuai kebutuhan Anda
              income: 0,
              expanse: expanse,
              date: DateTime.now(),
              description: description,
            );
            // Mengambil box yang sudah dibuka
            final Box<Transaction> transactionBox =
                Hive.box<Transaction>('transactions');
            // Menambahkan transaksi ke dalam box
            transactionBox.add(transaction);
            nominalController.clear();
            detailController.clear();

            // Menutup dialog

            Navigator.of(context).pop();
          },
          child: Text('Tambah'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Batal'),
        ),
      ],
    );
  }
}
