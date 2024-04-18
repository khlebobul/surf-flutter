import 'package:flutter/material.dart';

class PhotoGrid extends StatelessWidget {
  const PhotoGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: GridView.builder(
          itemCount: 21, // Общее количество элементов в сетке
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Количество элементов в ряду
            crossAxisSpacing:
                3.0, // Пространство между элементами по горизонтали
            mainAxisSpacing: 5.0, // Пространство между элементами по вертикали
          ),
          itemBuilder: (BuildContext context, int index) {
            return GridTile(
              child: Container(
                color: Colors.green, // Цвет фона элемента
                child: Center(
                  child: Text(
                    'Item $index', // Текст элемента
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
