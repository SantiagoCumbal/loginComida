import 'package:equatable/equatable.dart';
import '../../../domain/entities/cart_item_entity.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class AddToCart extends CartEvent {
  final CartItemEntity item;

  const AddToCart(this.item);

  @override
  List<Object> get props => [item];
}

class RemoveFromCart extends CartEvent {
  final String foodItemId;

  const RemoveFromCart(this.foodItemId);

  @override
  List<Object> get props => [foodItemId];
}

class UpdateQuantity extends CartEvent {
  final String foodItemId;
  final int quantity;

  const UpdateQuantity(this.foodItemId, this.quantity);

  @override
  List<Object> get props => [foodItemId, quantity];
}

class ClearCart extends CartEvent {
  const ClearCart();
}
