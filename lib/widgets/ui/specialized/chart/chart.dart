import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/models/expense.dart';
import 'package:flutter_expenses_tracker/models/expense_bucket.dart';
import 'package:flutter_expenses_tracker/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatelessWidget {
  const Chart(this.registeredExpenses, {super.key});

  final List<Expense> registeredExpenses;

  List<ExpenseBucket> get _chartsData {
    List<ExpenseBucket> chartsData = [];

    Category.values.forEach((element) {
      chartsData.add(ExpenseBucket.forCategory(registeredExpenses, element));
    });

    return chartsData;
  }

  @override
  Widget build(BuildContext context) {
    final double containerHeight =
        MediaQuery.of(context).size.height * 0.4; // 40% of the screen height

    final NumberFormat currencyFormatter =
        NumberFormat.currency(symbol: '\$', decimalDigits: 0);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      height: containerHeight,
      child: SfCartesianChart(
        series: <ChartSeries>[
          ColumnSeries<ExpenseBucket, String>(
            dataSource: _chartsData,
            xValueMapper: (ExpenseBucket expenseBucket, _) =>
                getCapitalizedString(expenseBucket.category.name),
            yValueMapper: (ExpenseBucket expenseBucket, _) => expenseBucket.totalExpenses,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            ),
            pointColorMapper: (ExpenseBucket expenseBucket, _) =>
                categoryColors[expenseBucket.category],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          )
        ],
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(numberFormat: currencyFormatter),
      ),
    );
  }
}
