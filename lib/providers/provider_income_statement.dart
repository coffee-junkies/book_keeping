import 'package:fluent_ui/fluent_ui.dart';
import '../classes/transaction.dart';

class ProviderIncomeStatement extends ChangeNotifier{

  List<Transaction> listRevenues =[];
  List<Transaction> listCogs = [];
  List<Transaction> listExpenses = [];
  String beginningDate = "";
  String endingDate = "";

  ProviderIncomeStatement();

  selectDate(DateTimeRange dateTimeRange){
    beginningDate = dateTimeRange.start.toString();
    endingDate = dateTimeRange.end.toString();
    print(beginningDate);
    print(endingDate);
    notifyListeners();
  }

}