import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'cart_event.dart';
import 'cart_state.dart';
import '../../../domain/entities/cart_item_entity.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartEmpty()) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<UpdateQuantity>(_onUpdateQuantity);
    on<ClearCart>(_onClearCart);
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    final List<CartItemEntity> items;

    if (state is CartEmpty) {
      items = [event.item];
    } else {
      final currentState = state as CartLoaded;
      final existingIndex = currentState.items.indexWhere(
        (item) => item.foodItem.id == event.item.foodItem.id,
      );

      if (existingIndex >= 0) {
        items = List.from(currentState.items);
        items[existingIndex] = items[existingIndex].copyWith(
          quantity: items[existingIndex].quantity + event.item.quantity,
        );
      } else {
        items = [...currentState.items, event.item];
      }
    }

    final totalAmount = items.fold(
      0.0,
      (sum, item) => sum + item.totalPrice,
    );
    final totalItems = items.fold(
      0,
      (sum, item) => sum + item.quantity,
    );

    emit(CartLoaded(
      items: items,
      totalAmount: totalAmount,
      totalItems: totalItems,
    ));
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final items = currentState.items
          .where((item) => item.foodItem.id != event.foodItemId)
          .toList();

      if (items.isEmpty) {
        emit(const CartEmpty());
      } else {
        final totalAmount = items.fold(
          0.0,
          (sum, item) => sum + item.totalPrice,
        );
        final totalItems = items.fold(
          0,
          (sum, item) => sum + item.quantity,
        );

        emit(CartLoaded(
          items: items,
          totalAmount: totalAmount,
          totalItems: totalItems,
        ));
      }
    }
  }

  void _onUpdateQuantity(UpdateQuantity event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final items = currentState.items.map((item) {
        if (item.foodItem.id == event.foodItemId) {
          return item.copyWith(quantity: event.quantity);
        }
        return item;
      }).toList();

      final totalAmount = items.fold(
        0.0,
        (sum, item) => sum + item.totalPrice,
      );
      final totalItems = items.fold(
        0,
        (sum, item) => sum + item.quantity,
      );

      emit(CartLoaded(
        items: items,
        totalAmount: totalAmount,
        totalItems: totalItems,
      ));
    }
  }

  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    emit(const CartEmpty());
  }
}
