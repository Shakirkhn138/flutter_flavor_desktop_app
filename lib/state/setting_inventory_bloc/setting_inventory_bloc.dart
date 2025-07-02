import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:practice_desktop_app/config/models/setting_inventory_model.dart';

part 'setting_inventory_event.dart';
part 'setting_inventory_state.dart';

class SettingInventoryBloc extends Bloc<SettingInventoryEvent, SettingInventoryState> {
  SettingInventoryBloc() : super(SettingInventoryLoading()) {
    on<LoadSettingInventory>(_loadInventory);
  }

  void _loadInventory (LoadSettingInventory event, Emitter<SettingInventoryState> emit) async {
    try{
      Future.delayed(Duration(seconds: 1));
      final product = SettingInventoryModel(quantityInHand: 987, toBeReceived: 678);
      emit(SettingInventoryLoaded(product));
    } catch (e){
      emit(SettingInventoryError('Failed to load purchase overview'));
    }
  }
}

