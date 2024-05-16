import 'package:finance_app_v1_0/features/home/presentation/bloc/balance_bloc.dart';
import 'package:finance_app_v1_0/features/home/presentation/bloc/bloc.dart';
import 'package:finance_app_v1_0/features/home/presentation/bloc/sorting_bloc.dart';

import 'package:finance_app_v1_0/initial_hive.dart';
import 'package:finance_app_v1_0/sekeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await initializeHive();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TransactionCubit(),
          ),
          BlocProvider(
            create: (context) => BalanceCubit(),
          ),
          BlocProvider(
            create: (context) => SortingCubit(),
          )
        ],
        child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFF08415C),
          ),
          home: Sekeleton(),
        ));
  }
}
