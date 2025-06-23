part of 'customer_review_bloc.dart';

abstract class CustomerReviewState extends Equatable {
  const CustomerReviewState();

  @override
  List<Object> get props => [];
}

class CustomerReviewInitial extends CustomerReviewState {}

class CustomerReviewLoading extends CustomerReviewState {}

class CustomerReviewLoaded extends CustomerReviewState {
  final List<CustomerReviewModel> customerReviews;
  const CustomerReviewLoaded (this.customerReviews);

  @override
  List<Object> get props => [customerReviews];
}

