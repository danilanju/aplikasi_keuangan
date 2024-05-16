import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../data/models/transaction_model.dart';

class TransactionCubit extends Cubit<List<Transaction>> {
  TransactionCubit() : super([]) {
    loadTransactions(); // Memuat transaksi saat inisialisasi
    // Memulai pemantauan perubahan pada Box 'transactions'
    Hive.box<Transaction>('transactions').watch().listen((event) {
      loadTransactions(); // Memuat ulang transaksi saat ada perubahan pada Box
    });
  }

  void loadTransactions() {
    final transactionsBox = Hive.box<Transaction>('transactions');
    final transactions = transactionsBox.values.toList();
    emit(transactions);
  }

  void deleteTransaction(String id) {
    print('Deleting transaction with ID: $id');
    final Box<Transaction> transactionBox =
        Hive.box<Transaction>('transactions');
    // Mencari index transaksi berdasarkan ID
    int index = transactionBox.values
        .toList()
        .indexWhere((transaction) => transaction.id == id);
    transactionBox.deleteAt(index);

    final updatedTransactions = transactionBox.values.toList();
    emit(updatedTransactions);
  }
}


/* TransactionCubit()
      : _transactionBox = Hive.box<Transaction>('transactions'),
        super([]) {
    loadTransactions();
  }

  void loadTransactions() {
    emit(_transactionBox.values.toList());
  } */