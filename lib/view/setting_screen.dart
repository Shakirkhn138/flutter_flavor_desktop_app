import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_desktop_app/state/setting_inventory_bloc/setting_inventory_bloc.dart';
import 'package:practice_desktop_app/state/setting_product_bloc/setting_product_bloc.dart';
import 'package:practice_desktop_app/state/setting_purchase_bloc/setting_purchase_bloc.dart';
import 'package:practice_desktop_app/state/setting_sales_bloc/setting_sales_bloc.dart';

import '../config/app_colors.dart';
import '../state/setting_table_bloc/setting_table_bloc.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SettingPurchaseBloc()..add(LoadSettingPurchase()),
        ),
        BlocProvider(
          create: (context) => SettingProductBloc()..add(LoadSettingProduct()),
        ),
        BlocProvider(
          create: (context) => SettingSalesBloc()..add(LoadSettingSales()),
        ),
        BlocProvider(
          create: (context) =>
              SettingInventoryBloc()..add(LoadSettingInventory()),
        ),
        BlocProvider(
          create: (context) => SettingTableBloc()..add(LoadSettingTable()),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [_buildSettingPurchase(), _buildProductSummary()],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [_buildSalesOverview(), _buildInventorySummary()],
                ),
                _employeeRow(),
                SizedBox(height: 20),
                _buildTableTop(_searchController),
                _buildEmployeeTable(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildSettingPurchase() {
  return Container(
    height: 163,
    width: 690,
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
        BlocBuilder<SettingPurchaseBloc, SettingPurchaseState>(
          builder: (context, state) {
            if (state is SettingPurchaseLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SettingPurchaseLoaded) {
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

Widget _buildProductSummary() {
  return Container(
    height: 163,
    width: 448,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Product Summary', style: TextStyle(fontSize: 20)),
        SizedBox(height: 20),
        BlocBuilder<SettingProductBloc, SettingProductState>(
          builder: (context, state) {
            if (state is SettingProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SettingProductLoaded) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildProductCard(
                    Colors.blue.shade50,
                    Icons.ac_unit_rounded,
                    state.product.numberOfSuppliers.toString(),
                    'Number of suppliers',
                  ),
                  SizedBox(
                    height: 75,
                    child: VerticalDivider(
                      width: 1,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  _buildProductCard(
                    Colors.orange.shade50,
                    Icons.access_alarm_rounded,
                    state.product.numberOfCategory.toString(),
                    'Number of categories',
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

Widget _buildProductCard(
  Color color,
  IconData icon,
  String value,
  String title,
) {
  return SizedBox(
    height: 84,
    // width: 138,
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
        Text(value),
        Text(title),
      ],
    ),
  );
}

Widget _buildSalesOverview() {
  return Container(
    height: 163,
    width: 690,
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
        BlocBuilder<SettingSalesBloc, SettingSalesState>(
          builder: (context, state) {
            if (state is SettingSalesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SettingSalesLoaded) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCard(
                    Colors.blue.shade50,
                    Icons.wallet_travel,
                    '\$${state.sales.sales}',
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
                    Icons.house_siding_rounded,
                    '\$${state.sales.revenue}',
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
                    Icons.access_alarm_sharp,
                    '\$${state.sales.profit}',
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
                    Icons.ac_unit_rounded,
                    '\$${state.sales.cost}',
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

Widget _buildInventorySummary() {
  return Container(
    height: 163,
    width: 448,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Inventory Summary', style: TextStyle(fontSize: 20)),
        SizedBox(height: 20),
        BlocBuilder<SettingInventoryBloc, SettingInventoryState>(
          builder: (context, state) {
            if (state is SettingInventoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SettingInventoryLoaded) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildProductCard(
                    Colors.blue.shade50,
                    Icons.ac_unit_rounded,
                    state.inventory.quantityInHand.toString(),
                    'Quantity in hand',
                  ),
                  SizedBox(
                    height: 75,
                    child: VerticalDivider(
                      width: 1,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  _buildProductCard(
                    Colors.orange.shade50,
                    Icons.access_alarm_rounded,
                    state.inventory.toBeReceived.toString(),
                    'To be received',
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

Widget _employeeRow() {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: ListTile(
              title: Text('Employee', style: TextStyle(fontSize: 24)),
              subtitle: Text('View and manage employee'),
            ),
          ),

          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.only(
                  topLeft: Radius.circular(6),
                  bottomLeft: Radius.circular(6),
                ),
              ),
              side: BorderSide(color: Colors.orange),
            ),
            icon: Icon(Icons.list),
            label: Text('List View'),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.chocolateColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.only(
                  topRight: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
              ),
            ),
            icon: Icon(Icons.grid_view_outlined),
            label: Text('Card View'),
          ),
        ],
      ),
    ],
  );
}

Widget _buildTableTop(controller) {
  return Container(
    height: 60,
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.blue.shade50.withOpacity(0.3),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      border: Border.all(color: Colors.orange, width: 0.4),
    ),
    child: Row(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black),
          ),
          child: Icon(Icons.group_outlined, color: Colors.orange),
        ),
        SizedBox(width: 10),
        RichText(
          text: TextSpan(
            text: 'Total employee: ',
            style: TextStyle(fontSize: 16, color: Colors.black),
            children: [
              TextSpan(
                text: '1265 Persons',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Spacer(),
        SizedBox(
          height: 36,
          width: 310,
          child: TextFormField(
            controller: controller,

            decoration: InputDecoration(
              hint: Text('Search payroll or name'),
              prefixIcon: Icon(Icons.search),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(color: Colors.grey, width: 0.2),
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(4),
            ),
            side: BorderSide(color: Colors.grey, width: 0.4),
          ),
          icon: Icon(Icons.filter_alt_outlined),
          label: Text('Filter'),
        ),
        SizedBox(width: 20),
        ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(4),
            ),
            side: BorderSide(color: Colors.grey, width: 0.4),
          ),
          icon: Icon(Icons.filter_list_rounded),
          label: Text('Sort'),
        ),
      ],
    ),
  );
}

Widget _buildEmployeeTable() {
  return Container(
    width: double.infinity,
    // decoration: BoxDecoration(
    //   color: Colors.white,
    //   borderRadius: BorderRadius.circular(10),
    // ),
    child: BlocBuilder<SettingTableBloc, SettingTableState>(
      builder: (context, state) {
        if (state is SettingTableLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SettingTableLoaded) {
          return DataTable(
            dataRowHeight: 60,
            headingRowHeight: 35,
            headingRowColor: MaterialStateProperty.all<Color>(Colors.blue.shade50.withOpacity(0.4)),
            columns: [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Payroll')),
              DataColumn(label: Text('Department')),
              DataColumn(label: Text('Role')),
              DataColumn(label: Text('Joining Date')),
              DataColumn(label: Text('Contract T')),
              DataColumn(label: Text('Action')),
            ],
            rows: state.employees.map((employee) {
              return DataRow(
                cells: [
                  DataCell(
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(employee.image),
                      ),
                      title: Text(employee.name),
                      subtitle: Text(employee.email),
                    ),
                  ),
                  DataCell(Text(employee.payroll)),
                  DataCell(Text(employee.department)),
                  DataCell(Text(employee.role)),
                  DataCell(Text(employee.joiningDate)),
                  DataCell(Text(employee.contractType)),
                  DataCell(
                    Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(Icons.more_vert),
                    ),
                  ),
                ],
              );
            }).toList(),
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
        ListTile(
          title: const Text('Dashboard'),
          onTap: () => Navigator.pushNamed(context, 'dashboard'),
        ),
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
        ListTile(
          title: const Text('Setting'),
          onTap: () => Navigator.of(context).pop(),
        ),
        const ListTile(title: Text('Report')),
        const ListTile(title: Text('Log Out')),
      ],
    ),
  );
}
