import 'package:equatable/equatable.dart';

abstract class FoodEvent extends Equatable {
  const FoodEvent();

  @override
  List<Object?> get props => [];
}

class LoadFoodItems extends FoodEvent {
  const LoadFoodItems();
}

class FilterByCategory extends FoodEvent {
  final String category;

  const FilterByCategory(this.category);

  @override
  List<Object> get props => [category];
}

class SearchFoodItems extends FoodEvent {
  final String query;

  const SearchFoodItems(this.query);

  @override
  List<Object> get props => [query];
}
