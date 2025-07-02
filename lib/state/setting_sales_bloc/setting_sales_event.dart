part of 'setting_sales_bloc.dart';

abstract class SettingSalesEvent extends Equatable {
  const SettingSalesEvent ();

  @override
  List<Object> get props => [];
}

class LoadSettingSales extends SettingSalesEvent {}