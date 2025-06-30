part of 'orders_purchase_bloc.dart';

abstract class OrdersPurchaseState extends Equatable {
  const OrdersPurchaseState();

  @override
  List<Object> get props => [];
}

class OrdersPurchaseInitial extends OrdersPurchaseState {}

class OrdersPurchaseLoading extends OrdersPurchaseState {}

class OrdersPurchaseLoaded extends OrdersPurchaseState {
  final OrderPurchaseModel purchase;
  const OrdersPurchaseLoaded (this.purchase);

  @override
  List<Object> get props => [purchase];
}

class OrdersPurchaseError extends OrdersPurchaseState {
  final String error;
  const OrdersPurchaseError (this.error);

  @override
  List<Object> get props => [error];
}
