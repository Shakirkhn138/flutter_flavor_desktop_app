import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_desktop_app/config/models/other_menu_model.dart';

part 'other_menu_event.dart';
part 'other_menu_state.dart';

class OtherMenuBloc extends Bloc<OtherMenuEvent, OtherMenuState> {
  OtherMenuBloc() : super(OtherMenuInitial()) {
    on<LoadOtherMenu>(_loadMenu);
    on<AddOtherMenu>(_addMenu);
  }
  
  void _loadMenu (LoadOtherMenu event, Emitter<OtherMenuState> emit){
    final List<OtherMenuModel> otherMenu = [
      OtherMenuModel(image: 'assets/images/pizza.jpg', title: 'Pepperoni pizza', count: 1, price: 15.43),
      OtherMenuModel(image: 'assets/images/pizza.jpg', title: 'Cheese burger', count: 5, price: 17.53),
      OtherMenuModel(image: 'assets/images/pizza.jpg', title: 'Vegan pizza', count: 4, price: 13),
    ];
    emit(OtherMenuLoaded(otherMenu));
  }


  void _addMenu (AddOtherMenu event, Emitter<OtherMenuState> emit){
    if (state is OtherMenuLoaded){
      final List<OtherMenuModel> updatedOtherMenu = List.from((state as OtherMenuLoaded).menus)..add(event.menu);
      emit(OtherMenuLoaded(updatedOtherMenu));
    }
  }
}
