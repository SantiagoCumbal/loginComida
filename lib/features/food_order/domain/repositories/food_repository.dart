import '../entities/food_item_entity.dart';

abstract class FoodRepository {
  List<FoodItemEntity> getFoodItems();
  List<FoodItemEntity> getFoodItemsByCategory(String category);
  List<String> getCategories();
}
