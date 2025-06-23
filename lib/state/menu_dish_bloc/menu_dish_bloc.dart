import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:practice_desktop_app/config/models/menu_dish_model.dart';

part 'menu_dish_event.dart';
part 'menu_dish_state.dart';

class MenuDishBloc extends Bloc<MenuDishEvent, MenuDishState>{
  MenuDishBloc () : super(MenuDishState(selectedIndex: 0, tabs: [
    MenuTabsModel(title: 'Hot Dishes', dishes: [
      MenuDishModel(name: 'Spaghetti Bolognese', image: 'assets/images/pizza.jpg', mins: 25, rating: 4.5),
      MenuDishModel(name: 'Grilled Chicken', image: 'assets/images/pizza.jpg', mins: 30, rating: 4.7),
    ]),
    MenuTabsModel(title: 'Cold Dishes', dishes: [

      MenuDishModel(name: 'Caesar Salad', image: 'assets/images/pizza.jpg', mins: 15, rating: 4.2),
      MenuDishModel(name: 'Greek Salad', image: 'assets/images/pizza.jpg', mins: 12, rating: 4.3),
    ]),
    MenuTabsModel(title: 'Soup', dishes: [
      MenuDishModel(name: 'Tomato Soup', image: 'assets/images/pizza.jpg', mins: 20, rating: 4.1),
      MenuDishModel(name: 'Miso Soup', image: 'assets/images/pizza.jpg', mins: 18, rating: 4.6),
    ]),
    MenuTabsModel(title: 'Grill', dishes: [
      MenuDishModel(name: 'Grilled Salmon', image: 'assets/images/pizza.jpg', mins: 22, rating: 4.8),
      MenuDishModel(name: 'BBQ Chicken Wings', image: 'assets/images/pizza.jpg', mins: 28, rating: 4.4),
    ]),
    MenuTabsModel(title: 'Appetizer', dishes: [
      MenuDishModel(name: 'Spring Rolls', image: 'assets/images/pizza.jpg', mins: 10, rating: 4.0),
      MenuDishModel(name: 'Garlic Bread', image: 'assets/images/pizza.jpg', mins: 8, rating: 4.2),
    ]),
    MenuTabsModel(title: 'Dessert', dishes: [
      MenuDishModel(name: 'Chocolate Cake', image: 'assets/images/pizza.jpg', mins: 35, rating: 4.9),
      MenuDishModel(name: 'Ice Cream', image: 'assets/images/pizza.jpg', mins: 5, rating: 4.6),
    ]),
  ])){
    on<ChangeMenuTab>(_changeTab);
  }

  void _changeTab (ChangeMenuTab event, Emitter<MenuDishState> emit){
    emit(MenuDishState(selectedIndex: event.index, tabs: state.tabs));
  }
}
