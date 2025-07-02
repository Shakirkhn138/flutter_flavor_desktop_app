part of 'setting_sales_bloc.dart';

abstract class SettingSalesState extends Equatable {
  const SettingSalesState ();

  @override
  List<Object> get props => [];
}

class SettingSalesLoading extends SettingSalesState {}

class SettingSalesLoaded extends SettingSalesState {
  final SettingSalesModel sales;

  const SettingSalesLoaded (this.sales);

  @override
  List<Object> get props => [sales];
}

class SettingSalesError extends SettingSalesState {
  final String error;
  const SettingSalesError (this.error);

  @override
  List<Object> get props => [error];
}
