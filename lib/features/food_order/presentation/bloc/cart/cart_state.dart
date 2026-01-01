import 'package:equatable/equatable.dart';
import '../../../domain/entities/cart_item_entity.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartEmpty extends CartState {
  const CartEmpty();
}

class CartLoaded extends CartState {
  final List<CartItemEntity> items;
  final double totalAmount;
  final int totalItems;

  const CartLoaded({
    required this.items,
    required this.totalAmount,
    required this.totalItems,
  });

  @override
  List<Object> get props => [items, totalAmount, totalItems];
}
