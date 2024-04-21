import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/data/constants.dart';

class PhotoDetail extends StatefulWidget {
  final List<String> imageUrls;
  final int initialIndex;

  const PhotoDetail({
    Key? key,
    required this.imageUrls,
    required this.initialIndex,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PhotoDetailState createState() => _PhotoDetailState();
}

class _PhotoDetailState extends State<PhotoDetail> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController =
        PageController(initialPage: _currentIndex, viewportFraction: 0.85);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: primaryColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Row(
              children: [
                Text(
                  '${_currentIndex + 1}',
                  style: PhotoCurrentIndexStyles.appBarTextStyle,
                ),
                const Text(
                  '/',
                  style: PhotoDetailStyles.appBarTextStyle,
                ),
                Text(
                  '${widget.imageUrls.length}',
                  style: PhotoDetailStyles.appBarTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.imageUrls.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: Image.network(
                        widget.imageUrls[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
