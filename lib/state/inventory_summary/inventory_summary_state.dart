part of 'inventory_summary_bloc.dart';

abstract class InventorySummaryState extends Equatable {
  const InventorySummaryState ();

  @override
  List<Object> get props => [];
}

class InventorySummaryLoading extends InventorySummaryState {}

class InventorySummaryLoaded extends InventorySummaryState {
  final InventorySummaryModel summary;
  const InventorySummaryLoaded (this.summary);

  @override
  List<Object> get props => [summary];
}

class InventorySummaryError extends InventorySummaryState {
  final String error;
  const InventorySummaryError (this.error);

  @override
  List<Object> get props => [error];
}
