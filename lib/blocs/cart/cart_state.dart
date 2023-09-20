part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  final Cart items;

  const CartState({required this.items});

  @override
  List<Object> get props => [items];
}

class CartInitial extends CartState {
  const CartInitial({required super.items});
}

class CartLoading extends CartState {
  const CartLoading({required super.items});
}

class CartFailure extends CartState {
  const CartFailure({required super.items});
}

// class CartMinSuccess extends CartState {
//   CartMinSuccess({
//     required super.min,
//     required super.medium,
//     required super.max,
//     required super.cartItem,
//   });
// }
//
// class CartMediumSuccess extends CartState {
//   CartMediumSuccess({
//     required super.min,
//     required super.medium,
//     required super.max,
//     required super.cartItem,
//   });
// }
//
// class CartMaxSuccess extends CartState {
//   CartMaxSuccess({
//     required super.min,
//     required super.medium,
//     required super.max,
//     required super.cartItem,
//   });
// }

class CartGetSuccess extends CartState {
  const CartGetSuccess({required super.items});
}

class CartAddSuccess extends CartState {
  const CartAddSuccess({required super.items});
}
