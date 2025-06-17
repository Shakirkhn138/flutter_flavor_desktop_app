import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:practice_desktop_app/config/models/purchase_overview.dart';

part 'purchase_overview_event.dart';
part 'purchase_overview_state.dart';

class PurchaseOverviewBloc extends Bloc<PurchaseOverviewEvent, PurchaseOverviewState> {
  PurchaseOverviewBloc() : super(PurchaseOverviewLoading()) {
    on<LoadPurchaseOverview>(_loadPurchase);
  }
  
  void _loadPurchase (LoadPurchaseOverview event, Emitter<PurchaseOverviewState> emit) async {
    try{
      Future.delayed(Duration(seconds: 1));
      final purchase = PurchaseOverviewModel(purchase: 82, cost: 13573, cancel: 5, sendBack: 17543);
      emit(PurchaseOverviewLoaded(purchase));
    } catch (e){
      emit(PurchaseOverviewError('Failed to load purchase overview'));
    }
  }
}
