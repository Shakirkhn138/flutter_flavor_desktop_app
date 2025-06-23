part of 'menu_dish_bloc.dart';

class MenuDishState extends Equatable {
  final int selectedIndex;
  final List<MenuTabsModel> tabs;

  const MenuDishState ({required this.selectedIndex, required this.tabs});

  MenuTabsModel get currentTab => tabs[selectedIndex];

  @override
  // TODO: implement props
  List<Object?> get props =>[selectedIndex, tabs];
}