import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/models/expense.dart';
import 'package:flutter_expenses_tracker/utils/utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatelessWidget {
  const Chart(this.registeredExpenses, {super.key});

  final List<Expense> registeredExpenses;

  // List<GDPData> get _chartsData {
  //   return const [
  //     GDPData('Food', 50),
  //     GDPData('Travel', 600),
  //     GDPData('Study', 200),
  //     GDPData('Work', 300),
  //     GDPData('Leisure', 300),
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    final double containerHeight =
        MediaQuery.of(context).size.height * 0.4; // 40% of the screen height

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      height: containerHeight,
      child: SfCartesianChart(
        series: <ChartSeries>[
          ColumnSeries<Expense, String>(
            dataSource: registeredExpenses,
            xValueMapper: (Expense expense, _) =>
                getCapitalizedString(expense.category.name),
            yValueMapper: (Expense expense, _) => expense.amount,
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          )
        ],
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(),
      ),
    );
  }
}
