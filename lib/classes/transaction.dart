import 'package:hive/hive.dart';
part 'transaction.g.dart';
@HiveType(typeId: 1)
class Transaction {
  @HiveField(0)
  final String dateTime;
  @HiveField(1)
  final String transactionDescription;
  @HiveField(2)
  final double amount;
  @HiveField(3)
  final String category;

  Transaction({required this.dateTime, required this.transactionDescription, required this.amount, required this.category});

}