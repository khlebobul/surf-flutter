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
    Key? key,
    required this.products,
    required this.initialSortType,
  }) : super(key: key);

  @override
  State<FilterListScreen> createState() => _FilterListScreenState();
}

class _FilterListScreenState extends State<FilterListScreen> {
  late SortType sortType;
  late ThemeData themeData;

  @override
  void initState() {
    super.initState();
    sortType = widget.initialSortType;
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context); // Выносим тему в переменную

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
                style: themeData.textTheme.labelLarge,
              ),
            ),
            RadioListTile(
              title: Text(
                'Без сортировки',
                style: themeData.textTheme.headlineMedium,
              ),
              value: SortType.withoutSort,
              groupValue: sortType,
              onChanged: _onSortTypeChanged,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'По имени',
                style: themeData.textTheme.displayMedium,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(),
            ),
            RadioListTile(
              title: Text(
                'По имени от А до Я',
                style: themeData.textTheme.headlineMedium,
              ),
              value: SortType.alphabetFromA,
              groupValue: sortType,
              onChanged: _onSortTypeChanged,
            ),
            RadioListTile(
              title: Text(
                'По имени от Я до А',
                style: themeData.textTheme.headlineMedium,
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
                style: themeData.textTheme.displayMedium,
              ),
            ),
            RadioListTile(
                title: Text(
                  'По возрастанию',
                  style: themeData.textTheme.headlineMedium,
                ),
                value: SortType.lowToHighPrice,
                groupValue: sortType,
                onChanged: _onSortTypeChanged),
            RadioListTile(
                title: Text(
                  'По убыванию',
                  style: themeData.textTheme.headlineMedium,
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
                style: themeData.textTheme.displayMedium,
              ),
            ),
            RadioListTile(
                title: Text(
                  'По типу  от А до Я',
                  style: themeData.textTheme.headlineMedium,
                ),
                value: SortType.typeFromA,
                groupValue: sortType,
                onChanged: _onSortTypeChanged),
            RadioListTile(
                title: Text(
                  'По типу  от Я до А',
                  style: themeData.textTheme.headlineMedium,
                ),
                value: SortType.typeToA,
                groupValue: sortType,
                onChanged: _onSortTypeChanged),
            const SizedBox(height: 40),
            const SizedBox(height: 25),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: SizedBox(
            width: 335,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  sortType,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: themeData.colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Готово',
                style: themeData.textTheme.bodyMedium!.copyWith(
                  color: themeData.colorScheme.secondaryContainer,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onSortTypeChanged(SortType? value) {
    setState(() {
      sortType = value!;
    });
  }
}
