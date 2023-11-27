
import 'package:fluent_ui/fluent_ui.dart';
import '../classes/chart_of_account.dart';
import '../classes/transaction.dart';
import '../constance/constance.dart';


class ProviderTransactions extends ChangeNotifier {

  List<Transaction> transactionsList = [];

  List<ChartOfAccounts> assetsList = [];
  List<ChartOfAccounts> liabilityList = [];
  List<ChartOfAccounts> equityList = [];
  List<ChartOfAccounts> expensesList = [];
  List<ChartOfAccounts> revenueList = [];


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
