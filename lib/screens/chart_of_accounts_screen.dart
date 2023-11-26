
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
    isSelected =  List<bool>.generate(context.read<ProviderChartOfAccount>().chartOfAccountsList.length, (int index) => false);
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
        header: PageHeader(
          title: const Text("Chart of Accounts"),
          commandBar: CommandBar(
            mainAxisAlignment: MainAxisAlignment.end,
            overflowBehavior: CommandBarOverflowBehavior.wrap,
            primaryItems: [
              CommandBarBuilderItem(
                builder: (context, mode, w) => Tooltip(
                  message: "Create something new!",
                  child: w,
                ),
                wrappedItem: CommandBarButton(
                  icon: const Icon(FluentIcons.add),
                  label: const Text('New'),
                  onPressed: () async {
                    bool isDone = await _showAddDialog(false, null, null);
                    if(isDone) {
                      setState(() {
                        accountList;
                      });
                    }
                  },
                ),
              ),
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
                  mat.DataColumn(label: Text('Options'), numeric: true),
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
          mat.DataCell(
              Text(accountList[index].numericSystem.toString())),
          mat.DataCell(Text(accountList[index].name)),
          mat.DataCell(Text(accountList[index].type)),
          mat.DataCell(Text(accountList[index].description)),
          mat.DataCell(
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(onTap: () async {
                  bool isPressed = await _showAddDialog(true, accountList[index], index);
                  if(isPressed){
                    setState(() {
                      accountList;
                    });
                  }
                }, child: const Icon(FluentIcons.edit)),
                const Gap(30),
                GestureDetector(onTap: (){
                  setState(() {
                    _deleteSelected(index, accountList[index]);
                  });
                },child: const Icon(FluentIcons.delete))
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
        .toList();
  }

  _showAddDialog(bool isEditing, ChartOfAccounts? e, int? index) async {
    if(e != null){
      categoryController.text = e.name;
      numericSystemController.text = e.numericSystem.toString();
      selectedType = e.type;
      descriptionController.text = e.description;
    }
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
                  height: 450,
                  width: 500,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoLabel(
                          label: 'Enter Numerical System:',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Assets: 100-199"),
                              const Text("Liabilities: 200-299"),
                              const Text("Equity: 300-399"),
                              const Text("Revenue: 400-499"),
                              const Text("Expenses: 500-599"),
                              const Gap(10),
                              TextBox(
                                autofocus: true,
                                controller: numericSystemController,
                                placeholder: 'Number',
                                expands: false,
                              ),
                            ],
                          ),
                        ),
                        const Gap(20),
                        InfoLabel(
                          label: 'Enter Account Name:',
                          child: TextBox(
                            controller: categoryController,
                            placeholder: 'Account Name',
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
                            items: typeOfAccount.map((e) {
                              return ComboBoxItem(
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (selected) =>
                                setState(() => selectedType = selected!),
                          ),
                        ),
                        const Gap(20),
                        InfoLabel(
                          label: 'Enter Description:',
                          child: TextBox(
                            minLines: 1,
                            maxLines: 5,
                            controller: descriptionController,
                            placeholder: 'Description',
                            expands: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  Button(
                    onPressed: () {
                      //for editing function
                      if(e!=null && index != null){
                        _deleteSelected(index, e);
                      }
                      //adding function
                      ChartOfAccounts chartOfAccounts = ChartOfAccounts(
                          numericSystem:
                          int.parse(numericSystemController.text),
                          name: categoryController.text,
                          type: selectedType,
                          description: descriptionController.text);

                      context.read<ProviderChartOfAccount>().addChartOfAccount(chartOfAccounts);
                      boxChartOfAccounts.put(chartOfAccounts.name, chartOfAccounts);

                      categoryController.clear();
                      descriptionController.clear();
                      numericSystemController.clear();
                      Navigator.pop(context, true);

                    },
                    child: const Text('Add'),
                  ),
                  Button(
                      child: const Text('Cancel'),
                      onPressed: () {
                        categoryController.clear();
                        selectedType = typeOfAccount[0];
                        descriptionController.clear();
                        numericSystemController.clear();
                        Navigator.pop(context, false);
                      }
                  ),
                ],
              );
            },
          );
        });
  }

  _deleteSelected(int index, ChartOfAccounts chartOfAccounts) {
    context.read<ProviderChartOfAccount>().deleteChartOfAccount(index);
    boxChartOfAccounts.delete(chartOfAccounts.name);
  }
}
