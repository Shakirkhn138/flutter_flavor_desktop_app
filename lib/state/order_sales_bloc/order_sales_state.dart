part of 'order_sales_bloc.dart';

abstract class OrderSalesState extends Equatable {
  const OrderSalesState();

  @override
  List<Object> get props => [];
}

class OrderSalesInitial extends OrderSalesState {}

class OrderSalesLoading extends OrderSalesState {}

class OrderSalesLoaded extends OrderSalesState {
  final OrderSalesModel sale;
  const OrderSalesLoaded (this.sale);

  @override
  List<Object> get props => [sale];
}

class OrderSalesError extends OrderSalesState {
  final String error;
  const OrderSalesError (this.error);

  @override
  List<Object> get props => [error];
}
