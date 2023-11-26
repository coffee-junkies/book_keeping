import 'package:hive/hive.dart';
part 'chart_of_account.g.dart';

@HiveType(typeId: 0)
class ChartOfAccounts{
  @HiveField(0)
  final int numericSystem;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String type;
  @HiveField(3)
  final String description;

  ChartOfAccounts({required this.numericSystem,required this.name, required this.type, required this.description});

}