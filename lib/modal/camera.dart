class Camera {
  Camera({
    required this.id,
    required this.name,
    required this.roverId,
    required this.fullName,
  });

  int id;
  String name;
  int roverId;
  String fullName;

  factory Camera.fromJson(Map<String, dynamic> json) => Camera(
        id: json["id"],
        name: json["name"],
        roverId: json["rover_id"],
        fullName: json["full_name"],
      );
}

enum FullName {
  FRONT_HAZARD_AVOIDANCE_CAMERA,
  REAR_HAZARD_AVOIDANCE_CAMERA,
  MAST_CAMERA,
  CHEMISTRY_AND_CAMERA_COMPLEX,
  MARS_DESCENT_IMAGER,
  NAVIGATION_CAMERA
}

enum CameraName { FHAZ, RHAZ, MAST, CHEMCAM, MARDI, NAVCAM }
