import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_desktop_app/config/models/menu_category_model.dart';
import 'package:practice_desktop_app/state/customer_review_bloc/customer_review_bloc.dart';

part 'menu_category_event.dart';
part 'menu_category_state.dart';

class MenuCategoryBloc extends Bloc<MenuCategoryEvent, MenuCategoryState> {
  MenuCategoryBloc() : super(MenuCategoryInitial()) {
   on<LoadMenuCategory>(_loadCategory);
   on<AddMenuCategory>(_addCategory);
  }
  
  void _loadCategory (LoadMenuCategory event, Emitter<MenuCategoryState> emit){
    final List<MenuCategoryModel> menuCategory = [
      MenuCategoryModel(image: 'assets/images/Baked.png', title: 'Bakery'),
      MenuCategoryModel(image: 'assets/images/Burger.png', title: 'Burger'),
      MenuCategoryModel(image: 'assets/images/coffee.png', title: 'Beverage'),
      MenuCategoryModel(image: 'assets/images/chicken.png', title: 'Chicken'),
      MenuCategoryModel(image: 'assets/images/fast.png', title: 'Pizza'),
      MenuCategoryModel(image: 'assets/images/chicken.png', title: 'Chicken'),
      MenuCategoryModel(image: 'assets/images/fast.png', title: 'Pizza'),
    ];
    emit(MenuCategoryLoaded(menuCategory));
  }

  void _addCategory (AddMenuCategory event, Emitter<MenuCategoryState> emit){
    if (state is MenuCategoryLoaded){
      final List<MenuCategoryModel> updatedMenuCategory = List.from((state as MenuCategoryLoaded).categories)..add(event.category);
      emit(MenuCategoryLoaded(updatedMenuCategory));
    }
  }
}
