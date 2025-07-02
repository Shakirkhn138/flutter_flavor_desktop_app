part of 'setting_table_bloc.dart';

abstract class SettingTableState extends Equatable {
  const SettingTableState();

  @override
  List<Object> get props => [];
}

class SettingTableInitial extends SettingTableState {}

class SettingTableLoading extends SettingTableState {}

class SettingTableLoaded extends SettingTableState {
  final List<SettingTableModel> employees;
  const SettingTableLoaded (this.employees);

  @override
  List<Object> get props => [employees];
}

class SettingTableError extends SettingTableState {
  final String error;
  const SettingTableError (this.error);

  @override
  List<Object> get props => [error];
}
