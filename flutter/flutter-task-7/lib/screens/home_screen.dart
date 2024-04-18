import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/widgets/grid_gallery.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Center(
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: Image(
                        image: AssetImage('assets/logo.png'),
                        width: 140.66,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // TODO: implement uploading
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.add_a_photo_outlined),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: const PhotoGrid(),
    );
  }
}