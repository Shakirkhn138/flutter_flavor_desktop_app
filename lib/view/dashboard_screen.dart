import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_desktop_app/state/dashboard_header/dashboard_header_bloc.dart';
import '../config/app_colors.dart';
import '../state/customer_review_bloc/customer_review_bloc.dart';
import '../state/inventory_summary/inventory_summary_bloc.dart';
import '../state/last_order_bloc/last_order_bloc.dart';
import '../state/product_summary_bloc/product_summary_bloc.dart';
import '../state/purchase_overview/purchase_overview_bloc.dart';
import '../state/sales_overview/sales_overview_bloc.dart';
import '../state/selling_item_bloc/selling_item_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DashboardHeaderBloc()..add(AddHeader()),
        ),
        BlocProvider(
          create: (context) => SalesOverviewBloc()..add(LoadSales()),
        ),
        BlocProvider(
          create: (context) =>
              InventorySummaryBloc()..add(LoadInventorySummary()),
        ),
        BlocProvider(
          create: (context) =>
              PurchaseOverviewBloc()..add(LoadPurchaseOverview()),
        ),
        BlocProvider(
          create: (context) => ProductSummaryBloc()..add(LoadProductSummary()),
        ),
        BlocProvider(
          create: (context) => SellingItemBloc()..add(LoadSellingItem()),
        ),
        BlocProvider(create: (context) => LastOrderBloc()..add(LoadOrder())),
        BlocProvider(create: (context) => CustomerReviewBloc()..add(LoadCustomerReview())),
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
          title: const Text("Dashboard"),
        ),
        drawer: _buildDrawer(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth > 1000) {
                  return Column(
                    children: [
                      _buildHeader(),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          _buildSalesOverview(),
                          _buildInventorySummary(),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          _buildPurchaseOverview(),
                          _buildProductSummary(),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(children: [_buildLineChart(), _buildSellingItem()]),
                      SizedBox(height: 20),
                      Row(children: [_buildBarChart(), _buildLastOrder()]),
                      SizedBox(
                        height: 20,
                      ),
                      Align(alignment: Alignment.topLeft, child: Text('Customer Review', style: TextStyle(fontSize: 20),)),
                      SizedBox(
                        height: 10,
                      ),
                      _buildCustomerReview(),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildHeader() {
  return BlocBuilder<DashboardHeaderBloc, DashboardHeaderState>(
    builder: (context, state) {
      if (state is HeaderLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is HeaderLoaded) {
        return SizedBox(
          height: 160,
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: state.headers.map((header) {
                return Container(
                  width: 272,
                  margin: const EdgeInsets.only(right: 16),
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                header.title,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '\$${header.profit}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(header.profitOrLoss),
                            ],
                          ),
                          Container(
                            width: 49,
                            height: 49,
                            decoration: BoxDecoration(
                              color: AppColors.limeGreenColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(child: Icon(header.icon)),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      }
      return const SizedBox.shrink();
    },
  );
}

Widget _buildSalesOverview() {
  return Align(
    alignment: Alignment.topLeft,
    child: Container(
      width: 650,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.limeGreenColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(Icons.add),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('\$ 832'), Text('Sales')],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            child: VerticalDivider(thickness: 2, color: Colors.grey),
          ),
          SizedBox(
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.limeGreenColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(Icons.add),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('\$ 832'), Text('Revenue')],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            child: VerticalDivider(thickness: 2, color: Colors.grey),
          ),
          SizedBox(
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.limeGreenColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(Icons.add),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('\$ 832'), Text('Profit')],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            child: VerticalDivider(thickness: 2, color: Colors.grey),
          ),
          SizedBox(
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.limeGreenColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(Icons.add),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('\$ 832'), Text('Cost')],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildInventorySummary() {
  return BlocBuilder<InventorySummaryBloc, InventorySummaryState>(
    builder: (context, state) {
      if (State is InventorySummaryLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is InventorySummaryLoaded) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              _buildSummaryCard(
                icon: Icons.inventory_2_outlined,
                iconColor: Colors.orange,
                label: 'Quantity in hand',
                value: state.summary.quantitativeInHand.toString(),
              ),
              _buildSummaryCard(
                icon: Icons.local_shipping_outlined,
                iconColor: Colors.deepPurple,
                label: 'To be received',
                value: state.summary.toBeReceived.toString(),
              ),
            ],
          ),
        );
      }
      return SizedBox.shrink();
    },
  );
}

Widget _buildPurchaseOverview() {
  return Align(
    alignment: Alignment.topLeft,
    child: Container(
      width: 650,
      height: 135,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<PurchaseOverviewBloc, PurchaseOverviewState>(
            builder: (context, state) {
              if (state is PurchaseOverviewLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PurchaseOverviewLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Purchase Overview', style: TextStyle(fontSize: 20)),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        _buildPurchaseCard(
                          Colors.blue.shade50,
                          Icons.shopping_bag_outlined,
                          state.purchase.purchase.toString(),
                          'Purchase',
                        ),
                        SizedBox(
                          height: 60,
                          child: VerticalDivider(
                            thickness: 1.5,
                            color: Colors.grey,
                          ),
                        ),
                        _buildPurchaseCard(
                          Colors.green.shade50,
                          Icons.currency_rupee,
                          '\$${state.purchase.cost}',
                          'Cost',
                        ),
                        SizedBox(
                          height: 60,
                          child: VerticalDivider(
                            thickness: 1.5,
                            color: Colors.grey,
                          ),
                        ),
                        _buildPurchaseCard(
                          Colors.deepPurple.shade50,
                          Icons.cancel_presentation_outlined,
                          state.purchase.cancel.toString(),
                          'Cancel',
                        ),
                        SizedBox(
                          height: 60,
                          child: VerticalDivider(
                            thickness: 1.5,
                            color: Colors.grey,
                          ),
                        ),
                        _buildPurchaseCard(
                          Colors.orange.shade50,
                          Icons.backpack_sharp,
                          '\$${state.purchase.sendBack}',
                          'Return',
                        ),
                      ],
                    ),
                  ],
                );
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    ),
  );
}

