part of 'analytics_overview_bloc.dart';

abstract class AnalyticsOverviewEvent extends Equatable {
  const AnalyticsOverviewEvent ();

  @override
  List<Object> get props => [];
}

class LoadAnalyticsOverview extends AnalyticsOverviewEvent {}