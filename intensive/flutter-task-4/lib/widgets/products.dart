import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_flutter_courses_template/models/product_list.dart';
import 'package:surf_flutter_courses_template/models/products_model.dart';
import 'package:surf_flutter_courses_template/widgets/filter.dart'
    as filterList;
import 'package:surf_flutter_courses_template/widgets/filter.dart';
import 'package:surf_flutter_courses_template/widgets/sort.dart';
import 'package:surf_flutter_courses_template/widgets/product_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Строковые константы приложения
class AppStrings {
  static const appTitle = 'Это тайтл';
  static const checkNumber = 'Чек № 73';
  static const checkDate = '15.02.24 в 00:24';
  static const productListTitle = 'Список покупок';
  static const nothingHereYet = 'Здесь пока ничего нет';
  static const inYourPurchase = 'В вашей покупке';
  static const totalItems = 'товаров';
  static const discount = 'Скидка';
  static const total = 'Итого';
  static const catalog = 'Каталог';
  static const search = 'Поиск';
  static const basket = 'Корзина';
  static const personal = 'Личное';
}

class SaleInfo {
  final int total;
  final int totalSalePercent;
  final int totalSaleRub;
  final int totalPriceWithSale;

  SaleInfo({
    required this.total,
    required this.totalSalePercent,
    required this.totalSaleRub,
    required this.totalPriceWithSale,
  });
}

SaleInfo countSale({required List<ProductEntity> dataForStudents}) {
  // Реализация логики расчета скидок
  return SaleInfo(
    total: 100, // Пример
    totalSalePercent: 10, // Пример
    totalSaleRub: 50, // Пример
    totalPriceWithSale: 900, // Пример
  );
}

class ListOfProductScreen extends StatefulWidget {
  const ListOfProductScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ListOfProductScreen> createState() => _ListOfProductScreenState();
}

class _ListOfProductScreenState extends State<ListOfProductScreen> {
  SortType sortType = SortType.withoutSort;
  late List<ProductEntity> sortedProducts;
  late SaleInfo saleInfo;

  @override
  void initState() {
    super.initState();
    sortedProducts = getSortType(sortType);
    saleInfo = countSale(dataForStudents: sortedProducts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Center(
              child: Text(
                AppStrings.checkNumber,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ),
            Center(
              child: Text(AppStrings.checkDate,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Theme.of(context).colorScheme.primaryContainer,
                      )),
            ),
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
                  AppStrings.productListTitle,
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
                      sortedProducts = getSortType(sortType);
                      saleInfo = countSale(dataForStudents: sortedProducts);
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
                          child: SvgPicture.asset(
                        'assets/list.svg',
                      )),
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
          (sortedProducts.isEmpty == true)
              ? const Text(AppStrings.nothingHereYet)
              : Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      final item = sortedProducts[index];
                      return Column(
                        children: [
                          ItemProduct(
                            item: item,
                            isFirstItemOfCategory: (index == 0 ||
                                    item.category !=
                                        sortedProducts[index - 1].category) &&
                                (sortType == SortType.typeToA ||
                                    sortType == SortType.typeFromA),
                          ),
                        ],
                      );
                    },
                    itemCount: sortedProducts.length,
                  ),
                ),
          const Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(AppStrings.inYourPurchase),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${sortedProducts.length.toString()} ${AppStrings.totalItems}',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    '${saleInfo.total.toString()} руб',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${AppStrings.discount} ${saleInfo.totalSalePercent.toString()}%',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    '-${saleInfo.totalSaleRub.toString()} руб',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    AppStrings.total,
                  ),
                  Text(
                    '${saleInfo.totalPriceWithSale.toString()} руб',
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
    Key? key,
    required this.selectedItemColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 3,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: selectedItemColor,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/article.svg'),
          label: AppStrings.catalog,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/search.svg'),
          label: AppStrings.search,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/local_mall.svg'),
          label: AppStrings.basket,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/person_outline.svg'),
          label: AppStrings.personal,
        ),
      ],
    );
  }
}
