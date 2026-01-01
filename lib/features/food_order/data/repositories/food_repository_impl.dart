import 'package:injectable/injectable.dart';
import '../../domain/entities/food_item_entity.dart';
import '../../domain/repositories/food_repository.dart';
import '../datasources/food_local_data_source.dart';

@LazySingleton(as: FoodRepository)
class FoodRepositoryImpl implements FoodRepository {
  final FoodLocalDataSource localDataSource;

  FoodRepositoryImpl(this.localDataSource);

  @override
  List<FoodItemEntity> getFoodItems() {
    return localDataSource.getFoodItems();
  }

  @override
  List<FoodItemEntity> getFoodItemsByCategory(String category) {
    if (category == 'Todos') {
      return localDataSource.getFoodItems();
    }
    return localDataSource
        .getFoodItems()
        .where((item) => item.category == category)
        .toList();
  }

  @override
  List<String> getCategories() {
    return localDataSource.getCategories();
  }
}
