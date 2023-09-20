part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class GetInitial extends CartEvent {}

class Add extends CartEvent {
  final CartItem cartItem;

  const Add(this.cartItem);
}
