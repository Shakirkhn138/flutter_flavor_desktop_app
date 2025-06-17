

import 'package:flutter/cupertino.dart';

class DashBoardHeaderModel {
  final String title;
  final double profit;
  final String profitOrLoss;
  final IconData icon;

  DashBoardHeaderModel ({
    required this.title, required this.profit, required this.profitOrLoss, required this.icon
});
}