import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_desktop_app/state/a_best_selling_product_bloc/abest_selling_product_bloc.dart';

import '../state/analytics_best_selling_bloc/analytics_best_selling_bloc.dart';
import '../state/analytics_overview_bloc/analytics_overview_bloc.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AnalyticsOverviewBloc()..add(LoadAnalyticsOverview()),
        ),
        BlocProvider(
          create: (context) =>
              AnalyticsBestSellingBloc()..add(LoadBestSelling()),
        ),
        BlocProvider(
          create: (context) =>
              ABestSellingProductBloc()..add(LoadSellingProduct()),
        ),
      ],
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          title: const Text("Analytics Screen"),
        ),
        drawer: _buildDrawer(context),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildAnalyticsOverview(),
                    _buildBestSellingCategory(),
                  ],
                ),
                SizedBox(height: 20),
                _buildChart(),
                SizedBox(height: 20),
                _buildBestProduct(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildAnalyticsOverview() {
  return Container(
    width: 586,
    height: 244,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: BlocBuilder<AnalyticsOverviewBloc, AnalyticsOverviewState>(
      builder: (context, state) {
        if (state is AnalyticsOverviewLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AnalyticsOverviewLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOverViewColumn(
                    state.overview.totalProfit.toString(),
                    'Total Profit',
                  ),
                  _buildOverViewColumn(
                    state.overview.revenue.toString(),
                    'Revenue',
                    Colors.orange,
                  ),
                  _buildOverViewColumn(
                    state.overview.sales.toString(),
                    'Sales',
                    Colors.deepPurpleAccent,
                  ),
                ],
              ),
              Divider(indent: 20, endIndent: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOverViewColumn(
                    state.overview.netPurchaseValue.toString(),
                    'Net purchase value',
                  ),
                  _buildOverViewColumn(
                    state.overview.netSalesValue.toString(),
                    'Net sales value',
                  ),
                  _buildOverViewColumn(
                    state.overview.momProfit.toString(),
                    'MoM profit',
                  ),
                  _buildOverViewColumn(
                    state.overview.yoyProfit.toString(),
                    'YoY profit',
                  ),
                ],
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    ),
  );
}

Widget _buildOverViewColumn(
  String value,
  String title, [
  Color color = Colors.black,
]) {
  return Column(
    children: [
      Text(
        '\$$value',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      SizedBox(height: 15),
      Text(title, style: TextStyle(color: color)),
    ],
  );
}

Widget _buildBestSellingCategory() {
  return Container(
    width: 548,
    height: 244,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: BlocBuilder<AnalyticsBestSellingBloc, AnalyticsBestSellingState>(
      builder: (context, state) {
        if (state is AnalyticsBestSellingLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AnalyticsBestSellingLoaded) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Best selling category', style: TextStyle(fontSize: 20)),
                  TextButton(onPressed: () {}, child: Text('See all')),
                ],
              ),
              SizedBox(
                width: 540,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Category')),
                    DataColumn(label: Text('Turn Over')),
                    DataColumn(label: Text('Increase')),
                  ],
                  rows: state.topSelling.map((topSelling) {
                    return DataRow(
                      cells: [
                        DataCell(Text(topSelling.category)),
                        DataCell(Text(topSelling.turnOver.toString())),
                        DataCell(
                          Text(
                            '${topSelling.increase}%',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    ),
  );
}

Widget _buildChart() {
  return Container(
    width: double.infinity,
    height: 384,
    color: Colors.blue.shade50,
    child: const Center(child: Text('Profit and revenue chart')),
  );
}

Widget _buildBestProduct() {
  return Container(
    height: 306,
    padding: EdgeInsets.only(left: 10, right: 30, top: 10, bottom: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: BlocBuilder<ABestSellingProductBloc, ABestSellingProductState>(
      builder: (context, state) {
        if (state is ABestSellingProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ABestsellingProductLoaded) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Best Selling Product', style: TextStyle(fontSize: 20)),
                  TextButton(onPressed: () {}, child: Text('See all')),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Product')),
                        DataColumn(label: Text('Product ID')),
                        DataColumn(label: Text('Category')),
                        DataColumn(label: Text('Remaining Quantity')),
                        DataColumn(label: Text('Turn Over')),
                        DataColumn(label: Text('Increase')),
                      ],
                      rows: state.sellingProducts.map((product) {
                        return DataRow(
                          cells: [
                            DataCell(Text(product.product)),
                            DataCell(Text(product.productId.toString())),
                            DataCell(Text(product.category)),
                            DataCell(Text(product.remainingQuantity)),
                            DataCell(Text('\$${product.turnOver}')),
                            DataCell(
                              Text(
                                '${product.increase}%',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    ),
  );
}

Widget _buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        const DrawerHeader(child: Text('Menu')),
        ListTile(title: const Text('Dashboard'),  onTap: () => Navigator.pushNamed(context, 'dashboard'),),
        ListTile(
          title: const Text('Orders'),

          onTap: () => Navigator.pushNamed(context, 'order'),
        ),
        const ListTile(title: Text('Delivery')),
        ListTile(
          title: const Text('Customer'),
          onTap: () => Navigator.pushNamed(context, 'customer'),
        ),
        ListTile(
          title: const Text('Menu'),
          onTap: () => Navigator.pushNamed(context, 'menu'),
        ),
        ListTile(title: const Text('Analytics'), onTap: () => Navigator.of(context).pop()),
        const ListTile(title: Text('Payments')),
        const ListTile(title: Text('Inventory')),
        const ListTile(title: Text('Setting')),
        const ListTile(title: Text('Report')),
        const ListTile(title: Text('Log Out')),
      ],
    ),
  );
}
