import 'package:surf_flutter_courses_template/models/products_model.dart';

CountSale countSale({
  required List<ProductEntity> dataForStudents,
}) {
  int total = 0;
  int totalSalePercent = 0;
  int totalSaleRub = 0;
  int totalPriceWithSale = 0;

  for (final product in dataForStudents) {
    total += product.price;
    totalSalePercent += product.sale.toInt();
    if (product.sale != 0) {
      totalSaleRub = (product.price * product.sale ~/ 100);
    }
    totalPriceWithSale = total - totalSaleRub;
  }
  return CountSale(
    total: total,
    totalSalePercent: totalSalePercent,
    totalSaleRub: totalSaleRub,
    totalPriceWithSale: totalPriceWithSale,
  );
}

class CountSale {
  final int totalSalePercent;
  final int totalSaleRub;
  final int totalPriceWithSale;
  final int total;

  CountSale({
    required this.totalSalePercent,
    required this.totalSaleRub,
    required this.totalPriceWithSale,
    required this.total,
  });
}
