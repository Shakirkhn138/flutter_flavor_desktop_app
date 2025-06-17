part of 'sales_overview_bloc.dart';

abstract class SalesOverviewState extends Equatable {
  const SalesOverviewState ();

  @override
  List<Object> get props => [];
}

class SalesInitial extends SalesOverviewState {}

class SalesLoading extends SalesOverviewState {}

class SalesLoaded extends SalesOverviewState {
  final List<SalesOverviewModel> sales;
  const SalesLoaded (this.sales);

  @override
  List<Object> get props => [sales];
}

class SalesError extends SalesOverviewState {
  final String error;
  const SalesError (this.error);

  @override
  List<Object> get props => [error];
}
