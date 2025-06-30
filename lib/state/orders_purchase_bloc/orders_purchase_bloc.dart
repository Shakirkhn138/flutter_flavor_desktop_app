import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_desktop_app/config/models/orders_purchase_model.dart';

part 'orders_purchase_event.dart';
part 'orders_purchase_state.dart';

class OrdersPurchaseBloc extends Bloc<OrdersPurchaseEvent, OrdersPurchaseState> {
  OrdersPurchaseBloc() : super(OrdersPurchaseInitial()) {
    on<LoadOrdersPurchase>(_loadPurchase);
  }

  void _loadPurchase (LoadOrdersPurchase event, Emitter<OrdersPurchaseState> emit){
    try {
      Future.delayed(Duration(seconds: 1));
      final purchase = OrderPurchaseModel(purchase: 1243, cost: 423, cancel: 654, sendBack: 2344);
      emit(OrdersPurchaseLoaded(purchase));
    } catch (e){
      emit(OrdersPurchaseError('Failed to load orders purchase'));
    }
  }
}
