import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/app_colors.dart';
import '../state/customer_bloc/customer_bloc.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerBloc()..add(LoadCustomer()),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          title: const Text("Customer Screen"),
        ),
        drawer: _buildDrawer(context),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
             _buildRow(),
              _buildTable(),
              _buildBottom()
            ],


          ),
        ),
      ),
    );
  }
}


Widget _buildRow (){
  return  Row(
    children: [
      Text('Customer Screen', style: TextStyle(fontSize: 20)),
      Spacer(),
      SizedBox(
        width: 130,
        height: 45,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.chocolateColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text('Add Product'),
        ),
      ),
      SizedBox(width: 10),
      SizedBox(
        width: 130,
        height: 45,
        child: ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.orange),
            ),
          ),
          icon: Icon(Icons.filter_list_rounded),
          label: Text('Filter'),
        ),
      ),
      SizedBox(width: 10),
      SizedBox(
        width: 130,
        height: 45,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.orange),
            ),
          ),
          child: Text('Download All'),
        ),
      ),
    ],
  );
}


Widget _buildTable (){
  return Expanded(
    child: BlocBuilder<CustomerBloc, CustomerState>(
      builder: (context, state) {
        if (state is CustomerLoading) {
          return const Center(child: CircularProgressIndicator(),);
        } else if (state is CustomerLoaded) {
          return DataTable(columns: [
            DataColumn(label: Text('Supplier Name')),
            DataColumn(label: Text('Product')),
            DataColumn(label: Text('Contact Number')),
            DataColumn(label: Text('Email')),
            DataColumn(label: Text('Type')),
            DataColumn(label: Text('On the way')),
          ], rows: state.customers.map((customer) {
            return DataRow(cells: [
              DataCell(Text(customer.supplierName)),
              DataCell(Text(customer.product)),
              DataCell(Text(customer.contactNumber)),
              DataCell(Text(customer.email)),
              DataCell(Text(customer.type, style: TextStyle(color: customer.type == 'Taking Return' ? Colors.green : Colors.red),)),
              DataCell(Text(customer.onTheWay.toString())),
            ]);
          }).toList());
        }
        return const SizedBox.shrink();
      },
    ),
  );
}

Widget _buildBottom (){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(3),
            ),
            side: BorderSide(
              color: Colors.black
            ),
          ),
          child: Text('Previous')),

      Text('Page 1 of 10'),

      ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(3),
            ),
            side: BorderSide(
                color: Colors.black
            ),
          ),
          child: Text('Next')),
    ],
  );
}


Widget _buildDrawer (BuildContext context){
  return Drawer(
    child: ListView(
      children: [
        const DrawerHeader(child: Text('Menu')),
        ListTile(title: const Text('Dashboard'), onTap: () => Navigator.pushNamed(context, 'dashboard'),),
        ListTile(title: const Text('Orders'), onTap: () => Navigator.pushNamed(context, 'order'),),
        const ListTile(title: Text('Delivery')),
        ListTile(title: const Text('Customer'), onTap: ()  => Navigator.of(context).pop()),
        ListTile(title: const Text('Menu'), onTap: () => Navigator.pushNamed(context, 'menu'),),
        ListTile(title: const Text('Analytics'), onTap: () => Navigator.pushNamed(context, 'analytics'),),
        const ListTile(title: Text('Payments')),
        const ListTile(title: Text('Inventory')),
        ListTile(title: const Text('Setting'), onTap: () => Navigator.pushNamed(context, 'setting'),),
        const ListTile(title: Text('Report')),
        const ListTile(title: Text('Log Out')),
      ],
    ),
  );
}