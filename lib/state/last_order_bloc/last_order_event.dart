part of 'last_order_bloc.dart';

abstract class LastOrderEvent extends Equatable {
  const LastOrderEvent();

  @override
  List<Object> get props => [];
}

class LoadOrder extends LastOrderEvent {}

class AddOrder extends LastOrderEvent {
  final LastOrderModel order;
  const AddOrder (this.order);

  @override
  List<Object> get props => [order];
}
