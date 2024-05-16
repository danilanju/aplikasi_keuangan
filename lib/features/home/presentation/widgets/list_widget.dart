import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/transaction_model.dart';
import '../bloc/bloc.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, List<Transaction>>(
      builder: (context, transactions) {
        // Balik urutan elemen-elemen dalam list
        transactions = transactions.reversed.toList();
        return Expanded(
          child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              Transaction transaction = transactions[index];
              String keterangan = transaction.income > 0 ? 'Masuk' : 'Keluar';
              Color textColor =
                  keterangan == 'Masuk' ? Colors.green : Colors.red;
              int jumlahUang = transaction.income > 0
                  ? transaction.income
                  : transaction.expanse.abs();
              String formattedDate =
                  '${transaction.date.day}/${transaction.date.month}/${transaction.date.year} ${transaction.date.hour}:${transaction.date.minute}';
              return ListTile(
                title: Text(
                  'Rp.${jumlahUang}',
                  style: TextStyle(color: textColor),
                ),
                subtitle: Text(
                  keterangan,
                  style: TextStyle(color: textColor),
                ),
                trailing: Text('Date: $formattedDate'),
              );
            },
          ),
        );
      },
    );
  }
}
