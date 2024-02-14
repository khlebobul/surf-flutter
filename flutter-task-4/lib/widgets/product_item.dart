import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/models/products_model.dart';

class ItemProduct extends StatelessWidget {
  final ProductEntity item;
  final bool isFirstItemOfCategory;

  const ItemProduct({
    super.key,
    required this.item,
    required this.isFirstItemOfCategory,
  });

  @override
  Widget build(BuildContext context) {
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
                        if (item.amount is Quantity)
                          Text(
                            '${item.amount.value.toString()} шт',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        if (item.amount is Grams)
                          Text(
                            '${(item.amount.value / 1000).toString()} кг',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        const Spacer(),
                        Text(
                          '${item.price.toString()} руб',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    decoration: item.sale != 0
                                        ? TextDecoration.lineThrough
                                        : null,
                                    color: item.sale != 0
                                        ? Theme.of(context).colorScheme.tertiary
                                        : null,
                                  ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        if (item.sale != 0)
                          Text(
                            '${(item.price * item.sale ~/ 100).toString()} руб',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.error,
                                ),
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
