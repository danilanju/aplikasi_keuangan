import 'package:finance_app_v1_0/features/home/presentation/bloc/bloc.dart';
import 'package:finance_app_v1_0/features/home/presentation/widgets/add_transaction_expanse_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonExpanse extends StatelessWidget {
  const CustomButtonExpanse({super.key});

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
                child: AddTransactionDialogExpense(),
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFA31621), // Warna hijau untuk pemasukkan
          minimumSize: Size(double.infinity, 60), // Tinggi tombol sekitar 20
        ),
        child: Text(
          'Expense',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
