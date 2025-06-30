import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:practice_desktop_app/config/models/analytics_overview_model.dart';

part 'analytics_overview_event.dart';
part 'analytics_overview_state.dart';

class AnalyticsOverviewBloc extends Bloc<AnalyticsOverviewEvent, AnalyticsOverviewState>{
  AnalyticsOverviewBloc (): super(AnalyticsOverviewLoading()){
    on<LoadAnalyticsOverview>(_analyticsOverview);
  }
  
  void _analyticsOverview (LoadAnalyticsOverview event, Emitter<AnalyticsOverviewState> emit){
    try{
      Future.delayed(Duration(seconds: 1));
      final overview = AnalyticsOverviewModel(totalProfit: 21190, revenue: 18300, sales: 17432, netPurchaseValue: 117432, netSalesValue: 80432, momProfit: 30432, yoyProfit: 110432);
      emit(AnalyticsOverviewLoaded(overview));
    }catch (e){
      emit(AnalyticsOverviewError('Failed to load Analytics Overview'));
    }
    
  }
}
