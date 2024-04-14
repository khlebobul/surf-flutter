/// Подумайте и ответьте на три вопроса:
/// 1. Почему цена хранится в копейках, а не в рублях?
///   Чтобы удобно было расчитывать скидку в рублях
/// 2. Почему тип данных цены - [int], а не [double]?
///  Чтобы не было проблем с точностью
/// 3. Как можно было реализовать передачу цены иначе?
///  Через double, но тогда при расчете скидки могут быть проблемы с точностью

class ProductEntity {
  final String title;

  final int price;

  final Category category;

  final String imageUrl;

  final Amount amount;

  final double sale;

  ProductEntity({
    required this.title,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.amount,
    this.sale = 0,
  });
}

/// Класс, описывающий количество товара.
sealed class Amount {
  int get value;
}

/// Класс, описывающий количество товара в граммах.
class Grams implements Amount {
  @override
  final int value;
  Grams(this.value);
}

/// Класс, описывающий количество товара в штуках.
class Quantity implements Amount {
  @override
  final int value;
  Quantity(this.value);
}

/// Категория товара.
enum Category {
  food('Продукты питания'),
  care('Уход');

  final String name;

  const Category(this.name);
}
