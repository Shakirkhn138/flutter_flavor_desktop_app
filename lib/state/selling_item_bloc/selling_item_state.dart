part of 'selling_item_bloc.dart';

abstract class SellingItemState extends Equatable {
  const SellingItemState ();

  @override
  List<Object> get props => [];
}

class SellingItemInitial extends SellingItemState {}

class SellingItemLoading extends SellingItemState {}

class SellingItemLoaded extends SellingItemState {
  final List<SellingItemModel> items;
  const SellingItemLoaded (this.items);

  @override
  List<Object> get props => [items];
}

class SellingItemError extends SellingItemState {
  final String error;
  const SellingItemError(this.error);

  @override
  List<Object> get props => [error];
}
