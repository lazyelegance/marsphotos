import 'package:marsphotos/modal/camera.dart';
import 'package:marsphotos/modal/rover.dart';

class MarsPhotos {
  MarsPhotos({
    required this.photos,
  });

  List<Photo> photos;

  factory MarsPhotos.fromJson(Map<String, dynamic> json) => MarsPhotos(
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
      );
}

class Photo {
  Photo({
    required this.id,
    required this.sol,
    required this.camera,
    required this.imgSrc,
    required this.earthDate,
    required this.rover,
  });

  int id;
  int sol;
  Camera camera;
  String imgSrc;
  DateTime earthDate;
  Rover rover;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        sol: json["sol"],
        camera: Camera.fromJson(json["camera"]),
        imgSrc: json["img_src"],
        earthDate: DateTime.parse(json["earth_date"]),
        rover: Rover.fromJson(json["rover"]),
      );
}
