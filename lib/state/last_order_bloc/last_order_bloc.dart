import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_desktop_app/config/models/last_order_model.dart';

part 'last_order_event.dart';
part 'last_order_state.dart';

class LastOrderBloc extends Bloc<LastOrderEvent, LastOrderState> {
  LastOrderBloc() : super(LastOrderInitial()) {
    on<LoadOrder>(_loadOrder);
    on<AddOrder>(_addOrder);
  }
  
  void _loadOrder (LoadOrder event, Emitter<LastOrderState> emit){
    final List<LastOrderModel> lastOrder = [
      LastOrderModel(orderId: 1412, orderTime: '3:29', location: '132, first street', status: 'Delivered'),
      LastOrderModel(orderId: 1534, orderTime: '2:12', location: '132, palm street', status: 'Canceled'),
      LastOrderModel(orderId: 1645, orderTime: '4:54', location: '132, West street', status: 'On delivery'),
      LastOrderModel(orderId: 1235, orderTime: '5:43', location: '132, Green street', status: 'Delivered'),
    ];
    emit(LastOrderLoaded(lastOrder));
  }

  void _addOrder (AddOrder event, Emitter<LastOrderState> emit){
    if (state is LastOrderLoaded){
      final List<LastOrderModel> updatedLastOrder = List.from((state as LastOrderLoaded).orders)..add(event.order);
      emit(LastOrderLoaded(updatedLastOrder));
    }
  }
}
