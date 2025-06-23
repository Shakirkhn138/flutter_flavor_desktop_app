part of 'menu_dish_bloc.dart';

abstract class MenuDishEvent extends Equatable {
  const MenuDishEvent ();

  @override
  List<Object> get props => [];
}

class ChangeMenuTab extends MenuDishEvent {
  final int index;
  const ChangeMenuTab (this.index);

  @override
  List<Object> get props => [index];
}

