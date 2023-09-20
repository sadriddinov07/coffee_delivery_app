import 'package:coffee_shop/models/cart_item.dart';

class Cart {
  final int id;
  final double total;
  List<CartItem> items;

  Cart({
    required this.id,
    required this.total,
    this.items = const [],
  });

  double get getTotal {
    double result = .0;
    for (var item in items) {
      result += item.getTotal;
    }
    return result;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return other is Cart && other.id == id;
  }

  Cart copyWith({
    double? total,
    List<CartItem>? items,
  }) {
    return Cart(id: id, total: total ?? this.total, items: items ?? this.items);
  }

  @override
  String toString() {
    return "id: $id, total: $total items: $items";
  }
}
