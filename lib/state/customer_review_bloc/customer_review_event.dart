part of 'customer_review_bloc.dart';

abstract class CustomerReviewEvent extends Equatable {
  const CustomerReviewEvent();

  @override
  List<Object> get props => [];
}

class LoadCustomerReview extends CustomerReviewEvent {}

class AddCustomerReview extends CustomerReviewEvent {
  final CustomerReviewModel customerReview;
  const AddCustomerReview (this.customerReview);

  @override
  List<Object> get props => [customerReview];
}
