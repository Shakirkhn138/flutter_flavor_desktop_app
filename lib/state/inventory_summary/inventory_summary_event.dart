part of 'inventory_summary_bloc.dart';

abstract class InventorySummaryEvent extends Equatable {
  const InventorySummaryEvent ();

  @override
  List<Object> get props => [];
}

class LoadInventorySummary extends InventorySummaryEvent {}