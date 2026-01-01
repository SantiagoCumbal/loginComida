import 'package:equatable/equatable.dart';
import '../../../domain/entities/food_item_entity.dart';

abstract class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object?> get props => [];
}

class FoodInitial extends FoodState {
  const FoodInitial();
}

class FoodLoading extends FoodState {
  const FoodLoading();
}

class FoodLoaded extends FoodState {
  final List<FoodItemEntity> foodItems;
  final String selectedCategory;
  final List<String> categories;

  const FoodLoaded({
    required this.foodItems,
    required this.selectedCategory,
    required this.categories,
  });

  @override
  List<Object> get props => [foodItems, selectedCategory, categories];
}

class FoodError extends FoodState {
  final String message;

  const FoodError(this.message);

  @override
  List<Object> get props => [message];
}
