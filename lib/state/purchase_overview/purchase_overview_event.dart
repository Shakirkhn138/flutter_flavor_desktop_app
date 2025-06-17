part of 'purchase_overview_bloc.dart';

abstract class PurchaseOverviewEvent extends Equatable {
  const PurchaseOverviewEvent ();

  @override
  List<Object> get props => [];
}

class LoadPurchaseOverview extends PurchaseOverviewEvent {}