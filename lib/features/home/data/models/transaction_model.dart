import 'package:hive/hive.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 1)
class Transaction {
  Transaction({
    required this.id,
    required this.income,
    required this.expanse,
    required this.date,
    required this.description,
  });

  @HiveField(0)
  String id;

  @HiveField(1)
  int income;

  @HiveField(2)
  int expanse;

  @HiveField(3)
  DateTime date;

  @HiveField(4)
  String description;
}
