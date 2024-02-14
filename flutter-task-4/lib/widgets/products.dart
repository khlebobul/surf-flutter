import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/models/product_list.dart';
import 'package:surf_flutter_courses_template/models/products_model.dart';
import 'package:surf_flutter_courses_template/widgets/counter.dart';
import 'package:surf_flutter_courses_template/widgets/filter.dart'
    as filterList;
import 'package:surf_flutter_courses_template/widgets/filter.dart';
import 'package:surf_flutter_courses_template/widgets/sort.dart';
import 'package:surf_flutter_courses_template/widgets/product_item.dart';

class ListOfProductScreen extends StatefulWidget {
  const ListOfProductScreen({
    super.key,
  });

  @override
  State<ListOfProductScreen> createState() => _ListOfProductScreenState();
}

class _ListOfProductScreenState extends State<ListOfProductScreen> {
  SortType sortType = SortType.withoutSort;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'Чек № 73',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            Text('15.02.24 в 00:24',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    )),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Список покупок',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ),
              InkWell(
                onTap: () async {
                  final res = await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return filterList.FilterListScreen(
                          products: dataForStudents,
                          initialSortType: sortType,
                        );
                      });
                  if (res != null) {
                    setState(() {
                      sortType = res;
                    });
                  }
                },
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Center(
                        child: Icon(
                          Icons.sort,
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                      ),
                      if (sortType != SortType.withoutSort)
                        Container(
                          height: 8,
                          width: 8,
                          margin: const EdgeInsets.only(right: 5, bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          (dataForStudents.isEmpty == true)
              ? const Text('Здесь пока ничего нет')
              : Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      final item = getSortType(sortType)[index];
                      return Column(
                        children: [
                          ItemProduct(
                            item: item,
                            isFirstItemOfCategory: (index == 0 ||
                                    item.category !=
                                        getSortType(sortType)[index - 1]
                                            .category) &&
                                (sortType == SortType.typeToA ||
                                    sortType == SortType.typeFromA),
                          ),
                        ],
                      );
                    },
                    itemCount: dataForStudents.length,
                  ),
                ),
          const Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('В вашей покупке'),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${dataForStudents.length.toString()} товаров',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    '${countSale(dataForStudents: dataForStudents).total.toString()} руб',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Скидка ${countSale(dataForStudents: dataForStudents).totalSalePercent.toString()}%',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    '-${countSale(dataForStudents: dataForStudents).totalSaleRub.toString()} руб',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Итого',
                  ),
                  Text(
                    '${countSale(dataForStudents: dataForStudents).totalPriceWithSale.toString()} руб',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

List<ProductEntity> getSortType(SortType? value) {
  switch (value) {
    case SortType.highToLowPrice:
      return highToLowPrice(dataForStudents);
    case SortType.lowToHighPrice:
      return lowToHighPrice(dataForStudents);
    case SortType.alphabetFromA:
      return alphabetFromA(dataForStudents);
    case SortType.alphabetToA:
      return alphabetToA(dataForStudents);
    case SortType.typeFromA:
      return typeFromA(dataForStudents);
    case SortType.typeToA:
      return typeToA(dataForStudents);
    case SortType.withoutSort:
    default:
      return dataForStudents;
  }
}

class BottomBar extends StatelessWidget {
  final Color selectedItemColor;

  const BottomBar({
    super.key,
    required this.selectedItemColor,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 3,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: selectedItemColor,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: 'Каталог',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Поиск',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          label: 'Корзина',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Личное',
        ),
      ],
    );
  }
}
