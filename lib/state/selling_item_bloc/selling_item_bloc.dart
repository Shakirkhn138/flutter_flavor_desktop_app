import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:practice_desktop_app/config/models/selling_item_model.dart';

part 'selling_item_event.dart';
part 'selling_item_state.dart';

class SellingItemBloc extends Bloc<SellingItemEvent, SellingItemState> {
  SellingItemBloc() : super(SellingItemInitial()) {
   on<LoadSellingItem>(_loadItem);
   on<AddSellingItem>(_addItem);
  }
  
  void _loadItem (LoadSellingItem event, Emitter<SellingItemState> emit){
    final List<SellingItemModel> SellingItem = [
      SellingItemModel(image: 'https://images.pexels.com/photos/1049626/pexels-photo-1049626.jpeg', title: 'Cheese burger', itemsSell: 150),
      SellingItemModel(image: 'https://images.pexels.com/photos/1049626/pexels-photo-1049626.jpeg', title: 'Pizza Peperoni', itemsSell: 8),
      SellingItemModel(image: 'https://images.pexels.com/photos/1049626/pexels-photo-1049626.jpeg', title: 'Pizza Steak', itemsSell: 34),
    ];
    emit(SellingItemLoaded(SellingItem));
  }

  void _addItem (AddSellingItem event, Emitter<SellingItemState> emit){
    if (state is SellingItemLoaded){
      final List<SellingItemModel> updatedSellingItem = List.from((state as SellingItemLoaded).items)..add(event.item);
      emit(SellingItemLoaded(updatedSellingItem));
    }
  }
}
