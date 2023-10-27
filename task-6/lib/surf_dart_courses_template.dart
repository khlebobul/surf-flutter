class Product {
  int id;
  String category;
  String name;
  double price;
  int quantity;

  Product(this.id, this.category, this.name, this.price, this.quantity);

  @override
  String toString() {
    return '$id\t$category\t$name\t${price.toStringAsFixed(2)} рублей\t$quantity штук';
  }
}

abstract class Filter {
  bool apply(Product product);
}

class CategoryFilter extends Filter {
  String category;

  CategoryFilter(this.category);

  @override
  bool apply(Product product) {
    return product.category.toLowerCase() == category.toLowerCase();
  }
}

class PriceFilter extends Filter {
  double maxPrice;

  PriceFilter(this.maxPrice);

  @override
  bool apply(Product product) {
    return product.price <= maxPrice;
  }
}

class QuantityFilter extends Filter {
  int maxQuantity;

  QuantityFilter(this.maxQuantity);

  @override
  bool apply(Product product) {
    return product.quantity < maxQuantity;
  }
}

void applyFilter(List<Product> products, Filter filter) {
  print("Id\tCategory\tName\tPrice\tQuantity");
  for (Product product in products) {
    if (filter.apply(product)) {
      print(product);
    }
  }
}

void main() {
  // Создаем список товаров
  List<Product> products = [
    Product(1, "Хлеб", "<Бородинский", 500, 5),
    Product(2, "Хлеб", "Белый", 200, 15),
    Product(3, "Молоко", "Полосатый кот", 50, 53),
    Product(4, "Молоко", "коровка", 50, 53),
    Product(5, "Вода", "Апельсин", 25, 100),
    Product(6, "Вода", "Бородинский", 500, 5),
  ];

  // Применяем фильтры и выводим результаты
  print("Filter by Category (Electronics):");
  applyFilter(products, CategoryFilter("Electronics"));

  print("\nFilter by Price (<= 1000 rubles):");
  applyFilter(products, PriceFilter(1000.0));

  print("\nFilter by Quantity (< 25 pieces):");
  applyFilter(products, QuantityFilter(25));
}
