import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:practice_desktop_app/config/models/inventory_summary_model.dart';

part 'inventory_summary_event.dart';
part 'inventory_summary_state.dart';

class InventorySummaryBloc extends Bloc<InventorySummaryEvent, InventorySummaryState>{
  InventorySummaryBloc () : super (InventorySummaryLoading()){
    on<LoadInventorySummary>(_loadSummary);
  }

  void _loadSummary (LoadInventorySummary event, Emitter<InventorySummaryState> emit) async {
    try{
      await Future.delayed(Duration(seconds: 1));

      final summary = InventorySummaryModel(quantitativeInHand: 868, toBeReceived: 200);
      emit (InventorySummaryLoaded(summary));
    }catch (e){
      emit(InventorySummaryError('Failed to load InventorySummary'));
    }
  }
}
