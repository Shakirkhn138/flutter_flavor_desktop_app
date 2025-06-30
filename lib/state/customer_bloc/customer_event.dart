part of 'customer_bloc.dart';

abstract class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  List<Object> get props => [];
}

class LoadCustomer extends CustomerEvent {}

class AddCustomer extends CustomerEvent {
  final CustomerModel customer;
  const AddCustomer (this.customer);

  @override
  List<Object> get props => [customer];
}
