import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:practice_desktop_app/config/models/setting_puchase_model.dart';

part 'setting_purchase_event.dart';
part 'setting_purchase_state.dart';

class SettingPurchaseBloc extends Bloc<SettingPurchaseEvent, SettingPurchaseState> {
  SettingPurchaseBloc() : super(SettingPurchaseLoading()) {
    on<LoadSettingPurchase>(_loadPurchase);
  }

  void _loadPurchase (LoadSettingPurchase event, Emitter<SettingPurchaseState> emit) async {
    try{
      Future.delayed(Duration(seconds: 1));
      final purchase = SettingPurchaseModel(purchase: 82, cost: 13573, cancel: 5, sendBack: 17543);
      emit(SettingPurchaseLoaded(purchase));
    } catch (e){
      emit(SettingPurchaseError('Failed to load purchase overview'));
    }
  }
}

