
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
  List<ChartOfAccounts> costOfGoodSoldList = [];


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
    boxChartOfAccounts.values.map((e) {
      ChartOfAccounts account = e;
      int numericSystem = account.numericSystem;
      if(numericSystem <= 1999){
        assetsList.add(account);
      }else if(numericSystem <= 2999){
        liabilityList.add(account);
      }else if(numericSystem <= 3999){
        equityList.add(account);
      }else if(numericSystem <= 4999){
        revenueList.add(account);
      }else if(numericSystem <= 5999){
        costOfGoodSoldList.add(account);
      }else if(numericSystem < 7999){
        expensesList.add(account);
      }
    }).toList();
    notifyListeners();
  }

}
