part of 'analytics_best_selling_bloc.dart';

abstract class AnalyticsBestSellingEvent extends Equatable {
  const AnalyticsBestSellingEvent();

  @override
  List<Object> get props => [];
}

class LoadBestSelling extends AnalyticsBestSellingEvent {}

class AddBestSelling extends AnalyticsBestSellingEvent {
  final AnalyticsBestSellingModel bestSelling;
  const AddBestSelling (this.bestSelling);

  @override
  List<Object> get props => [bestSelling];
}
