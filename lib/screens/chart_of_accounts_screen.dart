import 'package:collection/collection.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as mat;
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../classes/chart_of_account.dart';
import '../constance/constance.dart';
import '../providers/provider_chart_of_account.dart';

class ChartsOfAccounts extends StatefulWidget {
  const ChartsOfAccounts({super.key});

  @override
  State<ChartsOfAccounts> createState() => _ChartsOfAccountsState();
}

class _ChartsOfAccountsState extends State<ChartsOfAccounts> {
  late String selectedType;
  int selectedIndex = -1;
  late List<bool> isSelected;
  late List<ChartOfAccounts> accountList;
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController numericSystemController = TextEditingController();

  @override
  void initState() {
    selectedType = typeOfAccount[0];
    accountList = context.read<ProviderChartOfAccount>().chartOfAccountsList;
    isSelected = List<bool>.generate(
        context.read<ProviderChartOfAccount>().chartOfAccountsList.length,
        (int index) => false);
    super.initState();
  }

  @override
  void dispose() {
    numericSystemController.dispose();
    categoryController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
        header: const PageHeader(
          title: Text("Chart of Accounts"),
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
                  mat.DataColumn(
                    label: Text('Numeric System'),
                  ),
                  mat.DataColumn(
                    label: Text('Account Name'),
                  ),
                  mat.DataColumn(
                    label: Text('Type'),
                  ),
                  DataColumn2(
                    label: Text('Description'),
                    size: ColumnSize.L,
                  ),
                ],
                rows: _getDataList()),
          ),
        ));
  }

  _getDataList() {
    return accountList
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
              mat.DataCell(Text(accountList[index].numericSystem.toString())),
              mat.DataCell(Text(accountList[index].name)),
              mat.DataCell(Text(accountList[index].type)),
              mat.DataCell(Text(accountList[index].description)),
            ],
            selected: index == selectedIndex,
            onSelectChanged: (bool? value) {
              setState(() {
                if (selectedIndex == index) {
                  _showSelectedDetail(element);
                }
                selectedIndex = index;
              });
            },
          ),
        )
        .toList();
  }
  _showSelectedDetail(ChartOfAccounts chartOfAccounts) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return ContentDialog(
                title: Text("${chartOfAccounts.numericSystem} - ${chartOfAccounts.name}"),
                content: SizedBox(
                  height: 300,
                  width: 500,
                  child: Column(
                    children: [
                      const Gap(20),
                      Text(chartOfAccounts.type, style: const TextStyle(fontWeight: FontWeight.bold),),
                      const Gap(10),
                      Expanded(child: Text(chartOfAccounts.description)),
                    ],
                  )
                ),
                actions: [
                  Button(child: const Text("Add Description")
                  , onPressed: (){
                    _showEditDialog(chartOfAccounts);
                  })
                ],
              )
              ;
            },
          );
        });
  }
  _showEditDialog(ChartOfAccounts chartOfAccounts) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return ContentDialog(
                title: Text("${chartOfAccounts.numericSystem} - ${chartOfAccounts.name}"),
                content: SizedBox(
                    height: 300,
                    width: 500,
                    child: Column(
                      children: [
                        const Gap(20),
                        Text(chartOfAccounts.type, style: const TextStyle(fontWeight: FontWeight.bold),),
                        const Gap(10),
                        Expanded(child: TextBox(
                          controller: descriptionController,
                        )),
                      ],
                    )
                ),
                actions: [
                  Button(child: const Text("Okay"), onPressed: (){
                    ChartOfAccounts accounts = ChartOfAccounts(numericSystem: chartOfAccounts.numericSystem, name: chartOfAccounts.name, type: chartOfAccounts.type, description: descriptionController.text);
                    boxChartOfAccounts.put(chartOfAccounts.numericSystem, accounts);
                    Navigator.pop(context);
                    Navigator.pop(context);

                  })
                ],
              );
            },
          );
        });
  }
}
