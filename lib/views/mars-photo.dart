import 'package:flutter/material.dart';
import 'package:marsphotos/modal/photos.dart';

class MarsPhoto extends StatelessWidget {
  final Photo photo;

  const MarsPhoto({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  PhotoDetail(title: "Camera", value: photo.camera.fullName),
                  const Spacer(),
                  PhotoDetail(
                      title: "Earth Date",
                      value: photo.earthDate.toIso8601String()),
                  const Spacer(),
                  PhotoDetail(
                      title: "Rover",
                      value: "${photo.rover.name}(${photo.rover.status})")
                ],
              ),
              SizedBox(
                child: Center(child: Image.network(photo.imgSrc)),
                height: 500,
              )
            ],
          )),
    );
  }
}

class PhotoDetail extends StatelessWidget {
  const PhotoDetail({Key? key, required this.title, required this.value})
      : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$title: "),
        Text(value),
      ],
    );
  }
}
