part of 'setting_inventory_bloc.dart';

abstract class SettingInventoryState extends Equatable {
  const SettingInventoryState ();

  @override
  List<Object> get props => [];
}

class SettingInventoryLoading extends SettingInventoryState {}

class SettingInventoryLoaded extends SettingInventoryState {
  final SettingInventoryModel inventory;

  const SettingInventoryLoaded (this.inventory);

  @override
  List<Object> get props => [inventory];
}

class SettingInventoryError extends SettingInventoryState {
  final String error;
  const SettingInventoryError (this.error);

  @override
  List<Object> get props => [error];
}
