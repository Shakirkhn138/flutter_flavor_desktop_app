part of 'setting_purchase_bloc.dart';

abstract class SettingPurchaseEvent extends Equatable {
  const SettingPurchaseEvent ();

  @override
  List<Object> get props => [];
}

class LoadSettingPurchase extends SettingPurchaseEvent {}