import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/transaction_model.dart';
import '../bloc/sorting_bloc.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: BlocBuilder<SortingCubit, List<Transaction>>(
            builder: (context, transactions) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  const Icon(Icons.search, color: Colors.grey),
                                  const SizedBox(width: 8),
                                  const Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Search',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.clear,
                                        color: Colors.grey),
                                    onPressed: () {
                                      // Fungsi untuk menghapus teks pada search bar
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          width: 10,
                        ),

                        // DropdownButton untuk memilih kriteria sorting
                        // PopupMenuButton untuk memilih kriteria sorting
                        PopupMenuButton<SortEvent>(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: const Row(
                              children: [
                                Text('Sort by'),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<SortEvent>>[
                            const PopupMenuItem<SortEvent>(
                              value: SortEvent.sortByIncomeDescending,
                              child: Row(
                                children: [
                                  Text(
                                    'Sort by Income ',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  Icon(
                                    Icons.arrow_upward,
                                    color: Colors.green,
                                  )
                                ],
                              ),
                            ),
                            const PopupMenuItem<SortEvent>(
                              value: SortEvent.sortByIncomeAscending,
                              child: Row(
                                children: [
                                  Text(
                                    'Sort by Income ',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  Icon(
                                    Icons.arrow_downward,
                                    color: Colors.green,
                                  )
                                ],
                              ),
                            ),
                            const PopupMenuItem<SortEvent>(
                              value: SortEvent.sortByExpanseDescending,
                              child: Row(
                                children: [
                                  Text(
                                    'Sort by Expanse ',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  Icon(
                                    Icons.arrow_upward,
                                    color: Colors.red,
                                  )
                                ],
                              ),
                            ),
                            const PopupMenuItem<SortEvent>(
                              value: SortEvent.sortByExpanseAscending,
                              child: Row(
                                children: [
                                  Text(
                                    'Sort by Expanse ',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  Icon(
                                    Icons.arrow_downward,
                                    color: Colors.red,
                                  )
                                ],
                              ),
                            ),
                            const PopupMenuItem<SortEvent>(
                              value: SortEvent.sortByDateDescending,
                              child: Text('Sort by Date (New)'),
                            ),
                            const PopupMenuItem<SortEvent>(
                              value: SortEvent.sortByDateAscending,
                              child: Text('Sort by Date (Old)'),
                            ),
                          ],
                          onSelected: (SortEvent selectedEvent) {
                            // Panggil Cubit untuk melakukan sorting
                            context
                                .read<SortingCubit>()
                                .sortTransactions(selectedEvent);
                          },
                        ),
                      ],
                    ),
                  ),

                  // Daftar transaksi yang sudah di-sorting
                  Expanded(
                    child: ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        Transaction transaction = transactions[index];
                        String keterangan =
                            transaction.income > 0 ? 'Masuk' : 'Keluar';
                        Color textColor =
                            keterangan == 'Masuk' ? Colors.green : Colors.red;
                        int jumlahUang = transaction.income > 0
                            ? transaction.income
                            : transaction.expanse.abs();
                        // Memformat tanggal dan jam tanpa milidetik
                        String formattedDate =
                            '${transaction.date.day}/${transaction.date.month}/${transaction.date.year} ${transaction.date.hour}:${transaction.date.minute}';
                        return ListTile(
                          leading: IconButton(
                            onPressed: () {
                              final String idTransactionToDelete =
                                  transaction.id;
                              // Mengambil ID transaksi dari objek Transaction
                              context
                                  .read<SortingCubit>()
                                  .deleteTransaction(idTransactionToDelete);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                          title: Text(
                            'Rp.$jumlahUang',
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
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
