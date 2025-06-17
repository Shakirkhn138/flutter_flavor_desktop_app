import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_desktop_app/state/dashboard_header/dashboard_header_bloc.dart';
import '../config/app_colors.dart';
import '../state/inventory_summary/inventory_summary_bloc.dart';
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
          create: (context) =>
          DashboardHeaderBloc()
            ..add(AddHeader()),
        ),
        BlocProvider(
          create: (context) =>
          SalesOverviewBloc()
            ..add(LoadSales()),
        ),
        BlocProvider(
          create: (context) =>
          InventorySummaryBloc()
            ..add(LoadInventorySummary()),
        ),
        BlocProvider(
          create: (context) =>
          PurchaseOverviewBloc()
            ..add(LoadPurchaseOverview()),
        ),
        BlocProvider(
          create: (context) =>
          ProductSummaryBloc()
            ..add(LoadProductSummary()),
        ),
        BlocProvider(
          create: (context) =>
          SellingItemBloc()
            ..add(LoadSellingItem()),
        ),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double screenWidth = constraints.maxWidth;

          return Scaffold(
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
            drawer: Drawer(
              child: ListView(
                children: const [
                  DrawerHeader(child: Text('Menu')),
                  ListTile(title: Text('Dashboard')),
                  ListTile(title: Text('Orders')),
                  ListTile(title: Text('Delivery')),
                  ListTile(title: Text('Customer')),
                  ListTile(title: Text('Menu')),
                  ListTile(title: Text('Analytics')),
                  ListTile(title: Text('Payments')),
                  ListTile(title: Text('Inventory')),
                  ListTile(title: Text('Setting')),
                  ListTile(title: Text('Report')),
                  ListTile(title: Text('Log Out')),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    BlocBuilder<DashboardHeaderBloc, DashboardHeaderState>(
                      builder: (context, state) {
                        if (state is HeaderLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
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
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
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
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Icon(header.icon),
                                              ),
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
                    ),

                    // BlocBuilder<SalesOverviewBloc, SalesOverviewState>(
                    //   builder: (context, state) {
                    //     if (state is SalesLoading) {
                    //       return const Expanded(
                    //         child: Center(child: CircularProgressIndicator()),
                    //       );
                    //     } else if (state is SalesLoaded) {
                    //       return SizedBox(
                    //         height: 150,
                    //         width: 1000,
                    //
                    //         child: ListView.builder(
                    //           itemCount: state.sales.length,
                    //           scrollDirection: Axis.horizontal,
                    //           itemBuilder: (context, index) {
                    //             final sale = state.sales[index];
                    //             return Container(
                    //               width: 130,
                    //               decoration: BoxDecoration(
                    //                 color: Colors.white,
                    //                 borderRadius: BorderRadius.circular(10)
                    //               ),
                    //               margin: const EdgeInsets.symmetric(vertical: 8),
                    //               child: Column(
                    //                 mainAxisAlignment: MainAxisAlignment.center,
                    //                 children: [
                    //                   Icon(sale.icon),
                    //                   Row(
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       Text(sale.money.toString()),
                    //                       Spacer(),
                    //                       Text(sale.title),
                    //                       SizedBox(
                    //                         height: 60,
                    //                         child: VerticalDivider(
                    //                           color: Colors.grey,
                    //                           thickness: 2,
                    //                         ),
                    //                       ),
                    //
                    //                     ],
                    //                   ),
                    //
                    //                 ],
                    //               )
                    //             );
                    //           },
                    //         ),
                    //       );
                    //     } else if (state is SalesError) {
                    //       return const Expanded(
                    //         child: Center(child: Text('Failed to load sales data')),
                    //       );
                    //     }
                    //     return const SizedBox.shrink();
                    //   },
                    // ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Align(
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
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.limeGreenColor,
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Icon(Icons.add),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('\$ 832'),
                                          Text('Sales'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                  child: VerticalDivider(
                                    thickness: 2,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,

                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.limeGreenColor,
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Icon(Icons.add),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('\$ 832'),
                                          Text('Revenue'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                  child: VerticalDivider(
                                    thickness: 2,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,

                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.limeGreenColor,
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Icon(Icons.add),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('\$ 832'),
                                          Text('Profit'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                  child: VerticalDivider(
                                    thickness: 2,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.limeGreenColor,
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Icon(Icons.add),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('\$ 832'),
                                          Text('Cost'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        BlocBuilder<
                            InventorySummaryBloc,
                            InventorySummaryState
                        >(
                          builder: (context, state) {
                            if (State is InventorySummaryLoading) {
                              return Center(child: CircularProgressIndicator());
                            } else if (state is InventorySummaryLoaded) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                                child: Row(
                                  children: [
                                    _buildSummaryCard(
                                      icon: Icons.inventory_2_outlined,
                                      iconColor: Colors.orange,
                                      label: 'Quantity in hand',
                                      value: state.summary.quantitativeInHand
                                          .toString(),
                                    ),
                                    _buildSummaryCard(
                                      icon: Icons.local_shipping_outlined,
                                      iconColor: Colors.deepPurple,
                                      label: 'To be received',
                                      value: state.summary.toBeReceived
                                          .toString(),
                                    ),
                                  ],
                                ),
                              );
                            }
                            return SizedBox.shrink();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Align(
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
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else if (state
                                    is PurchaseOverviewLoaded) {
                                      return Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Purchase Overview',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          SizedBox(height: 20),
                                          Row(
                                            children: [
                                              _buildPurchaseCard(
                                                Colors.blue.shade50,
                                                Icons.shopping_bag_outlined,
                                                state.purchase.purchase
                                                    .toString(),
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
                                                Icons
                                                    .cancel_presentation_outlined,
                                                state.purchase.cancel
                                                    .toString(),
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
                        ),
                        Container(
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
                              BlocBuilder<
                                  ProductSummaryBloc,
                                  ProductSummaryState
                              >(
                                builder: (context, state) {
                                  if (state is ProductSummaryLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (state is ProductSummaryLoaded) {
                                    return Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Product Summary',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            _buildProductCard(
                                              Colors.blue.shade50,
                                              Icons.person_2_outlined,
                                              state.product.numberOfCategory
                                                  .toString(),
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
                                              state.product.numberOfSuppliers
                                                  .toString(),
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
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          color: Colors.blue.shade50,
                          width: 864,
                          height: 330,
                          child: const Center(child: Text('Line Chart')),
                        ),
                        Container(
                          width: 250,
                          height: 330,
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: BlocBuilder<SellingItemBloc, SellingItemState>(
                            builder: (context, state) {
                              if (state is SellingItemLoading) {
                                return const Center(child: CircularProgressIndicator());
                              } else if (state is SellingItemLoaded) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
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
                                              padding: const EdgeInsets.only(top: 20,),
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundImage: NetworkImage(item.image),
                                                    radius: 18,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(item.title, style: TextStyle(fontSize: 16),),
                                                  Spacer(),
                                                  Text(item.itemsSell.toString(), style: TextStyle(fontSize: 16),),
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
                        ),
                      ],
                    )

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
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

Widget _buildPurchaseCard(Color color,
    IconData icon,
    String value,
    String title,) {
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

Widget _buildProductCard(Color color,
    IconData icon,
    String value,
    String title,) {
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
