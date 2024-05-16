import 'package:flutter/material.dart';

import 'package:hive/hive.dart';

import '../../data/models/transaction_model.dart';

class AddTransactionDialogIncome extends StatelessWidget {
  const AddTransactionDialogIncome({super.key});

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
            decoration: const InputDecoration(labelText: 'Income'),
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
            final int income = int.parse(nominalController.text);

            final String description = detailController.text;
            final Transaction transaction = Transaction(
              id: DateTime.now()
                  .millisecondsSinceEpoch
                  .toString(), // Atur ID sesuai kebutuhan Anda
              income: income,
              expanse: 0,
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
            // Menampilkan isi kotak di console
            print('Content of the transactions box:');
            transactionBox.values.forEach((transaction) {
              print(
                  'ID: ${transaction.id}, Income: ${transaction.income}, Expense: ${transaction.expanse}, Date: ${transaction.date}, Description: ${transaction.description}');
            });

            /* // Mengambil nilai dari controller
            int income = int.tryParse(nominalController.text) ?? 0;
            String detail = detailController.text;

            // Membuat objek Transaction baru
            Transaction newTransaction = Transaction(
              id: DateTime.now().millisecondsSinceEpoch,
              income: income,
              expanse:
                  0, // Tidak ada pengeluaran di sini, sesuaikan dengan kebutuhan Anda
              date: DateTime.now(),
              description: detail,
            );

            // Menambahkan data baru ke dalam Cubit
            context.read<TransactionCubit>().addTransaction(newTransaction);
 */
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
