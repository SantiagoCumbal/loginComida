import 'package:equatable/equatable.dart';

class FoodItemEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final bool isAvailable;
  final List<String> ingredients;
  final int preparationTime;

  const FoodItemEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.isAvailable = true,
    this.ingredients = const [],
    this.preparationTime = 15,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        imageUrl,
        category,
        isAvailable,
        ingredients,
        preparationTime,
      ];
}
