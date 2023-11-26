import 'package:accounting_book_keeping/providers/provider_chart_of_account.dart';
import 'package:accounting_book_keeping/providers/provider_transaction.dart';
import 'package:accounting_book_keeping/screens/navigation_screen.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'classes/chart_of_account.dart';
import 'classes/transaction.dart';
import 'constance/constance.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter());
  Hive.registerAdapter(ChartOfAccountsAdapter());
  boxChartOfAccounts =await Hive.openBox("chart_of_accounts_db");
  boxTransactions = await Hive.openBox("transactions_db");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderTransactions(),),
        ChangeNotifierProvider(create: (context) => ProviderChartOfAccount(),),
      ],
      child: const FluentApp(
        debugShowCheckedModeBanner: false,
        title: 'book keeping',
        home: NavigationScreen(),
      ),
    );
  }
}

