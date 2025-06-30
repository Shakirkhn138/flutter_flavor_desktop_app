part of 'analytics_best_selling_bloc.dart';

abstract class AnalyticsBestSellingState extends Equatable {
  const AnalyticsBestSellingState();

  @override
  List<Object> get props => [];
}

class AnalyticsBestSellingInitial extends AnalyticsBestSellingState {}

class AnalyticsBestSellingLoading extends AnalyticsBestSellingState {}

class AnalyticsBestSellingLoaded extends AnalyticsBestSellingState {
  final List<AnalyticsBestSellingModel> topSelling;
  const AnalyticsBestSellingLoaded (this.topSelling);

  @override
  List<Object> get props => [topSelling];
}

class AnalyticsBestSellingError extends AnalyticsBestSellingState {
  final String error;
  const AnalyticsBestSellingError (this.error);

  @override
  List<Object> get props => [error];
}

