part of 'product_summary_bloc.dart';

abstract class ProductSummaryState extends Equatable {
  const ProductSummaryState();

  @override
  List<Object> get props => [];
}

class ProductSummaryLoading extends ProductSummaryState {}

class ProductSummaryLoaded extends ProductSummaryState {
  final ProductSummaryModel product;
  const ProductSummaryLoaded (this.product);

  @override
  List<Object> get props => [product];
}

class ProductSummaryError extends ProductSummaryState {
  final String error;
  const ProductSummaryError (this.error);

  @override
  List<Object> get props => [error];
}
