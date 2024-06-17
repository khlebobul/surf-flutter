import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:surf_flutter_courses_template/data/photo_service.dart';
import 'package:surf_flutter_courses_template/screens/photo_details.dart';

class PhotoGrid extends StatelessWidget {
  final List<Uint8List> localImages;

  const PhotoGrid({Key? key, required this.localImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: FutureBuilder(
          future: PhotoService().fetchPhotos(),
          builder:
              (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final List<String> remoteImages = snapshot.data!;
              final List<Widget> imageWidgets = [];

              for (int i = 0; i < localImages.length; i++) {
                imageWidgets.add(GridTile(
                  child: GestureDetector(
                    onTap: () {
                      // Локальное изображение не имеет URL, используем Uint8List напрямую
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ImageDetailPage(
                            imageBytes: localImages[i],
                          ),
                        ),
                      );
                    },
                    child: Image.memory(
                      localImages[i],
                      fit: BoxFit.cover,
                    ),
                  ),
                ));
              }

              for (int i = 0; i < remoteImages.length; i++) {
                imageWidgets.add(GridTile(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PhotoPageView(
                            imageUrls: remoteImages,
                            initialIndex: i,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: 'photo$i',
                      child: Image.network(
                        remoteImages[i],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ));
              }

              return GridView.builder(
                itemCount: imageWidgets.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 3.0,
                  mainAxisSpacing: 5.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return imageWidgets[index];
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class ImageDetailPage extends StatelessWidget {
  final Uint8List imageBytes;

  const ImageDetailPage({Key? key, required this.imageBytes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.memory(imageBytes),
      ),
    );
  }
}
