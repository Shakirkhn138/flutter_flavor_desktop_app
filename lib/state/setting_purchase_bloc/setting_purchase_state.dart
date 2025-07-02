part of 'setting_purchase_bloc.dart';

abstract class SettingPurchaseState extends Equatable {
  const SettingPurchaseState ();

  @override
  List<Object> get props => [];
}

class SettingPurchaseLoading extends SettingPurchaseState {}

class SettingPurchaseLoaded extends SettingPurchaseState {
  final SettingPurchaseModel purchase;

  const SettingPurchaseLoaded (this.purchase);

  @override
  List<Object> get props => [purchase];
}

class SettingPurchaseError extends SettingPurchaseState {
  final String error;
  const SettingPurchaseError (this.error);

  @override
  List<Object> get props => [error];
}
