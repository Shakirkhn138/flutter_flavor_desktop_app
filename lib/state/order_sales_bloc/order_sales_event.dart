part of 'order_sales_bloc.dart';

abstract class OrderSalesEvent extends Equatable {
  const OrderSalesEvent();

  @override
  List<Object> get props => [];
}

class LoadOrderSales extends OrderSalesEvent {}
