part of 'product_summary_bloc.dart';

abstract class ProductSummaryEvent extends Equatable {
  const ProductSummaryEvent();

  @override
  List<Object> get props => [];
}

class LoadProductSummary extends ProductSummaryEvent {}
