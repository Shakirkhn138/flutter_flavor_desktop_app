import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:practice_desktop_app/config/models/setting_sales_model.dart';

part 'setting_sales_event.dart';
part 'setting_sales_state.dart';

class SettingSalesBloc extends Bloc<SettingSalesEvent, SettingSalesState> {
  SettingSalesBloc() : super(SettingSalesLoading()) {
    on<LoadSettingSales>(_loadSales);
  }

  void _loadSales (LoadSettingSales event, Emitter<SettingSalesState> emit) async {
    try{
      Future.delayed(Duration(seconds: 1));
      final purchase = SettingSalesModel(sales: 832, revenue: 13573, profit: 876, cost: 17543);
      emit(SettingSalesLoaded(purchase));
    } catch (e){
      emit(SettingSalesError('Failed to load purchase overview'));
    }
  }
}
