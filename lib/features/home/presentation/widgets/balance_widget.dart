import 'package:finance_app_v1_0/features/home/presentation/bloc/balance_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 336 / 184,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Color(0xFF08415C),
        ),
        child: Align(
          alignment: Alignment.center,
          child: BlocBuilder<BalanceCubit, int>(
            builder: (context, balance) {
              return Text(
                'Rp.$balance',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
