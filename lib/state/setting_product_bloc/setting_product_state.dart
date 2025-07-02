part of 'setting_product_bloc.dart';

abstract class SettingProductState extends Equatable {
  const SettingProductState ();

  @override
  List<Object> get props => [];
}

class SettingProductLoading extends SettingProductState {}

class SettingProductLoaded extends SettingProductState {
  final SettingProductModel product;

  const SettingProductLoaded (this.product);

  @override
  List<Object> get props => [product];
}

class SettingProductError extends SettingProductState {
  final String error;
  const SettingProductError (this.error);

  @override
  List<Object> get props => [error];
}
