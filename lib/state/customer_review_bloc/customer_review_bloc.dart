import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_desktop_app/config/models/customer_review_model.dart';

part 'customer_review_event.dart';
part 'customer_review_state.dart';

class CustomerReviewBloc extends Bloc<CustomerReviewEvent, CustomerReviewState> {
  CustomerReviewBloc() : super(CustomerReviewInitial()) {
    on<LoadCustomerReview>(_loadReview);
    on<AddCustomerReview>(_addReview);
  }
  
  void _loadReview (LoadCustomerReview event, Emitter<CustomerReviewState> emit){
    final List<CustomerReviewModel> customerReview = [
      CustomerReviewModel(image: 'assets/images/profile.jpg', name: 'St Glx', location: 'South London', date: '24 sept 2023', comment: 'This restaurant offers a delightful dining experience with its flavorful dishes and warm, inviting atmosphere. The staff is attentive, and the quality of food makes it a perfect spot for both casual meals and special occasions.'),
      CustomerReviewModel(image: 'assets/images/profile.jpg', name: 'St Glx', location: 'South London', date: '24 sept 2023', comment: 'This restaurant offers a delightful dining experience with its flavorful dishes and warm, inviting atmosphere. The staff is attentive, and the quality of food makes it a perfect spot for both casual meals and special occasions.'),
      CustomerReviewModel(image: 'assets/images/profile.jpg', name: 'St Glx', location: 'South London', date: '24 sept 2023', comment: 'This restaurant offers a delightful dining experience with its flavorful dishes and warm, inviting atmosphere. The staff is attentive, and the quality of food makes it a perfect spot for both casual meals and special occasions.'),
      CustomerReviewModel(image: 'assets/images/profile.jpg', name: 'St Glx', location: 'South London', date: '24 sept 2023', comment: 'This restaurant offers a delightful dining experience with its flavorful dishes and warm, inviting atmosphere. The staff is attentive, and the quality of food makes it a perfect spot for both casual meals and special occasions.'),
    ];
    emit (CustomerReviewLoaded(customerReview));
  }

  void _addReview (AddCustomerReview event, Emitter<CustomerReviewState> emit){
    if (state is CustomerReviewLoaded){
      final List<CustomerReviewModel> updatedCustomerReview = List.from((state as CustomerReviewLoaded).customerReviews)..add(event.customerReview);
      emit(CustomerReviewLoaded(updatedCustomerReview));
    }
  }
}
