part of 'order_list_bloc.dart';

abstract class OrderListState extends Equatable {
  const OrderListState();

  @override
  List<Object> get props => [];
}

class OrderListInitial extends OrderListState {}

class OrderListLoading extends OrderListState {}

class OrderListLoaded extends OrderListState {
  final List<OrderListModel> lists;
  const OrderListLoaded (this.lists);

  @override
  List<Object> get props => [lists];
}

class OrderListError extends OrderListState {
  final String error;
  const OrderListError (this.error);

  @override
  List<Object> get props => [error];
}