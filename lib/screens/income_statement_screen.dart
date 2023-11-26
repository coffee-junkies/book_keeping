import 'package:fluent_ui/fluent_ui.dart';

class IncomeStatementScreen extends StatefulWidget {
  const IncomeStatementScreen({super.key});

  @override
  State<IncomeStatementScreen> createState() => _IncomeStatementScreenState();
}

class _IncomeStatementScreenState extends State<IncomeStatementScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: PageHeader(
        title: const Text("Income Statement"),
        commandBar: CommandBar(
          mainAxisAlignment: MainAxisAlignment.end,
          overflowBehavior: CommandBarOverflowBehavior.wrap,
          primaryItems: [
            CommandBarBuilderItem(
              builder: (context, mode, w) => Tooltip(
                message: "Save",
                child: w,
              ),
              wrappedItem: CommandBarButton(
                icon: const Icon(FluentIcons.save),
                label: const Text('Save'),
                onPressed: () async {

                },
              ),
            ),
            CommandBarBuilderItem(
              builder: (context, mode, w) => Tooltip(
                message: "Print",
                child: w,
              ),
              wrappedItem: CommandBarButton(
                icon: const Icon(FluentIcons.print),
                label: const Text('Print'),
                onPressed: () async {

                },
              ),
            ),
          ],
        ),
      ),
      content: Container(color: const Color(0xffF3EEEA),child: const Center(child: Text("Income Statement"),)),
    );
  }
}
