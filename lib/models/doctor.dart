import 'package:healtypet/models/service.dart';

class Doctor {
  String name;
  String image;
  List<String> service;
  String distance;

  Doctor({
    required this.name,
    required this.image,
    required this.service,
    required this.distance,
  });
}

var doctors = [
  Doctor(name: "Dr. Stone", image: "doctor-1.jpg", service: [Service.vaccine, Service.surgery], distance: "10km"),
  Doctor(name: "Dr. Vanessa", image: "doctor-2.jpg", service: [Service.spaAndTreatment, Service.surgery], distance: "22km"),
];