Widget _buildProductSummary() {
  return Container(
    width: 460,
    height: 139,
    margin: EdgeInsets.only(left: 20),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        BlocBuilder<ProductSummaryBloc, ProductSummaryState>(
          builder: (context, state) {
            if (state is ProductSummaryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductSummaryLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Product Summary', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      _buildProductCard(
                        Colors.blue.shade50,
                        Icons.person_2_outlined,
                        state.product.numberOfCategory.toString(),
                        'Number of category',
                      ),
                      SizedBox(
                        height: 80,
                        child: VerticalDivider(
                          thickness: 1.5,
                          color: Colors.grey,
                        ),
                      ),
                      _buildProductCard(
                        Colors.purple.shade50,
                        Icons.fact_check,
                        state.product.numberOfSuppliers.toString(),
                        'Number of Suppliers',
                      ),
                    ],
                  ),
                ],
              );
            }
            return SizedBox.shrink();
          },
        ),
      ],
    ),
  );
}

Widget _buildLineChart() {
  return Container(
    color: Colors.blue.shade50,
    width: 864,
    height: 330,
    child: const Center(child: Text('Line Chart')),
  );
}

Widget _buildSellingItem() {
  return Container(
    width: 250,
    height: 330,
    margin: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: BlocBuilder<SellingItemBloc, SellingItemState>(
      builder: (context, state) {
        if (state is SellingItemLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SellingItemLoaded) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Top Selling Item', style: TextStyle(fontSize: 18)),
                const Text(
                  'The top ordered menu\nthis week',
                  style: TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (ctx, index) {
                      final item = state.items[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                'assets/images/pizza.jpg',
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(item.title, style: TextStyle(fontSize: 16)),
                            Spacer(),
                            Text(
                              item.itemsSell.toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    ),
  );
}

Widget _buildBarChart() {
  return Container(
    color: Colors.blue.shade50,
    width: 568,
    height: 320,
    child: const Center(child: Text('Bar Chart')),
  );
}

Widget _buildLastOrder() {
  return Container(
    width: 560,
    height: 300,
    margin: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: BlocBuilder<LastOrderBloc, LastOrderState>(
      builder: (context, state) {
        if (state is LastOrderLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LastOrderLoaded) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Last Orders', style: TextStyle(fontSize: 20)),
                    TextButton(onPressed: () {}, child: Text('View All')),
                  ],
                ),
              ),
              Expanded(
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Order ID')),
                    DataColumn(label: Text('O.Time')),
                    DataColumn(label: Text('Location')),
                    DataColumn(label: Text('Status')),
                  ],
                  rows: state.orders.map((order) {
                    return DataRow(
                      cells: [
                        DataCell(Text('#${order.orderId}')),
                        DataCell(Text(order.orderTime)),
                        DataCell(Text(order.location)),
                        DataCell(Text(order.status)),
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

Widget _buildCustomerReview() {
  return  BlocBuilder<CustomerReviewBloc, CustomerReviewState>(
      builder: (context, state) {
        if (state is CustomerReviewLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CustomerReviewLoaded) {
          return Container(
            height: 226,
            child: ListView.builder(
              itemCount: state.customerReviews.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                final review = state.customerReviews[index];
                return Container(
                  width: 402,
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(review.image),
                        ),
                        SizedBox(
                          height: 50,
                          child: VerticalDivider(
                            thickness: 2,
                            color: Colors.orange,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(review.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            Text(review.location, style: TextStyle(color: Colors.orange, fontSize: 18),),
                            Row(
                              children: List.generate(5, (index) {
                                return Container(
                                  child: Icon(Icons.star, color: Colors.orange, size: 18,),
                                );
                              },),
                            )
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.timer_sharp, color: Colors.orange,),
                        Text(review.date)
                    ],
                  ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(review.comment, textAlign: TextAlign.start,)
                    ]),
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },

  );
}

Widget _buildSummaryCard({
  required IconData icon,
  required Color iconColor,
  required String label,
  required String value,
}) {
  return Container(
    width: 230,
    height: 95,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      border: Border.all(color: Colors.grey.shade200),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 18, color: iconColor),
        const SizedBox(height: 12),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget _buildPurchaseCard(
  Color color,
  IconData icon,
  String value,
  String title,
) {
  return Container(
    margin: EdgeInsets.only(left: 20),
    width: 120,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: color,
          ),
          child: Icon(icon),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Text(title, style: TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
      ],
    ),
  );
}

Widget _buildProductCard(
  Color color,
  IconData icon,
  String value,
  String title,
) {
  return SizedBox(
    width: 210,
    child: Column(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: color,
          ),
          child: Icon(icon),
        ),
        SizedBox(height: 10),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(title, style: TextStyle(fontSize: 15)),
      ],
    ),
  );
}


Widget _buildDrawer (BuildContext context){
  return Drawer(
    child: ListView(
      children: [
        const DrawerHeader(child: Text('Menu')),
        ListTile(title: const Text('Dashboard'), onTap: () => Navigator.of(context).pop()),
        ListTile(title: const Text('Orders'), onTap: () => Navigator.pushNamed(context, 'order'),),
        const ListTile(title: Text('Delivery')),
        ListTile(title: const Text('Customer'), onTap: () => Navigator.pushNamed(context, 'customer'),),
        ListTile(title: const Text('Menu'), onTap: () => Navigator.pushNamed(context, 'menu'),),
        ListTile(title: const Text('Analytics'), onTap: () => Navigator.pushNamed(context, 'analytics'),),
        const ListTile(title: Text('Payments')),
        const ListTile(title: Text('Inventory')),
        const ListTile(title: Text('Setting')),
        const ListTile(title: Text('Report')),
        const ListTile(title: Text('Log Out')),
      ],
    ),
  );
}