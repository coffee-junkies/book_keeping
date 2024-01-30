import 'package:collection/collection.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as mat;
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../classes/chart_of_account.dart';
import '../classes/transaction.dart';
import '../constance/constance.dart';
import '../providers/provider_chart_of_account.dart';
import '../providers/provider_transaction.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  String? selectedType;
  final menuController = FlyoutController();
  int selectedIndex = -1;
  late List<ChartOfAccounts> chartOfAccountsList;
  TextEditingController transactionController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    chartOfAccountsList =
        context.read<ProviderChartOfAccount>().chartOfAccountsList;
    super.initState();
  }

  @override
  void dispose() {
    transactionController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Transaction> transactions =
        context.watch<ProviderTransactions>().transactionsList;
    return ScaffoldPage(
        header: PageHeader(
            title: const Text("Transactions"),
            commandBar: FlyoutTarget(
                controller: menuController,
                child: Button(
                  child: const Text('New Transaction'),
                  onPressed: () {
                    menuController.showFlyout(
                      autoModeConfiguration: FlyoutAutoConfiguration(
                        preferredMode: FlyoutPlacementMode.topCenter,
                      ),
                      barrierDismissible: true,
                      dismissOnPointerMoveAway: false,
                      dismissWithEsc: true,
                      builder: (context) {
                        return MenuFlyout(items: [
                          MenuFlyoutItem(
                            leading: const Icon(FluentIcons.asset_library),
                            text: const Text('Asset'),
                            onPressed: (){
                              Flyout.of(context).close();
                              _showAddDialog("Asset");
                            },
                          ),
                          MenuFlyoutItem(
                            leading: const Icon(FluentIcons.copy),
                            text: const Text('Liability'),
                            onPressed: (){
                              Flyout.of(context).close();
                              _showAddDialog("Liability");
                            },
                          ),
                          MenuFlyoutItem(
                            leading: const Icon(FluentIcons.delete),
                            text: const Text('Equity'),
                            onPressed: (){
                              Flyout.of(context).close();
                              _showAddDialog("Equity");
                            },
                          ),
                          MenuFlyoutItem(
                            leading: const Icon(FluentIcons.delete),
                            text: const Text('Expense'),
                            onPressed: (){
                              Flyout.of(context).close();
                              _showAddDialog("Expense");
                            }
                          ),
                          MenuFlyoutItem(
                            leading: const Icon(FluentIcons.delete),
                            text: const Text('Revenue'),
                            onPressed: (){
                              Flyout.of(context).close();
                              _showAddDialog("Revenue");
                            },
                          ),
                          MenuFlyoutItem(
                            leading: const Icon(FluentIcons.delete),
                            text: const Text('Cost of Goods Sold'),
                            onPressed: (){
                              Flyout.of(context).close();
                              _showAddDialog("Cost of Goods Sold");
                            },
                          ),
                        ]);
                      },
                    );
                  },
                ))),
        content: mat.Material(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: DataTable2(
                showCheckboxColumn: false,
                columnSpacing: 12,
                horizontalMargin: 12,
                dataRowHeight: 55,
                minWidth: 600,
                columns: const [
                  DataColumn2(label: Text('Date & Time'), size: ColumnSize.S),
                  DataColumn2(
                    label: Text('Description/Transaction'),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(label: Text('Amount'), size: ColumnSize.S),
                  mat.DataColumn(
                    label: Text('Category'),
                  ),
                  mat.DataColumn(label: Text('Options'), numeric: true),
                ],
                rows: transactions
                    .mapIndexed(
                      (index, element) => mat.DataRow(
// color: mat.MaterialStateProperty.resolveWith<Color?>(
//     (Set<mat.MaterialState> states) {
//   // All rows will have the same selected color.
//   if (states.contains(mat.MaterialState.selected)) {
//     return mat.Theme.of(context)
//         .colorScheme
//         .primary
//         .withOpacity(0.08);
//   }
//   // Even rows will have a grey color.
//   if (index.isEven) {
//     return Colors.grey.withOpacity(0.3);
//   }
//   return null; // Use default value for other states and odd rows.
// }),
                        cells: <mat.DataCell>[
                          mat.DataCell(Text(DateFormat.yMMMd().format(
                              DateTime.parse(transactions[index].dateTime)))),
                          mat.DataCell(
                              Text(transactions[index].transactionDescription)),
                          mat.DataCell(
                              Text(transactions[index].amount.toString())),
                          mat.DataCell(Text(transactions[index].category)),
                          mat.DataCell(
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                    onTap: () {},
                                    child: const Icon(FluentIcons.edit)),
                                const Gap(30),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _deleteSelected(
                                            index, transactions[index]);
                                      });
                                    },
                                    child: const Icon(FluentIcons.delete))
                              ],
                            ),
                          )
                        ],
                        selected: index == selectedIndex,
                        onSelectChanged: (bool? value) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                    )
                    .toList()),
          ),
        ));
  }

  _showAddDialog(String label) {
    DateTime? selected;
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return ContentDialog(
                title: const Text('Add a new category'),
                content: SizedBox(
                  height: 300,
                  width: 500,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DatePicker(
                          header: 'Pick a date',
                          selected: selected,
                          onChanged: (time) => setState(() => selected = time),
                        ),
                        const Gap(20),
                        InfoLabel(
                          label: 'Describe your Transaction:',
                          child: TextBox(
                            controller: transactionController,
                            placeholder: 'Transaction',
                            expands: false,
                          ),
                        ),
                        const Gap(20),
                        InfoLabel(
                          label: 'Enter Amount',
                          child: TextBox(
                            controller: amountController,
                            placeholder: 'Transaction',
                            expands: false,
                          ),
                        ),
                        const Gap(20),
                        const Text("Select Type"),
                        const Gap(5),
                        SizedBox(
                          width: double.infinity,
                          child: ComboBox<String>(
                            value: selectedType,
                            items: _getList(label).map((e) {
                              return ComboBoxItem(
                                value: e.name,
                                child: Text(e.name),
                              );
                            }).toList(),
                            onChanged: (selected) =>
                                setState(() => selectedType = selected!),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  Button(
                    onPressed: () {
                      Transaction transaction = Transaction(
                          dateTime: selected.toString(),
                          transactionDescription: transactionController.text,
                          amount: double.parse(amountController.text),
                          category: selectedType as String);
                      boxTransactions.put(
                          "${transaction.dateTime}-${transaction.transactionDescription}",
                          transaction);
                      context
                          .read<ProviderTransactions>()
                          .addTransaction(transaction);
                      Navigator.pop(context);
                    },
                    child: const Text('Add'),
                  ),
                  Button(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              );
            },
          );
        });
  }

  _deleteSelected(int index, Transaction transaction) {
    context.read<ProviderTransactions>().deleteTransaction(index);
    boxTransactions.delete(
        "${transaction.dateTime}-${transaction.transactionDescription}");
  }


  List<ChartOfAccounts> _getList(String label){
    List<ChartOfAccounts> list = [];
    switch (label) {
      case "Asset":
        list = context.read<ProviderTransactions>().assetsList;
        break;
      case "Liability":
        list = context.read<ProviderTransactions>().liabilityList;
        break;
      case "Equity":
        list = context.read<ProviderTransactions>().equityList;
        break;
      case "Expense":
        list = context.read<ProviderTransactions>().expensesList;
        break;
      case "Revenue":
        list = context.read<ProviderTransactions>().revenueList;
        break;
      case "Cost of Goods Sold":
        list = context.read<ProviderTransactions>().costOfGoodSoldList;
        break;
    }
    return list;
  }
}
