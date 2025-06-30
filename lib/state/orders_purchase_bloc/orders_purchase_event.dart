part of 'orders_purchase_bloc.dart';

abstract class OrdersPurchaseEvent extends Equatable {
  const OrdersPurchaseEvent();

  @override
  List<Object> get props => [];
}

class LoadOrdersPurchase extends OrdersPurchaseEvent {}




