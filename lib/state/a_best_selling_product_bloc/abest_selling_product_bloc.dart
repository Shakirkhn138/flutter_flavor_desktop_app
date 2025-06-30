import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_desktop_app/config/models/a_best_selling_product_model.dart';

part 'abest_selling_product_event.dart';
part 'abest_selling_product_state.dart';

class ABestSellingProductBloc extends Bloc<ABestSellingProductEvent, ABestSellingProductState> {
  ABestSellingProductBloc() : super(ABestSellingProductInitial()) {
   on<LoadSellingProduct>(_loadProduct);
   on<AddSellingProduct>(_addProduct);
  }

  void _loadProduct (LoadSellingProduct event, Emitter<ABestSellingProductState> emit){
    final List<ABestSellingProductModel> sellingProduct = [
      ABestSellingProductModel(product: 'Lorem ipsum', productId: 32467, category: 'Vegetable', remainingQuantity: '225 kg', turnOver: 34567, increase: 2.4),
      ABestSellingProductModel(product: 'Lorem ipsum', productId: 56467, category: 'lorem ipsum', remainingQuantity: '300 kg', turnOver: 43467, increase: 2),
      ABestSellingProductModel(product: 'Lorem ipsum', productId: 34563, category: 'lorem ipsum', remainingQuantity: '200 packet', turnOver: 38765, increase: 4),
      ABestSellingProductModel(product: 'Lorem ipsum', productId: 37548, category: 'lorem ipsum', remainingQuantity: '100 packet', turnOver: 77654, increase: 1),
      ABestSellingProductModel(product: 'Lorem ipsum', productId: 65445, category: 'lorem ipsum', remainingQuantity: '73 kg', turnOver: 77656, increase: 2),
      ABestSellingProductModel(product: 'Lorem ipsum', productId: 23446, category: 'lorem ipsum', remainingQuantity: '34 packet', turnOver: 87654, increase: 1.5),
    ];
    emit(ABestsellingProductLoaded(sellingProduct));
  }

  void _addProduct (AddSellingProduct event, Emitter<ABestSellingProductState> emit){
    if (state is ABestsellingProductLoaded){
      final List<ABestSellingProductModel> updatedSellingProduct = List.from((state as ABestsellingProductLoaded).sellingProducts)..add(event.sellingProduct);
      emit(ABestsellingProductLoaded(updatedSellingProduct));
    }
  }
}
