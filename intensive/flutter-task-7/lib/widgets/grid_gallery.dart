import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/data/photo_service.dart';
import 'package:surf_flutter_courses_template/screens/photo_details.dart';
import 'package:supabase/supabase.dart';

class PhotoGrid extends StatelessWidget {
  final SupabaseClient supabaseClient;

  const PhotoGrid({Key? key, required this.supabaseClient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: FutureBuilder(
          future: PhotoService(supabaseClient).fetchPhotos(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Uint8List>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 3.0,
                  mainAxisSpacing: 5.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GridTile(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PhotoPageView(
                              imageBlobs: snapshot.data!,
                              initialIndex: index, imageUrls: const [],
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'photo$index',
                        child: Image.memory(
                          snapshot.data![index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
