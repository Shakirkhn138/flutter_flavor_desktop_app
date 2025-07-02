import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_desktop_app/config/models/order_list_model.dart';

part 'order_list_event.dart';
part 'order_list_state.dart';

class OrderListBloc extends Bloc<OrderListEvent, OrderListState> {
  OrderListBloc() : super(OrderListInitial()) {
    on<LoadOrderList>(_loadOrder);
    on<AddOrderList>(_addOrder);
  }

  void _loadOrder (LoadOrderList event, Emitter<OrderListState> emit){
   final List<OrderListModel> orderList = [
     OrderListModel(id: '1234', name: 'Alice Smith', address: '448 Kutch Green Apt. 089', time: '10:15 AM', price: 15.50, payment: 'Online', date: '24/10/04', status: 'Preparing'),
     OrderListModel(id: '1235', name: 'John Doe', address: '302 Elm Street', time: '09:30 AM', price: 22.00, payment: 'Cash', date: '24/10/04', status: 'Delivered'),
     OrderListModel(id: '1236', name: 'Maria Garcia', address: '55 Sunset Blvd, Apt 12', time: '11:45 AM', price: 18.75, payment: 'Online', date: '24/10/04', status: 'On Delivery'),
     OrderListModel(id: '1237', name: 'James Lee', address: '890 Downtown Ave, Suite 101', time: '08:50 AM', price: 13.20, payment: 'Card', date: '24/10/04', status: 'Cancelled'),
     OrderListModel(id: '1238', name: 'Emma Johnson', address: '77 Rosewood Street', time: '01:00 PM', price: 29.99, payment: 'Online', date: '24/10/04', status: 'Preparing'),
     OrderListModel(id: '1239', name: 'Robert Brown', address: '12 Maple Avenue', time: '02:25 PM', price: 10.00, payment: 'Cash', date: '24/10/04', status: 'Delivered'),
     OrderListModel(id: '1240', name: 'Olivia Davis', address: '403 Pine Hill', time: '03:15 PM', price: 35.40, payment: 'Card', date: '24/10/04', status: 'Preparing'),
     OrderListModel(id: '1241', name: 'Liam Wilson', address: '134 Broad Street', time: '12:05 PM', price: 19.90, payment: 'Online', date: '24/10/04', status: 'On Delivery'),
     OrderListModel(id: '1242', name: 'Sophia Martinez', address: '86 Highland Park', time: '04:45 PM', price: 17.60, payment: 'Cash', date: '24/10/04', status: 'Delivered'),
     OrderListModel(id: '1243', name: 'Noah Anderson', address: '65 North Ridge Rd', time: '06:30 PM', price: 21.25, payment: 'Card', date: '24/10/04', status: 'Cancelled'),
   ];
   emit(OrderListLoaded(orderList));
  }

  void _addOrder (AddOrderList event, Emitter<OrderListState> emit){
    if (state is OrderListLoaded){
      final List<OrderListModel> updatedOrderList = List.from((state as OrderListLoaded).lists)..add(event.list);
      emit(OrderListLoaded(updatedOrderList));
    }
  }
}
