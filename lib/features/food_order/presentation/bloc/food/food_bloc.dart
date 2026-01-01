import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/repositories/food_repository.dart';
import 'food_event.dart';
import 'food_state.dart';

@injectable
class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final FoodRepository repository;

  FoodBloc(this.repository) : super(const FoodInitial()) {
    on<LoadFoodItems>(_onLoadFoodItems);
    on<FilterByCategory>(_onFilterByCategory);
    on<SearchFoodItems>(_onSearchFoodItems);
  }

  Future<void> _onLoadFoodItems(
    LoadFoodItems event,
    Emitter<FoodState> emit,
  ) async {
    emit(const FoodLoading());
    try {
      final foodItems = repository.getFoodItems();
      final categories = repository.getCategories();
      emit(FoodLoaded(
        foodItems: foodItems,
        selectedCategory: 'Todos',
        categories: categories,
      ));
    } catch (e) {
      emit(FoodError(e.toString()));
    }
  }

  Future<void> _onFilterByCategory(
    FilterByCategory event,
    Emitter<FoodState> emit,
  ) async {
    try {
      final categories = repository.getCategories();
      final foodItems = repository.getFoodItemsByCategory(event.category);
      emit(FoodLoaded(
        foodItems: foodItems,
        selectedCategory: event.category,
        categories: categories,
      ));
    } catch (e) {
      emit(FoodError(e.toString()));
    }
  }

  Future<void> _onSearchFoodItems(
    SearchFoodItems event,
    Emitter<FoodState> emit,
  ) async {
    if (state is FoodLoaded) {
      final currentState = state as FoodLoaded;
      final allItems = repository.getFoodItems();
      final filteredItems = allItems
          .where((item) =>
              item.name.toLowerCase().contains(event.query.toLowerCase()) ||
              item.description
                  .toLowerCase()
                  .contains(event.query.toLowerCase()))
          .toList();
      emit(FoodLoaded(
        foodItems: filteredItems,
        selectedCategory: currentState.selectedCategory,
        categories: currentState.categories,
      ));
    }
  }
}
