part of 'setting_inventory_bloc.dart';

abstract class SettingInventoryEvent extends Equatable {
  const SettingInventoryEvent ();

  @override
  List<Object> get props => [];
}

class LoadSettingInventory extends SettingInventoryEvent {}