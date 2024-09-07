
class CartItem {
  final String name;
  final String color;
  final String size;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    this.quantity = 1,
  });
}