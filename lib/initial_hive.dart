import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'features/home/data/models/transaction_model.dart';

Future<void> initializeHive() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>('transactions');
}

/* import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'features/home/data/models/transaction_model.dart';

Future<void> initializeHive() async {
  // Memastikan inisialisasi Flutter telah dilakukan
  WidgetsFlutterBinding.ensureInitialized();

  // Mendapatkan direktori aplikasi
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();

  // Inisialisasi Hive dan mengatur direktori penyimpanan
  await Hive.initFlutter(appDocumentDir.path);

  // Mendaftarkan adapter untuk Transaction model
  Hive.registerAdapter(TransactionAdapter());

  // Membuka kotak Hive untuk menyimpan objek Transaction
  await Hive.openBox<Transaction>('transactions');
}
 */