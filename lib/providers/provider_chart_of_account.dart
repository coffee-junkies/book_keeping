import 'package:accounting_book_keeping/constance/constance.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../classes/chart_of_account.dart';
import '../constance/default_values.dart';

class ProviderChartOfAccount extends ChangeNotifier {
  List<ChartOfAccounts> chartOfAccountsList = [];

  ProviderChartOfAccount() {
    initList();
  }

  initList() {
    kChartOfAccounts.map((e) {
      if(boxChartOfAccounts.get(e.numericSystem) == null){
        boxChartOfAccounts.put(e.numericSystem, e);
      }
    }).toList();
    boxChartOfAccounts.values.map((e) => chartOfAccountsList.add(e)).toList();
    notifyListeners();
  }
}
