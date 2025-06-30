

class AnalyticsOverviewModel {
  final int totalProfit;
  final int revenue;
  final int sales;
  final int netPurchaseValue;
  final int netSalesValue;
  final int momProfit;
  final int yoyProfit;

  const AnalyticsOverviewModel ({
    required this.totalProfit,
    required this.revenue,
    required this.sales,
    required this.netPurchaseValue,
    required this.netSalesValue,
    required this.momProfit,
    required this.yoyProfit
});
}