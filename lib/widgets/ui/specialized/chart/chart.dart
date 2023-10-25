import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/models/expense.dart';
import 'package:flutter_expenses_tracker/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatelessWidget {
  const Chart(this.registeredExpenses, {super.key});

  final List<Expense> registeredExpenses;

  List<Expense> get _chartsData {
    // Create a copy of registeredExpenses
    List<Expense> chartsData = [...registeredExpenses];

    // Get a list of all categories
    List<Category> allCategories = Category.values.toList();

    // Get a set of present categories
    Set<Category> presentCategories = chartsData.map((e) => e.category).toSet();

    // Get missing categories
    List<Category> missingCategories =
        allCategories.where((c) => !presentCategories.contains(c)).toList();

    // Add placeholder expenses for missing categories
    chartsData.addAll(
      missingCategories.map(
        (category) => Expense(
          title: 'Placeholder',
          category: category,
          amount: 0,
          date: DateTime.now(),
        ),
      ),
    );

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
          ColumnSeries<Expense, String>(
            dataSource: _chartsData,
            xValueMapper: (Expense expense, _) =>
                getCapitalizedString(expense.category.name),
            yValueMapper: (Expense expense, _) => expense.amount,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            ),
            pointColorMapper: (Expense expense, _) => categoryColors[expense.category],
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
