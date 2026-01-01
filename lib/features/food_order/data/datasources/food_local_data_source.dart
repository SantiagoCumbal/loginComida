import 'package:injectable/injectable.dart';
import '../models/food_item_model.dart';

abstract class FoodLocalDataSource {
  List<FoodItemModel> getFoodItems();
  List<String> getCategories();
}

@LazySingleton(as: FoodLocalDataSource)
class FoodLocalDataSourceImpl implements FoodLocalDataSource {
  @override
  List<FoodItemModel> getFoodItems() {
    return [
      // Hamburguesas
      const FoodItemModel(
        id: '1',
        name: 'Hamburguesa Clásica',
        description: 'Deliciosa hamburguesa con carne, lechuga, tomate y queso',
        price: 8.99,
        imageUrl:
            'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400',
        category: 'Hamburguesas',
        ingredients: ['Carne', 'Lechuga', 'Tomate', 'Queso', 'Pan'],
        preparationTime: 15,
      ),
      const FoodItemModel(
        id: '2',
        name: 'Hamburguesa BBQ',
        description: 'Con salsa BBQ, cebolla caramelizada y bacon',
        price: 10.99,
        imageUrl:
            'https://images.unsplash.com/photo-1550547660-d9450f859349?w=400',
        category: 'Hamburguesas',
        ingredients: ['Carne', 'Bacon', 'Salsa BBQ', 'Cebolla', 'Pan'],
        preparationTime: 18,
      ),
      const FoodItemModel(
        id: '3',
        name: 'Hamburguesa Doble',
        description: 'Doble carne, doble queso, sabor inigualable',
        price: 12.99,
        imageUrl:
            'https://images.unsplash.com/photo-1551782450-a2132b4ba21d?w=400',
        category: 'Hamburguesas',
        ingredients: ['Doble Carne', 'Doble Queso', 'Lechuga', 'Pan'],
        preparationTime: 20,
      ),

      // Pollo Frito
      const FoodItemModel(
        id: '4',
        name: 'Pollo Frito Original',
        description: 'Crujiente pollo frito con receta secreta de especias',
        price: 9.99,
        imageUrl:
            'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=400',
        category: 'Pollo Frito',
        ingredients: ['Pollo', 'Especias', 'Harina'],
        preparationTime: 20,
      ),
      const FoodItemModel(
        id: '5',
        name: 'Alitas Picantes',
        description: '8 alitas con salsa picante y especias',
        price: 11.99,
        imageUrl:
            'https://images.unsplash.com/photo-1608039755401-742074f0548d?w=400',
        category: 'Pollo Frito',
        ingredients: ['Alitas', 'Salsa Picante', 'Especias'],
        preparationTime: 15,
      ),
      const FoodItemModel(
        id: '6',
        name: 'Nuggets de Pollo',
        description: '10 nuggets crujientes con salsa a elección',
        price: 7.99,
        imageUrl:
            'https://images.unsplash.com/photo-1562967914-608f82629710?w=400',
        category: 'Pollo Frito',
        ingredients: ['Pollo', 'Empanizado', 'Salsa'],
        preparationTime: 12,
      ),

      // Pizza
      const FoodItemModel(
        id: '7',
        name: 'Pizza Margherita',
        description: 'Pizza clásica con tomate, mozzarella y albahaca',
        price: 13.99,
        imageUrl:
            'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=400',
        category: 'Pizzas',
        ingredients: ['Tomate', 'Mozzarella', 'Albahaca'],
        preparationTime: 25,
      ),
      const FoodItemModel(
        id: '8',
        name: 'Pizza Pepperoni',
        description: 'Generosas porciones de pepperoni sobre queso fundido',
        price: 15.99,
        imageUrl:
            'https://images.unsplash.com/photo-1628840042765-356cda07504e?w=400',
        category: 'Pizzas',
        ingredients: ['Pepperoni', 'Mozzarella', 'Salsa de tomate'],
        preparationTime: 25,
      ),
      const FoodItemModel(
        id: '9',
        name: 'Pizza Vegetariana',
        description: 'Variedad de vegetales frescos sobre masa artesanal',
        price: 14.99,
        imageUrl:
            'https://images.unsplash.com/photo-1511689660979-10d2b1aada49?w=400',
        category: 'Pizzas',
        ingredients: ['Pimientos', 'Champiñones', 'Cebolla', 'Aceitunas'],
        preparationTime: 25,
      ),

      // Bebidas
      const FoodItemModel(
        id: '10',
        name: 'Coca Cola',
        description: 'Refresco clásico 500ml',
        price: 2.50,
        imageUrl:
            'https://images.unsplash.com/photo-1554866585-cd94860890b7?w=400',
        category: 'Bebidas',
        ingredients: ['Refresco'],
        preparationTime: 1,
      ),
      const FoodItemModel(
        id: '11',
        name: 'Limonada Natural',
        description: 'Refrescante limonada hecha en casa',
        price: 3.50,
        imageUrl:
            'https://images.unsplash.com/photo-1523677011781-c91d1bbe1f1b?w=400',
        category: 'Bebidas',
        ingredients: ['Limón', 'Azúcar', 'Agua'],
        preparationTime: 3,
      ),
      const FoodItemModel(
        id: '12',
        name: 'Batido de Fresa',
        description: 'Cremoso batido de fresas frescas',
        price: 4.99,
        imageUrl:
            'https://images.unsplash.com/photo-1577805947697-89e18249d767?w=400',
        category: 'Bebidas',
        ingredients: ['Fresa', 'Leche', 'Helado'],
        preparationTime: 5,
      ),

      // Postres
      const FoodItemModel(
        id: '13',
        name: 'Helado de Vainilla',
        description: 'Suave helado de vainilla con topping a elección',
        price: 3.99,
        imageUrl:
            'https://images.unsplash.com/photo-1570197788417-0e82375c9371?w=400',
        category: 'Postres',
        ingredients: ['Helado', 'Vainilla'],
        preparationTime: 2,
      ),
      const FoodItemModel(
        id: '14',
        name: 'Brownie con Helado',
        description: 'Brownie de chocolate caliente con helado de vainilla',
        price: 5.99,
        imageUrl:
            'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=400',
        category: 'Postres',
        ingredients: ['Brownie', 'Helado', 'Chocolate'],
        preparationTime: 8,
      ),
    ];
  }

  @override
  List<String> getCategories() {
    return [
      'Todos',
      'Hamburguesas',
      'Pollo Frito',
      'Pizzas',
      'Bebidas',
      'Postres',
    ];
  }
}
