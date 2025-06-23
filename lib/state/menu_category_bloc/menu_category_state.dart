part of 'menu_category_bloc.dart';

abstract class MenuCategoryState extends Equatable {
  const MenuCategoryState();

  @override
  List<Object> get props => [];
}

class MenuCategoryInitial extends MenuCategoryState {}

class MenuCategoryLoading extends MenuCategoryState {}

class MenuCategoryLoaded extends MenuCategoryState {
  final List<MenuCategoryModel> categories;
  const MenuCategoryLoaded (this.categories);

  @override
  List<Object> get props => [categories];
}

class MenuCategoryError extends MenuCategoryState {
  final String error;
  const MenuCategoryError (this.error);

  @override
  List<Object> get props => [error];
}