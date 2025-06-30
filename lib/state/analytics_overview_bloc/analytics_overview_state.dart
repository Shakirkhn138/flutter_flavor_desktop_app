part of 'analytics_overview_bloc.dart';

abstract class AnalyticsOverviewState extends Equatable {
  const AnalyticsOverviewState ();

  @override
  List<Object> get props => [];
}

class AnalyticsOverviewLoading extends AnalyticsOverviewState {}

class AnalyticsOverviewLoaded extends AnalyticsOverviewState {
  final AnalyticsOverviewModel overview;
  const AnalyticsOverviewLoaded (this.overview);

  @override
  List<Object> get props => [overview];
}

class AnalyticsOverviewError extends AnalyticsOverviewState {
  final String error;
  const AnalyticsOverviewError (this.error);

  @override
  List<Object> get props => [error];
}