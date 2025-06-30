part of 'abest_selling_product_bloc.dart';

abstract class ABestSellingProductEvent extends Equatable {
  const ABestSellingProductEvent();

  @override
  List<Object> get props => [];
}

class LoadSellingProduct extends ABestSellingProductEvent {}

class AddSellingProduct extends ABestSellingProductEvent {
  final ABestSellingProductModel sellingProduct;
  const AddSellingProduct (this.sellingProduct);

  @override
  List<Object> get props => [sellingProduct];
}
