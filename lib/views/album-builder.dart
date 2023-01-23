import 'package:flutter/material.dart';
import 'package:marsphotos/main.dart';

class AlbumBuilder extends StatelessWidget {
  const AlbumBuilder({
    Key? key,
    required this.futureAlbum,
  }) : super(key: key);

  final Future<Album> futureAlbum;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Album>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
