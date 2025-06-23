part of 'menu_category_bloc.dart';

abstract class MenuCategoryEvent extends Equatable {
  const MenuCategoryEvent ();

  @override
  List<Object> get props => [];
}

class LoadMenuCategory extends MenuCategoryEvent {}

class AddMenuCategory extends MenuCategoryEvent {
  final MenuCategoryModel category;
  const AddMenuCategory (this.category);

  @override
  List<Object> get props => [category];
}
