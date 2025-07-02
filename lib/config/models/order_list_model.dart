
class OrderListModel {
  final String id;
  final String name;
  final String address;
  final String time;
  final double price;
  final String payment;
  final String date;
  final String status;

  const OrderListModel ({
    required this.id,
    required this.name,
    required this.address,
    required this.time,
    required this.price,
    required this.payment,
    required this.date,
    required this.status,
});
}