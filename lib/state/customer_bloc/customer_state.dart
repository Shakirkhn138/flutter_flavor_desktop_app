part of 'customer_bloc.dart';

abstract class CustomerState extends Equatable {
  const CustomerState();

  @override
  List<Object> get props => [];
}

class CustomerInitial extends CustomerState {}


class CustomerLoading extends CustomerState {}

class CustomerLoaded extends CustomerState {
  final List<CustomerModel> customers;
  const CustomerLoaded (this.customers);

  @override
  List<Object> get props => [customers];
}

class CustomerError extends CustomerState {
  final String error;
  const CustomerError (this.error);

  @override
  List<Object> get props => [error];
}
