import 'package:surf_flutter_courses_template/models/products_model.dart';

final dataForStudents = <ProductEntity>[
  ProductEntity(
    title: 'Виноград',
    price: 499,
    category: Category.food,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Table_grapes_on_white.jpg/1200px-Table_grapes_on_white.jpg',
    amount: Grams(1000),
    sale: 50,
  ),
  ProductEntity(
    title: 'Мыло',
    price: 150,
    category: Category.care,
    amount: Quantity(1),
    imageUrl:
        'https://img.freepik.com/free-photo/soap-bar-isolated-over-white-background-close-up_93675-134651.jpg',
  ),
  ProductEntity(
    title: 'Сыр',
    price: 199,
    category: Category.food,
    amount: Quantity(1),
    imageUrl:
        'https://opttorg-horeca.ru/assets/images/catalog/cheese/rossijskij.jpg',
  ),
  ProductEntity(
    title: 'Морковь',
    price: 39,
    category: Category.food,
    amount: Grams(1000),
    imageUrl:
        'https://cdn.food.ru/unsigned/fit/640/480/ce/0/czM6Ly9tZWRpYS9waWN0dXJlcy9wcm9kdWN0cy8yMTkvY292ZXJzLzNBQkdZcy5qcGc.jpg',
  ),
];
