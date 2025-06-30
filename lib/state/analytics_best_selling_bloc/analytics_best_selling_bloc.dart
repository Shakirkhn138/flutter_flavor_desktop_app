import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_desktop_app/config/models/analytics_best_selling_model.dart';
import 'package:practice_desktop_app/config/models/analytics_overview_model.dart';

part 'analytics_best_selling_event.dart';
part 'analytics_best_selling_state.dart';

class AnalyticsBestSellingBloc extends Bloc<AnalyticsBestSellingEvent, AnalyticsBestSellingState> {
  AnalyticsBestSellingBloc() : super(AnalyticsBestSellingInitial()) {
   on<LoadBestSelling>(_loadSelling);
   on<AddBestSelling>(_addSelling);
  }
  
  void _loadSelling (LoadBestSelling event, Emitter<AnalyticsBestSellingState> emit){
    final List<AnalyticsBestSellingModel> bestSelling = [
      AnalyticsBestSellingModel(category: 'Vegetable', turnOver: 26000, increase: 3.2),
      AnalyticsBestSellingModel(category: 'Instant Food', turnOver: 22000, increase: 2),
      AnalyticsBestSellingModel(category: 'Households', turnOver: 2000, increase: 1.5),
    ];
    emit(AnalyticsBestSellingLoaded(bestSelling));
  }

  void _addSelling (AddBestSelling event, Emitter<AnalyticsBestSellingState> emit){
    if (state is AnalyticsBestSellingLoaded){
      final List<AnalyticsBestSellingModel> updatedBestSelling = List.from((state as AnalyticsBestSellingLoaded).topSelling)..add(event.bestSelling);
      emit(AnalyticsBestSellingLoaded(updatedBestSelling));
    }
  }
}
