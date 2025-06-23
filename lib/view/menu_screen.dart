import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/app_colors.dart';
import '../state/menu_category_bloc/menu_category_bloc.dart';
import '../state/menu_dish_bloc/menu_dish_bloc.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MenuCategoryBloc()..add(LoadMenuCategory()),
        ),
        BlocProvider(create: (context) => MenuDishBloc()),
      ],
      child: Scaffold(
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
                    ],
                  ),
                ),
              ),
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
                        // BlocBuilder<MenuDishBloc, MenuDishState>(
                        //   builder: (context, state) {
                        //     return ListView.builder(
                        //       itemCount: state.currentTab.dishes.length,
                        //       shrinkWrap: true,
                        //       physics: NeverScrollableScrollPhysics(),
                        //       itemBuilder: (ctx, index) {
                        //         final dish = state.currentTab.dishes[index];
                        //         return Column(children: [
                        //           Text(dish.name)]);
                        //       },
                        //     );
                        //   },
                        // ),
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
