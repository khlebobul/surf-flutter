class Product {
  final int id;
  final String category;
  final String name;
  final int price;
  final int quantity;

  Product(this.id, this.category, this.name, this.price, this.quantity);

  @override
  String toString() {
    return '$id\t$category\t$name\t$price руб.\t$quantity шт.';
  }
}

abstract class Filter {
  bool apply(Product product);
}

class CategoryFilter implements Filter {
  final String categoryToFilter;

  CategoryFilter(this.categoryToFilter);

  @override
  bool apply(Product product) {
    return product.category == categoryToFilter;
  }
}

class PriceFilter implements Filter {
  final int maxPrice;

  PriceFilter(this.maxPrice);

  @override
  bool apply(Product product) {
    return product.price <= maxPrice;
  }
}

class QuantityFilter implements Filter {
  final int maxQuantity;

  QuantityFilter(this.maxQuantity);

  @override
  bool apply(Product product) {
    return product.quantity < maxQuantity;
  }
}

void applyFilter(List<Product> products, Filter filter) {
  print('ID\tКатегория\tНаименование\tЦена\tКоличество');
  for (Product product in products) {
    if (filter.apply(product)) {
      print(product);
    }
  }
}

void main() {
  final articles = '''
1,хлеб,Бородинский,500,5
2,хлеб,Белый,200,15
3,молоко,Полосатый кот,50,53
4,молоко,Коровка,50,53
5,вода,Апельсин,25,100
6,вода,Бородинский,500,5
''';

  List<String> lines = articles.trim().split('\n');

  List<Product> products = [];

  for (String line in lines) {
    List<String> parts = line.split(',');
    if (parts.length == 5) {
      int? id = int.tryParse(parts[0]);
      String category = parts[1];
      String name = parts[2];
      int? price = int.tryParse(parts[3]);
      int? quantity = int.tryParse(parts[4]);

      if (id != null && price != null && quantity != null) {
        Product product = Product(id, category, name, price, quantity);
        products.add(product);
      }
    }
  }

  print('Все товары:');
  applyFilter(products, PriceFilter(10000)); // Вывести все товары

  print('\nФильтр по категории "хлеб":');
  applyFilter(products, CategoryFilter('хлеб'));

  print('\nФильтр по цене не более 500 рублей:');
  applyFilter(products, PriceFilter(500));

  print('\nФильтр по количеству менее 10 штук:');
  applyFilter(products, QuantityFilter(10));
}
