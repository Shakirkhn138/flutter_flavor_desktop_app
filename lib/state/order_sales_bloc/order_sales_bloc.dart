import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_desktop_app/config/models/order_sales_model.dart';

part 'order_sales_event.dart';
part 'order_sales_state.dart';

class OrderSalesBloc extends Bloc<OrderSalesEvent, OrderSalesState> {
  OrderSalesBloc() : super(OrderSalesInitial()) {
    on<LoadOrderSales>(_loadSales);
  }

  void _loadSales (LoadOrderSales event, Emitter<OrderSalesState> emit){
    try{
      Future.delayed(Duration(seconds: 1));
      final sales = OrderSalesModel(sales: 4353, revenue: 6543, profit: 3456, cost: 3876);
      emit(OrderSalesLoaded(sales));
    }catch (e){
      emit(OrderSalesError('Failed to load order sales overview'));
    }
  }
}
