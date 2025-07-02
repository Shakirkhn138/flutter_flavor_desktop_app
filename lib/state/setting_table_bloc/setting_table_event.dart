part of 'setting_table_bloc.dart';

abstract class SettingTableEvent extends Equatable {
  const SettingTableEvent();

  @override
  List<Object> get props => [];
}

class LoadSettingTable extends SettingTableEvent {}

class AddSettingTable extends SettingTableEvent {
  final SettingTableModel employee;
  const AddSettingTable (this.employee);

  @override
  List<Object> get props => [employee];
}

