import 'package:finance_app_v1_0/features/home/presentation/widgets/balance_widget.dart';
import 'package:finance_app_v1_0/features/home/presentation/widgets/button_expanse.dart';
import 'package:finance_app_v1_0/features/home/presentation/widgets/button_income.dart';
import 'package:finance_app_v1_0/features/home/presentation/widgets/list_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          child: Column(
            children: [
              //saldo widget
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: BalanceWidget(),
              ),

              //button income & expanse
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    CustomButtonIncome(),
                    SizedBox(
                      width: 10,
                    ),
                    CustomButtonExpanse(),
                  ],
                ),
              ),

              //list tile
              ListWidget(),
              //ListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
