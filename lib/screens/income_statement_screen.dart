import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as mat;
import 'package:provider/provider.dart';

import '../providers/provider_income_statement.dart';

class IncomeStatementScreen extends StatefulWidget {
  const IncomeStatementScreen({super.key});

  @override
  State<IncomeStatementScreen> createState() => _IncomeStatementScreenState();
}

class _IncomeStatementScreenState extends State<IncomeStatementScreen> {
  DateTimeRange selectedDates = DateTimeRange(start: DateTime.now(), end: DateTime.now());
  @override
  Widget build(BuildContext context) {
    String beginningDate = context.watch<ProviderIncomeStatement>().beginningDate;
    String endingDate = context.watch<ProviderIncomeStatement>().beginningDate;
    return ScaffoldPage(
      header: PageHeader(
        title: const Text("Income Statement"),
        commandBar: CommandBar(
          mainAxisAlignment: MainAxisAlignment.end,
          overflowBehavior: CommandBarOverflowBehavior.wrap,
          primaryItems: [
            CommandBarBuilderItem(
              builder: (context, mode, w) =>
                  Tooltip(
                    message: "Save",
                    child: w,
                  ),
              wrappedItem: CommandBarButton(
                icon: const Icon(FluentIcons.save),
                label: const Text('Save'),
                onPressed: () async {},
              ),
            ),
            CommandBarBuilderItem(
              builder: (context, mode, w) =>
                  Tooltip(
                    message: "Print",
                    child: w,
                  ),
              wrappedItem: CommandBarButton(
                icon: const Icon(FluentIcons.print),
                label: const Text('Print'),
                onPressed: () async {},
              ),
            ),
          ],
        ),
      ),
      content: Container(
        width: double.infinity,
          color: const Color(0xffF3EEEA),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(onPressed: _showDateDialog,
                      child: const Text("Select Date")),
                ),
              ),
              const Text("Date Ranges"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Beginning Date:  $beginningDate"),
                    Text("Ending Date: $endingDate")
                  ],
                ),
              )
            ],
          )),
    );
  }

  _showDateDialog() async {
    DateTimeRange? dateTimeRange = await mat.showDateRangePicker(
        context: context, firstDate: DateTime(2000), lastDate: DateTime(3000));
    if(dateTimeRange == null){

    }else{
      if(mounted){
        context.read<ProviderIncomeStatement>().selectDate(dateTimeRange);
      }
    }
  }
}
