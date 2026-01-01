import 'package:equatable/equatable.dart';
import 'food_item_entity.dart';

class CartItemEntity extends Equatable {
  final FoodItemEntity foodItem;
  final int quantity;
  final String? specialInstructions;

  const CartItemEntity({
    required this.foodItem,
    required this.quantity,
    this.specialInstructions,
  });

  double get totalPrice => foodItem.price * quantity;

  CartItemEntity copyWith({
    FoodItemEntity? foodItem,
    int? quantity,
    String? specialInstructions,
  }) {
    return CartItemEntity(
      foodItem: foodItem ?? this.foodItem,
      quantity: quantity ?? this.quantity,
      specialInstructions: specialInstructions ?? this.specialInstructions,
    );
  }

  @override
  List<Object?> get props => [foodItem, quantity, specialInstructions];
}
