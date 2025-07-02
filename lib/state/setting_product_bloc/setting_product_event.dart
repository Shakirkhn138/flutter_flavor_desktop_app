part of 'setting_product_bloc.dart';

abstract class SettingProductEvent extends Equatable {
  const SettingProductEvent ();

  @override
  List<Object> get props => [];
}

class LoadSettingProduct extends SettingProductEvent {}