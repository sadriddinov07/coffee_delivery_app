import 'package:bloc/bloc.dart';
import 'package:coffee_shop/models/cart_model.dart';
import 'package:equatable/equatable.dart';
import 'package:coffee_shop/models/cart_item.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc()
      : super(
          CartInitial(
            items: Cart(
              id: 1,
              total: 0,
            ),
          ),
        ) {
    on<GetInitial>(_getInitial);
    on<Add>(_addCartItem);
  }

  void _addCartItem(Add event, Emitter emit) {
    emit(CartLoading(items: state.items));
    List<CartItem> items = state.items.items;

    for (var item in items) {
      if (item.coffeeModel.title == event.cartItem.coffeeModel.title &&
          item.size == event.cartItem.size &&
          item.coffeeModel.type == event.cartItem.coffeeModel.type) {
        var variable = item.copyWith(
          quantity: item.quantity + event.cartItem.quantity,
        );
        items.removeWhere((element) => element == item);
        items.add(variable);
        return;
      }
    }
    var list = [...items, event.cartItem];

    double result = .0;
    for (var item in list) {
      result += item.getTotal;
    }
    emit(
      CartAddSuccess(
        items: Cart(
          id: state.items.id,
          total: result,
          items: list,
        ),
      ),
    );
  }

  void _getInitial(GetInitial event, Emitter emit) {
    emit(
      CartLoading(items: state.items),
    );
    emit(
      CartGetSuccess(items: state.items),
    );
  }
}
