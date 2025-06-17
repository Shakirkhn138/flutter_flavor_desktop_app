part of 'sales_overview_bloc.dart';


abstract class SalesOverviewEvent extends Equatable {
  const SalesOverviewEvent ();

  @override
  List<Object> get props => [];
}

class LoadSales extends SalesOverviewEvent {}

class AddSales extends SalesOverviewEvent {
  final SalesOverviewModel sale;
  const AddSales (this.sale);

  @override
  List<Object> get props => [sale];
}