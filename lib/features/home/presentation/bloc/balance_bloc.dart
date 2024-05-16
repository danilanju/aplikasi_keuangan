import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../data/models/transaction_model.dart';

class BalanceCubit extends Cubit<int> {
  BalanceCubit() : super(0) {
    _updateBalance(); // Panggil method untuk mengupdate saldo saat Cubit dibuat

    // Mulai pemantauan perubahan pada Box 'transactions'
    Hive.box<Transaction>('transactions').watch().listen((event) {
      _updateBalance(); // Panggil kembali method untuk mengupdate saldo saat ada perubahan pada Box
    });
  }

  void _updateBalance() {
    final transactionsBox = Hive.box<Transaction>('transactions');
    int totalIncome = 0;
    int totalExpense = 0;

    for (var i = 0; i < transactionsBox.length; i++) {
      final data = transactionsBox.getAt(i);
      if (data != null) {
        totalIncome += data.income;
        totalExpense += data.expanse;
      }
    }

    final totalBalance = totalIncome - totalExpense;
    emit(totalBalance); // Emit saldo sebagai state baru
  }
}
