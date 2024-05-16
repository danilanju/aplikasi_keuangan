import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../data/models/transaction_model.dart';

enum SortEvent {
  sortByIncomeDescending,
  sortByIncomeAscending,
  sortByExpanseDescending,
  sortByExpanseAscending,
  sortByDateDescending,
  sortByDateAscending,
  showAll,
}

class SortingCubit extends Cubit<List<Transaction>> {
  SortingCubit() : super([]) {
    // Panggil method untuk menampilkan semua transaksi saat Cubit dibuat
    showAllTransactions();
  }

  void showAllTransactions() {
    final transactionsBox = Hive.box<Transaction>('transactions');
    final transactions = transactionsBox.values.toList();
    emit(transactions);
  }

  void sortTransactions(SortEvent event) {
    final transactionsBox = Hive.box<Transaction>('transactions');
    final transactions = transactionsBox.values.toList();

    switch (event) {
      case SortEvent.sortByIncomeDescending:
        transactions.sort((a, b) => b.income.compareTo(a.income));
        emit(transactions
            .where((transaction) => transaction.income > 0)
            .toList());
        break;
      case SortEvent.sortByIncomeAscending:
        transactions.sort((a, b) => a.income.compareTo(b.income));
        emit(transactions
            .where((transaction) => transaction.income > 0)
            .toList());
        break;
      case SortEvent.sortByExpanseDescending:
        transactions.sort((a, b) => b.expanse.compareTo(a.expanse));
        emit(transactions
            .where((transaction) => transaction.expanse > 0)
            .toList());
        break;
      case SortEvent.sortByExpanseAscending:
        transactions.sort((a, b) => a.expanse.compareTo(b.expanse));
        emit(transactions
            .where((transaction) => transaction.expanse > 0)
            .toList());
        break;
      case SortEvent.sortByDateDescending:
        transactions.sort((a, b) => b.date.compareTo(a.date));
        emit(transactions);
        break;
      case SortEvent.sortByDateAscending:
        transactions.sort((a, b) => a.date.compareTo(b.date));
        emit(transactions);
        break;
      case SortEvent.showAll:
        showAllTransactions();
        break;
    }
  }

  void deleteTransaction(String id) {
    print('Deleting transaction with ID: $id');
    final Box<Transaction> transactionBox =
        Hive.box<Transaction>('transactions');
    int index = transactionBox.values
        .toList()
        .indexWhere((transaction) => transaction.id == id);
    transactionBox.deleteAt(index);

    final updatedTransactions = transactionBox.values.toList();
    emit(updatedTransactions);
  }
}
