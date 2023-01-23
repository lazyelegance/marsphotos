import 'package:flutter/material.dart';
import 'package:marsphotos/modal/photos.dart';
import 'package:marsphotos/views/mars-photo.dart';

class MarPhotosBuilder extends StatelessWidget {
  const MarPhotosBuilder({
    Key? key,
    required this.marsPhotos,
  }) : super(key: key);

  final Future<MarsPhotos> marsPhotos;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MarsPhotos>(
      future: marsPhotos,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: snapshot.data!.photos.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                key: key,
                child: MarsPhoto(
                  photo: snapshot.data!.photos[index],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
