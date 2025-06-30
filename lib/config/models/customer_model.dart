class CustomerModel {
  final String supplierName;
  final String product;
  final String contactNumber;
  final String email;
  final String type;
  final dynamic onTheWay;

  const CustomerModel({
    required this.supplierName,
    required this.product,
    required this.contactNumber,
    required this.email,
    required this.type,
    required this.onTheWay,
  });
}
