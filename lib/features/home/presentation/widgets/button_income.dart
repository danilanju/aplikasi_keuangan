import 'package:finance_app_v1_0/features/home/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_transaction_income_dialog.dart';

class CustomButtonIncome extends StatelessWidget {
  const CustomButtonIncome({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              // Wrap AddTransactionDialog dengan BlocProvider<TransactionCubit>.
              return BlocProvider.value(
                value: BlocProvider.of<TransactionCubit>(context),
                child: AddTransactionDialogIncome(),
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF09814A), // Warna hijau untuk pemasukkan
          minimumSize: Size(double.infinity, 60), // Tinggi tombol sekitar 20
        ),
        child: Text(
          'Income',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
