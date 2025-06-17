import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_desktop_app/config/models/product_summary.dart';

part 'product_summary_event.dart';
part 'product_summary_state.dart';

class ProductSummaryBloc extends Bloc<ProductSummaryEvent, ProductSummaryState> {
  ProductSummaryBloc() : super(ProductSummaryLoading()) {
    on<LoadProductSummary>(_loadProduct);
  }
  
  void _loadProduct (LoadProductSummary event, Emitter<ProductSummaryState> emit){
    try {
      Future.delayed(Duration(seconds: 1));
      final product = ProductSummaryModel(numberOfSuppliers: 31, numberOfCategory: 21);
      emit(ProductSummaryLoaded(product));
    } catch (e){
      emit(ProductSummaryError('Failed to load product summary'));
    }
  }
}
