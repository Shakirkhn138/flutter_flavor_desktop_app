import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_desktop_app/state/order_sales_bloc/order_sales_bloc.dart';

import '../config/app_colors.dart';
import '../state/order_list_bloc/order_list_bloc.dart';
import '../state/orders_purchase_bloc/orders_purchase_bloc.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OrdersPurchaseBloc()..add(LoadOrdersPurchase()),
        ),
        BlocProvider(
          create: (context) => OrderSalesBloc()..add(LoadOrderSales()),
        ),
        BlocProvider(
          create: (context) => OrderListBloc()..add(LoadOrderList()),
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
          title: const Text("Orders"),
        ),
        drawer: _buildDrawer(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        _buildPurchaseOverview(),
                        SizedBox(height: 10),
                        _buildSalesOverview(),
                      ],
                    ),
                    _buildOrderSummary(),
                  ],
                ),
                _buildOrderListRow(_searchController),
                SizedBox(
                  height: 20,
                ),
                _buildOrderList(),
                SizedBox(
                  height: 20,
                ),
                _buildBottomRow(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildPurchaseOverview() {
  return Container(
    height: 163,
    width: 754,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Purchase Overview', style: TextStyle(fontSize: 20)),
        SizedBox(height: 20),
        BlocBuilder<OrdersPurchaseBloc, OrdersPurchaseState>(
          builder: (context, state) {
            if (state is OrdersPurchaseLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is OrdersPurchaseLoaded) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCard(
                    Colors.blue.shade50,
                    Icons.wallet_travel,
                    state.purchase.purchase.toString(),
                    'Purchase',
                  ),
                  SizedBox(
                    height: 75,
                    child: VerticalDivider(
                      width: 1,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  _buildCard(
                    Colors.purple.shade50,
                    Icons.house_siding_rounded,
                    '\$${state.purchase.cost}',
                    'Cost',
                  ),
                  SizedBox(
                    height: 75,
                    child: VerticalDivider(
                      width: 1,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  _buildCard(
                    Colors.yellow.shade50,
                    Icons.access_alarm_sharp,
                    state.purchase.cancel.toString(),
                    'Cancel',
                  ),
                  SizedBox(
                    height: 75,
                    child: VerticalDivider(
                      width: 1,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  _buildCard(
                    Colors.orange.shade50,
                    Icons.ac_unit_rounded,
                    '\$${state.purchase.sendBack}',
                    'Return',
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    ),
  );
}

Widget _buildCard(Color color, IconData icon, String value, String title) {
  return SizedBox(
    width: 116,
    height: 66,
    child: Column(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(icon),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(value, style: TextStyle(fontSize: 16)),
            Text(title),
          ],
        ),
      ],
    ),
  );
}

Widget _buildSalesOverview() {
  return Container(
    height: 163,
    width: 754,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sales Overview', style: TextStyle(fontSize: 20)),
        SizedBox(height: 20),
        BlocBuilder<OrderSalesBloc, OrderSalesState>(
          builder: (context, state) {
            if (state is OrderSalesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is OrderSalesLoaded) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCard(
                    Colors.blue.shade50,
                    Icons.energy_savings_leaf_sharp,
                    '\$${state.sale.sales}',
                    'Sales',
                  ),
                  SizedBox(
                    height: 75,
                    child: VerticalDivider(
                      width: 1,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  _buildCard(
                    Colors.purple.shade50,
                    Icons.gamepad_outlined,
                    '\$${state.sale.revenue}',
                    'Revenue',
                  ),
                  SizedBox(
                    height: 75,
                    child: VerticalDivider(
                      width: 1,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  _buildCard(
                    Colors.yellow.shade50,
                    Icons.traffic_rounded,
                    '\$${state.sale.profit}',
                    'Profit',
                  ),
                  SizedBox(
                    height: 75,
                    child: VerticalDivider(
                      width: 1,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  _buildCard(
                    Colors.orange.shade50,
                    Icons.error_rounded,
                    '\$${state.sale.cost}',
                    'Cost',
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    ),
  );
}

Widget _buildOrderSummary() {
  return Container(
    height: 360,
    width: 385,
    decoration: BoxDecoration(
      color: Colors.blue.shade50,
      borderRadius: BorderRadius.circular(10),
    ),
    child: const Center(child: Text('Order Summary Chart')),
  );
}

Widget _buildOrderListRow(controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Order Lists', style: TextStyle(fontSize: 24)),
      Row(
        children: [
          SizedBox(
            height: 36,
            width: 569,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hint: Text('Search'),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          Spacer(),
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(4),
              ),
              side: BorderSide(color: Colors.orange),
            ),
            icon: Icon(Icons.file_upload_outlined),
            label: Text('Export'),
          ),
          SizedBox(width: 20),
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.chocolateColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(4),
              ),
            ),
            icon: Icon(Icons.tune),
            label: Text('Filter'),
          ),
        ],
      ),
    ],
  );
}

Widget _buildOrderList (){
  return Container(
    // height: 672,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20)
    ),
    child: BlocBuilder<OrderListBloc, OrderListState>(
    builder: (context, state) {
      if (state is OrderListLoading){
        return const Center(child: CircularProgressIndicator(),);
      } else if (state is OrderListLoaded){
    
      return DataTable(columns: [
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Address')),
        DataColumn(label: Text('Time')),
        DataColumn(label: Text('Price')),
        DataColumn(label: Text('Payment')),
        DataColumn(label: Text('Date')),
        DataColumn(label: Text('Status')),
        DataColumn(label: Icon(Icons.replay)),
      ], rows: state.lists.map((list){
        return DataRow(cells: [
          DataCell(Text(list.id)),
          DataCell(Text(list.name)),
          DataCell(Text(list.address)),
          DataCell(Text(list.time)),
          DataCell(Text('\$${list.price}')),
          DataCell(Text(list.payment)),
          DataCell(Text(list.date)),
          DataCell(Container(
            width: 92,
              height: 27,
              decoration: BoxDecoration(
                color: _getStatusColor(list.status).withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Center(child: Text(list.status, style: TextStyle(color: _getStatusColor(list.status)),)))),
          DataCell(Icon(Icons.more_horiz)),
        ]);
      }).toList());
      }
      return const SizedBox.shrink();
    },
    
    ),
  );

}

Color _getStatusColor (String status) {
  switch (status.toLowerCase()){
    case 'preparing':
      return Colors.orange;
    case 'on delivery':
      return Colors.blue;
    case 'delivered':
      return Colors.green;
    case 'cancelled':
      return Colors.red;
    default:
      return Colors.grey;
  }
}

Widget _buildBottomRow (){
  return Row(
    children: [
      Text('Showing 1-09 of 78'),
      Spacer(),
      IconButton(
          onPressed: (){},
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10))
            ),
              side: BorderSide(
                  color: Colors.black,
                width: 0.3
              )
          ),
          icon: Icon(Icons.arrow_back_ios_new)),
      IconButton(
          onPressed: (){},
          style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10))
              ),
            side: BorderSide(
              color: Colors.black,
                width: 0.3
            )
          ),
          icon: Icon(Icons.arrow_forward_ios)),
    ],
  );
}
Widget _buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        const DrawerHeader(child: Text('Menu')),
        ListTile(title: const Text('Dashboard'), onTap: () => Navigator.pushNamed(context, 'dashboard'),),
        ListTile(
          title: const Text('Orders'),
          onTap: () => Navigator.of(context).pop(),
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
        ListTile(
          title: const Text('Analytics'),
          onTap: () => Navigator.pushNamed(context, 'analytics'),
        ),
        const ListTile(title: Text('Payments')),
        const ListTile(title: Text('Inventory')),
        ListTile(title: const Text('Setting'), onTap: () => Navigator.pushNamed(context, 'setting'),),
        const ListTile(title: Text('Report')),
        const ListTile(title: Text('Log Out')),
      ],
    ),
  );
}
