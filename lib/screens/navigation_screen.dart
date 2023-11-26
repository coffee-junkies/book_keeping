import 'package:accounting_book_keeping/screens/transaction_screen.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';

import 'chart_of_accounts_screen.dart';
import 'income_statement_screen.dart';


class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
          title: WindowTitleBarBox(
            child: const Row(
              children: [
                Expanded(child: Text("Heloo")),

              ],
            ),
          ),
          automaticallyImplyLeading: false
      ),
      pane: NavigationPane(
        size: const NavigationPaneSize(openMinWidth: 250, openMaxWidth: 300),
        displayMode: PaneDisplayMode.compact,
        items:[
          PaneItem(
              icon: const Icon(FluentIcons.chart),
              title: const Text("Chart Of Accounts"),
              body: const ChartsOfAccounts()
          ),
          PaneItem(
              icon: const Icon(FluentIcons.clipboard_list_mirrored),
              title: const Text("Transactions"),
              body: const TransactionScreen()
          ),
          PaneItem(
              icon: const Icon(FluentIcons.money),
              title: const Text("Income Statement"),
              body: const IncomeStatementScreen()
          ),
        ],
        selected: _currentPage,
        onChanged: (index) => setState(() {
          _currentPage = index;
        }),
      ),
    );
  }
}
