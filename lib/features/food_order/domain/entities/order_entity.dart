import 'package:equatable/equatable.dart';
import 'cart_item_entity.dart';

enum OrderStatus { pending, preparing, ready, delivered, cancelled }

class OrderEntity extends Equatable {
  final String id;
  final List<CartItemEntity> items;
  final double totalAmount;
  final DateTime orderDate;
  final OrderStatus status;
  final String deliveryAddress;

  const OrderEntity({
    required this.id,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
    required this.status,
    required this.deliveryAddress,
  });

  @override
  List<Object?> get props => [
        id,
        items,
        totalAmount,
        orderDate,
        status,
        deliveryAddress,
      ];
}
