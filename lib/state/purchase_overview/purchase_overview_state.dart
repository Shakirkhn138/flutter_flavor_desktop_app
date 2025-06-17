part of 'purchase_overview_bloc.dart';

abstract class PurchaseOverviewState extends Equatable {
  const PurchaseOverviewState ();

  @override
  List<Object> get props => [];
}

class PurchaseOverviewLoading extends PurchaseOverviewState {}

class PurchaseOverviewLoaded extends PurchaseOverviewState {
  final PurchaseOverviewModel purchase;

  const PurchaseOverviewLoaded (this.purchase);

  @override
  List<Object> get props => [purchase];
}

class PurchaseOverviewError extends PurchaseOverviewState {
  final String error;
  const PurchaseOverviewError (this.error);

  @override
  List<Object> get props => [error];
}
