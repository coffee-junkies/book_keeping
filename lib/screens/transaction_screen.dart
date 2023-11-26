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
  late String selectedType;
  int selectedIndex = -1;
  late List<ChartOfAccounts> chartOfAccountsList;
  TextEditingController transactionController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    chartOfAccountsList =
        context.read<ProviderChartOfAccount>().chartOfAccountsList;
    selectedType = chartOfAccountsList[0].name;
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
          commandBar: CommandBar(
            mainAxisAlignment: MainAxisAlignment.end,
            overflowBehavior: CommandBarOverflowBehavior.wrap,
            primaryItems: [
              _commandBar(message: 'Add Asset', icon: const Icon(FluentIcons.money), label: 'Asset'),
              _commandBar(message: 'Add Liabilities', icon: const Icon(FluentIcons.bank), label: 'Liabilities'),
              _commandBar(message: 'Add Equity', icon: const Icon(FluentIcons.user_clapper), label: 'Equity'),
              _commandBar(message: 'Add Expenses', icon: const Icon(FluentIcons.down), label: 'Expenses'),
              _commandBar(message: 'Add Revenues', icon: const Icon(FluentIcons.revenue_management), label: 'Revenues'),
            ],
          ),
        ),
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

  _showAddDialog() {
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
                            items: chartOfAccountsList.map((e) {
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
                          category: selectedType);
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

  _commandBar({required String message,required Icon icon,required String label}) {
    return CommandBarBuilderItem(
      builder: (context, mode, w) => Tooltip(
        message: message,
        child: w,
      ),
      wrappedItem: CommandBarButton(
        icon: icon,
        label: Text(label),
        onPressed: () async {
          _showAddDialog();
        },
      ),
    );
  }
}
