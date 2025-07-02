import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/app_colors.dart';
import '../state/image_menu_bloc/image_menu_bloc.dart';
import '../state/menu_category_bloc/menu_category_bloc.dart';
import '../state/menu_dish_bloc/menu_dish_bloc.dart';
import '../state/other_menu_bloc/other_menu_bloc.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MenuCategoryBloc()..add(LoadMenuCategory()),
        ),
        BlocProvider(create: (context) => MenuDishBloc()),
        BlocProvider(
          create: (context) => OtherMenuBloc()..add(LoadOtherMenu()),
        ),
        BlocProvider(
          create: (context) => ImageMenuBloc()..add(LoadImageMenu()),
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
          title: const Text("Menu"),
        ),
        drawer: _buildDrawer(context),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCategory(),
                      SizedBox(height: 20),
                      _buildContainer(),
                      SizedBox(height: 20),
                      _buildDishesList(),
                      SizedBox(height: 20),
                      _buildWhatInMind(),
                    ],
                  ),
                ),
              ),
              _buildSideColumns(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildCategory() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Category', style: TextStyle(fontSize: 20)),
          TextButton(
            onPressed: () {},
            child: Text('View all', style: TextStyle(color: Colors.orange)),
          ),
        ],
      ),
      const SizedBox(height: 10),
      BlocBuilder<MenuCategoryBloc, MenuCategoryState>(
        builder: (context, state) {
          if (state is MenuCategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MenuCategoryLoaded) {
            return SizedBox(
              height: 103,
              child: ListView.builder(
                itemCount: state.categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  final category = state.categories[index];
                  return Container(
                    width: 103,
                    margin: const EdgeInsets.only(left: 10),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Image.asset(category.image, height: 38),
                            const SizedBox(height: 10),
                            Text(category.title),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    ],
  );
}

Widget _buildContainer() {
  return Container(
    width: 802,
    decoration: BoxDecoration(
      color: AppColors.mutedMauve,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You’re live eat to\nNot to live eat',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Korem ipsum dolor sit amet, consectetur\nadipiscing elit. Nunc vulputate libero et velit\ninterdum, ac aliquet odio mattis.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                  child: Text('Get Started'),
                ),
              ),
            ],
          ),
        ),
        Image.asset('assets/images/frame.png', height: 300),
      ],
    ),
  );
}

// Widget _buildDishesList() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text('Jaegar Resto', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
//       Text('Tuesday, 2 Feb 2025', style: TextStyle(fontSize: 16,),),
//       BlocBuilder<MenuDishBloc, MenuDishState>(
//   builder: (context, state) {
//     return SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//       child: Row(
//         children: List.generate(state.tabs.length, (index){
//           final isSelected = index == state.selectedIndex;
//           return GestureDetector(
//             onTap: (){
//               context.read<MenuDishBloc>().add(ChangeMenuTab(index));
//             },
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               margin: const EdgeInsets.symmetric(horizontal: 6),
//               decoration: BoxDecoration(
//               ),
//               child: Text(state.tabs[index].title, style: TextStyle(color: isSelected ? Colors.orange : Colors.black),),
//             ),
//           );
//         }),
//       ),
//       );
//   },
// )
//     ],
//   );
// }

Widget _buildDishesList() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Jaegar Resto',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      Text('Tuesday, 2 Feb 2025', style: TextStyle(fontSize: 16)),
      BlocBuilder<MenuDishBloc, MenuDishState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tab Row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(state.tabs.length, (index) {
                    final isSelected = index == state.selectedIndex;
                    return GestureDetector(
                      onTap: () {
                        context.read<MenuDishBloc>().add(ChangeMenuTab(index));
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            child: Text(
                              state.tabs[index].title,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.orange
                                    : Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            height: 3,
                            width: 40,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.orange
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 8),
              // Full underline below the tab row
              Container(height: 1, width: 700, color: Colors.grey.shade300),
              SizedBox(height: 20),

              Row(
                children: [
                  Text('Filter', style: TextStyle(color: Colors.grey)),
                  Spacer(),
                  Text('Sort by', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 10),
                  Text('Featured'),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey.shade300,
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Availability',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'In stock',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Out of stock',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 1,
                        width: 150,
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Choose Dishes',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 400),
                            SizedBox(
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.chocolateColor,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      10,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.keyboard_arrow_down),
                                    Text('Dine In'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 170,
                          child: BlocBuilder<MenuDishBloc, MenuDishState>(
                            builder: (context, state) {
                              return ListView.builder(
                                itemCount: state.currentTab.dishes.length,
                                // shrinkWrap: true,
                                // physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, index) {
                                  final dish = state.currentTab.dishes[index];
                                  return Container(
                                    width: 107,
                                    margin: EdgeInsets.only(left: 10),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(10),
                                          child: Image.asset(
                                            dish.image,
                                            height: 101,
                                            width: 101,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          dish.name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(dish.mins.toString()),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.green,
                                                ),
                                                Text(dish.rating.toString()),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    ],
  );
}

Widget _buildSideColumns() {
  return Container(
    width: 356,
    color: Colors.white,
    padding: EdgeInsets.all(10),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your Balance', style: TextStyle(fontSize: 16)),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 138,
              width: 331,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 132,
                    height: 64,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Balance', style: TextStyle(fontSize: 15)),
                        Text(
                          '\$12000',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Icon(Icons.transcribe_outlined),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Top Up'),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Icon(Icons.transcribe_outlined),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Transfer'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          Text('Your Address', style: TextStyle(color: Colors.grey)),
          Row(
            children: [
              Icon(Icons.location_on),
              Text(
                'Elm, street 23',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              SizedBox(
                height: 38,
                width: 110,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.orange),
                    ),
                  ),
                  child: Center(child: Text('Change')),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt. ',
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(
                height: 38,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.orange),
                    ),
                  ),
                  child: Center(child: Text('Add Details')),
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                height: 38,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.orange),
                    ),
                  ),
                  child: Center(child: Text('Add Note')),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),

          Text(
            'Other Menu',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          BlocBuilder<OtherMenuBloc, OtherMenuState>(
            builder: (context, state) {
              if (state is OtherMenuLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is OtherMenuLoaded) {
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: state.menus.length,
                    itemBuilder: (ctx, index) {
                      final menu = state.menus[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(menu.image),
                        ),
                        title: Text(
                          menu.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('x${menu.count}'),
                        trailing: Text(
                          '+\$${menu.price}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          SizedBox(height: 30),
          Divider(endIndent: 10, indent: 10),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Service', style: TextStyle(color: Colors.grey)),
              Text('+\$1.00', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total'),
              Text('\$202.00', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 64,
              width: 319,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.orange
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/images/icon.png'),
                  Text('Have a coupon code?'),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 64,
              width: 319,
              child: ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.chocolateColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                  ),
                  child: Text('Checkout')),
            ),
          )
        ],
      ),
    ),
  );
}

Widget _buildWhatInMind() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('What\'s on your mind?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      BlocBuilder<ImageMenuBloc, ImageMenuState>(
          builder: (context, state) {
            if (state is ImageMenuLoading){
              return const Center(child: CircularProgressIndicator(),);
            } else if (state is ImageMenuLoaded){
              return SizedBox(
                height: 120,
                child: ListView.builder(
                  itemCount: state.images.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(state.images[index].image),
                      ),
                    );
                    }),
              );
            }
            return const Center(child: CircularProgressIndicator(),);
          },
        ),
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
        ListTile(title: const Text('Customer'), onTap: () => Navigator.pushNamed(context, 'customer'),),
        ListTile(title: const Text('Menu'), onTap: () => Navigator.of(context).pop()),
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