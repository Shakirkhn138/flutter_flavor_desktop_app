

import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
      drawer: _buildDrawer(context),
      body: const Center(
        child: Text('Orders Screen'),
      ),
    );
  }
}


Widget _buildDrawer (BuildContext context){
  return Drawer(
    child: ListView(
      children: [
        const DrawerHeader(child: Text('Menu')),
        const ListTile(title: Text('Dashboard')),
        ListTile(title: const Text('Orders'), onTap: () => Navigator.of(context).pop()),
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