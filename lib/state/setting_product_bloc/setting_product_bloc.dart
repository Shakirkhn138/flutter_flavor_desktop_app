import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:practice_desktop_app/config/models/setting_product_model.dart';

part 'setting_product_event.dart';
part 'setting_product_state.dart';

class SettingProductBloc extends Bloc<SettingProductEvent, SettingProductState> {
  SettingProductBloc() : super(SettingProductLoading()) {
    on<LoadSettingProduct>(_loadProduct);
  }

  void _loadProduct (LoadSettingProduct event, Emitter<SettingProductState> emit) async {
    try{
      Future.delayed(Duration(seconds: 1));
      final product = SettingProductModel(numberOfCategory: 32, numberOfSuppliers: 21);
      emit(SettingProductLoaded(product));
    } catch (e){
      emit(SettingProductError('Failed to load purchase overview'));
    }
  }
}
