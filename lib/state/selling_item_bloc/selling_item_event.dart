part of 'selling_item_bloc.dart';

abstract class SellingItemEvent extends Equatable {
  const SellingItemEvent ();

  @override
  List<Object> get props => [];
}

class LoadSellingItem extends SellingItemEvent {}

class AddSellingItem extends SellingItemEvent {
  final SellingItemModel item;
  const AddSellingItem (this.item);

  @override
  List<Object> get props => [item];
}