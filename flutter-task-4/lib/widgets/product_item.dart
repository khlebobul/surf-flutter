import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/models/products_model.dart';

class ItemProduct extends StatelessWidget {
  final ProductEntity item;
  final bool isFirstItemOfCategory;

  const ItemProduct({
    Key? key,
    required this.item,
    required this.isFirstItemOfCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Расчет отображаемого количества
    String displayAmount = '';
    if (item.amount is Quantity) {
      displayAmount = '${item.amount.value.toString()} шт';
    } else if (item.amount is Grams) {
      displayAmount = '${(item.amount.value / 1000).toString()} кг';
    }

    // Расчет отображаемой цены со скидкой
    double discountedPrice = (item.price * item.sale ~/ 100).toDouble();
    TextStyle? priceStyle = Theme.of(context).textTheme.bodySmall;
    if (item.sale != 0) {
      priceStyle = priceStyle!.copyWith(
        decoration: TextDecoration.lineThrough,
        color: Theme.of(context).colorScheme.tertiary,
      );
    }

    TextStyle? discountedPriceStyle = Theme.of(context).textTheme.bodySmall;
    if (item.sale != 0) {
      discountedPriceStyle = discountedPriceStyle!.copyWith(
        color: Theme.of(context).colorScheme.error,
      );
    }

    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isFirstItemOfCategory) ...[
            Text(' ${item.category.name}'),
            const SizedBox(
              height: 16,
            )
          ],
          Row(
            children: [
              SizedBox(
                height: 68,
                width: 68,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          displayAmount,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const Spacer(),
                        Text(
                          '${item.price.toString()} руб',
                          style: priceStyle,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        if (item.sale != 0)
                          Text(
                            '${discountedPrice.toString()} руб',
                            style: discountedPriceStyle,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
