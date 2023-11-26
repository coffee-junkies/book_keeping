
import 'package:fluent_ui/fluent_ui.dart';

import '../classes/chart_of_account.dart';
import '../constance/constance.dart';


class ProviderChartOfAccount extends ChangeNotifier{
  List<ChartOfAccounts> chartOfAccountsList = [];

  ProviderChartOfAccount(){
    initList();
  }

  initList() {
    boxChartOfAccounts.values.map((e) => chartOfAccountsList.add(e)).toList();
    notifyListeners();
  }

  addChartOfAccount(ChartOfAccounts account){
    chartOfAccountsList.add(account);
    notifyListeners();
  }

  deleteChartOfAccount(int index){
    chartOfAccountsList.removeAt(index);
    notifyListeners();
  }
}