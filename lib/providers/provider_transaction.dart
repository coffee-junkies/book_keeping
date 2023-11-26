
import 'package:fluent_ui/fluent_ui.dart';
import '../classes/transaction.dart';
import '../constance/constance.dart';


class ProviderTransactions extends ChangeNotifier {

  List<Transaction> transactionsList = [];


  ProviderTransactions(){
    initList();
  }

  addTransaction(Transaction transaction) {
    transactionsList.add(transaction);
    notifyListeners();
  }

  deleteTransaction(int index){
    transactionsList.removeAt(index);
    notifyListeners();
  }

  initList(){
    boxTransactions.values.map((e) => transactionsList.add(e)).toList();
    notifyListeners();
  }

}
