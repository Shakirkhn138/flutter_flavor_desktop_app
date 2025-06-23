part of 'last_order_bloc.dart';

abstract class LastOrderState extends Equatable {
  const LastOrderState();

  @override
  List<Object> get props => [];
}

class LastOrderInitial extends LastOrderState {}

class LastOrderLoading extends LastOrderState {}

class LastOrderLoaded extends LastOrderState {
  final List<LastOrderModel> orders;
  const LastOrderLoaded (this.orders);

  @override
  List<Object> get props => [orders];
}

class LastOrderError extends LastOrderState {
  final String error;
  const LastOrderError (this.error);

  @override
  List<Object> get props => [error];
}
