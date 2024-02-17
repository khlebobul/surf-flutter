import 'package:surf_flutter_courses_template/models/products_model.dart';

/// Сортировка по цене по возрастанию
List<ProductEntity> lowToHighPrice(List<ProductEntity> products) {
  products.sort((a, b) => a.price.compareTo(b.price));
  return products;
}

/// Сортировка по цене по убыванию
List<ProductEntity> highToLowPrice(List<ProductEntity> products) {
  products.sort((a, b) => b.price.compareTo(a.price));
  return products;
}

/// Сортировка по имени от А до Я
List<ProductEntity> alphabetFromA(List<ProductEntity> products) {
  products.sort((a, b) => a.title.compareTo(b.title));
  return products;
}

/// Сортировка по имени от Я до А
List<ProductEntity> alphabetToA(List<ProductEntity> products) {
  products.sort((a, b) => b.title.compareTo(a.title));
  return products;
}

/// Сортировка по типу от А до Я
List<ProductEntity> typeFromA(List<ProductEntity> products) {
  products.sort((a, b) => a.category.name.compareTo(b.category.name));
  return products;
}

/// Сортировка по типу от Я до А
List<ProductEntity> typeToA(List<ProductEntity> products) {
  products.sort((a, b) => b.category.name.compareTo(a.category.name));
  return products;
}
