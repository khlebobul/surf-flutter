import 'package:flutter/material.dart';

class PhotoDetail extends StatelessWidget {
  final String imageUrl;
  final int currentIndex;
  final int totalImages;

  const PhotoDetail({
    Key? key,
    required this.imageUrl,
    required this.currentIndex,
    required this.totalImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Hero(
                  tag: imageUrl,
                  child: Image.network(imageUrl, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 10,
            child: Text(
              '${currentIndex + 1}/$totalImages',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
