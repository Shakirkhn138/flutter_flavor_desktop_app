part of 'order_list_bloc.dart';

abstract class OrderListEvent extends Equatable {
  const OrderListEvent();

  @override
  List<Object> get props => [];
}

class LoadOrderList extends OrderListEvent {}

class AddOrderList extends OrderListEvent {
  final OrderListModel list;
  const AddOrderList (this.list);

  @override
  List<Object> get props => [list];
}
