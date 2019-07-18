import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    /// constrainas is a feature that flutter provides .. to know how much space that certain widget can take ..
    return LayoutBuilder(
      builder: (cxt, constrains) {
        final widgetHeight = constrains.maxHeight;
        return Column(
          children: <Widget>[
            Container(
                height: widgetHeight * 0.15,
                child: FittedBox(
                    child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
            SizedBox(
              height: widgetHeight * 0.05,
            ),
            Container(
              height: widgetHeight * 0.6,
              width: 10,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        color: Color.fromRGBO(220, 220, 220, 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: widgetHeight * 0.05,
            ),
            Container(height: widgetHeight * 0.15, child: Text(label))
          ],
        );
      },
    );
  }
}
