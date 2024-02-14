import 'package:flutter/material.dart';

import 'package:surf_flutter_courses_template/models/products_model.dart';

enum SortType {
  withoutSort,
  alphabetFromA,
  alphabetToA,
  highToLowPrice,
  lowToHighPrice,
  typeFromA,
  typeToA
}

class FilterListScreen extends StatefulWidget {
  final List<ProductEntity> products;

  final SortType initialSortType;

  const FilterListScreen({
    super.key,
    required this.products,
    required this.initialSortType,
  });

  @override
  State<FilterListScreen> createState() => _FilterListScreenState();
}

class _FilterListScreenState extends State<FilterListScreen> {
  late SortType sortType;

  @override
  void initState() {
    super.initState();
    sortType = widget.initialSortType;
  }

  void _onSortTypeChanged(SortType? value) {
    setState(() {
      sortType = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 24),
              child: Text(
                'Сортировка',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            RadioListTile(
              title: Text(
                'Без сортировки',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              value: SortType.withoutSort,
              groupValue: sortType,
              onChanged: _onSortTypeChanged,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'По имени',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(),
            ),
            RadioListTile(
              title: Text(
                'По имени от А до Я',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              value: SortType.alphabetFromA,
              groupValue: sortType,
              onChanged: _onSortTypeChanged,
            ),
            RadioListTile(
              title: Text(
                'По имени от Я до А',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              value: SortType.alphabetToA,
              groupValue: sortType,
              onChanged: _onSortTypeChanged,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'По цене',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            RadioListTile(
                title: Text(
                  'По возрастанию',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                value: SortType.lowToHighPrice,
                groupValue: sortType,
                onChanged: _onSortTypeChanged),
            RadioListTile(
                title: Text(
                  'По убыванию',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                value: SortType.highToLowPrice,
                groupValue: sortType,
                onChanged: _onSortTypeChanged),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'По типу',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            RadioListTile(
                title: Text(
                  'По типу  от А до Я',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                value: SortType.typeFromA,
                groupValue: sortType,
                onChanged: _onSortTypeChanged),
            RadioListTile(
                title: Text(
                  'По типу  от Я до А',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                value: SortType.typeToA,
                groupValue: sortType,
                onChanged: _onSortTypeChanged),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: SizedBox(
            width: 335,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  sortType,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Готово',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
