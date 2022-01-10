import 'package:rover/data/model/filter_camera_model.dart';
import 'package:rover/data/model/res_view_model.dart';

class ConstValues {
  static final List<CameraType> cameraTypes = [
    CameraType(
        abbreviation: "FHAZ",
        camera: "Front Hazard Avoidance Camera",
        curiosity: true,
        opportunity: true,
        spirit: true),
    CameraType(
        abbreviation: "RHAZ",
        camera: "Rear Hazard Avoidance Camera",
        curiosity: true,
        opportunity: true,
        spirit: true),
    CameraType(
        abbreviation: "MAST",
        camera: "Mast Camera",
        curiosity: true,
        opportunity: false,
        spirit: false),
    CameraType(
        abbreviation: "CHEMCAM",
        camera: "Chemistry and Camera Complex",
        curiosity: true,
        opportunity: false,
        spirit: false),
    CameraType(
        abbreviation: "MAHLI",
        camera: "Mars Hand Lens Imager",
        curiosity: true,
        opportunity: false,
        spirit: false),
    CameraType(
        abbreviation: "MARDI",
        camera: "Mars Descent Imager",
        curiosity: true,
        opportunity: false,
        spirit: false),
    CameraType(
        abbreviation: "NAVCAM",
        camera: "Navigation Camera",
        curiosity: true,
        opportunity: true,
        spirit: true),
    CameraType(
        abbreviation: "PANCAM",
        camera: "Panoramic Camera",
        curiosity: false,
        opportunity: true,
        spirit: true),
    CameraType(
        abbreviation: "MINITES",
        camera: "Miniature Thermal Emission",
        curiosity: false,
        opportunity: true,
        spirit: true)
  ];
}
