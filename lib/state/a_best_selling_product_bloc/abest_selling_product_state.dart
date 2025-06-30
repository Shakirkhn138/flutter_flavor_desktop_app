part of 'abest_selling_product_bloc.dart';

abstract class ABestSellingProductState extends Equatable {
  const ABestSellingProductState();

  @override
  List<Object> get props => [];
}

class ABestSellingProductInitial extends ABestSellingProductState {}

class ABestSellingProductLoading extends ABestSellingProductState {}

class ABestsellingProductLoaded extends ABestSellingProductState {
  final List<ABestSellingProductModel> sellingProducts;
  const ABestsellingProductLoaded (this.sellingProducts);

  @override
  List<Object> get props => [sellingProducts];
}