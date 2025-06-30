
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_desktop_app/config/models/customer_model.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerBloc() : super(CustomerInitial()) {
    on<LoadCustomer>(_loadCustomer);
    on<AddCustomer>(_addCustomer);
  }
  
  void _loadCustomer (LoadCustomer event, Emitter<CustomerState> emit){
    final List<CustomerModel> customerData = [
      CustomerModel(
        supplierName: 'Ali Khan',
        product: 'Cappuccino',
        contactNumber: '03001234567',
        email: 'ali@cafesupreme.com',
        type: 'Taking Return',
        onTheWay: '-',
      ),
      CustomerModel(
        supplierName: 'Sana Raza',
        product: 'Latte',
        contactNumber: '03111234567',
        email: 'sana@morningbrew.com',
        type: 'Not Taking Return',
        onTheWay: 2,
      ),
      CustomerModel(
        supplierName: 'Umar Farooq',
        product: 'Grilled Sandwich',
        contactNumber: '03221234567',
        email: 'umar@toastroast.com',
        type: 'Taking Return',
        onTheWay: 1,
      ),
      CustomerModel(
        supplierName: 'Zara Sheikh',
        product: 'Chocolate Cake',
        contactNumber: '03331234567',
        email: 'zara@sugarrush.com',
        type: 'Not Taking Return',
        onTheWay: '-',
      ),
      CustomerModel(
        supplierName: 'Hassan Ali',
        product: 'Green Tea',
        contactNumber: '03441234567',
        email: 'hassan@thesipspot.com',
        type: 'Taking Return',
        onTheWay: 3,
      ),
      CustomerModel(
        supplierName: 'Ayesha Noor',
        product: 'Cold Coffee',
        contactNumber: '03551234567',
        email: 'ayesha@cafebliss.com',
        type: 'Not Taking Return',
        onTheWay: '-',
      ),
      CustomerModel(
        supplierName: 'Bilal Ahmed',
        product: 'Espresso',
        contactNumber: '03661234567',
        email: 'bilal@dailygrind.com',
        type: 'Taking Return',
        onTheWay: 1,
      ),
      CustomerModel(
        supplierName: 'Fatima Bukhari',
        product: 'Croissant',
        contactNumber: '03771234567',
        email: 'fatima@crumbcream.com',
        type: 'Not Taking Return',
        onTheWay: 2,
      ),
      CustomerModel(
        supplierName: 'Hamza Tariq',
        product: 'Mocha',
        contactNumber: '03881234567',
        email: 'hamza@mochamoment.com',
        type: 'Taking Return',
        onTheWay: '-',
      ),
      CustomerModel(
        supplierName: 'Noor Javed',
        product: 'Masala Chai',
        contactNumber: '03991234567',
        email: 'noor@chaijunction.com',
        type: 'Not Taking Return',
        onTheWay: 4,
      ),
    ];

    emit(CustomerLoaded(customerData));
  }

  void _addCustomer (AddCustomer event, Emitter<CustomerState> emit){
    if (state is CustomerLoaded){
      final List<CustomerModel> updatedCustomer = List.from((state as CustomerLoaded).customers)..add(event.customer);
      emit(CustomerLoaded(updatedCustomer));
    }
  }
}
