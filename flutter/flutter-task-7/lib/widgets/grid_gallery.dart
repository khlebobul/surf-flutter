import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/screens/photo_details.dart';

class PhotoGrid extends StatelessWidget {
  const PhotoGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: GridView.builder(
          itemCount: 3, // Общее количество элементов в сетке
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Количество элементов в ряду
            crossAxisSpacing:
                3.0, // Пространство между элементами по горизонтали
            mainAxisSpacing: 5.0, // Пространство между элементами по вертикали
          ),
          itemBuilder: (BuildContext context, int index) {
            return GridTile(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PhotoDetail(
                        imageUrls: const [
                          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                        ],
                        initialIndex: index,
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: 'photo$index',
                  child: Image.network(
                    'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                    fit: BoxFit.cover,
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
