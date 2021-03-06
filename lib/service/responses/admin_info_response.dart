import 'package:partograph/model/admission_informations.dart';

class AdminInfoResponse {
  AdmissionInformation? admissionInformation;

  AdminInfoResponse.fromJson(Map<String, dynamic> json) {
    if (json['admissionInformation'] != null) {
      admissionInformation = AdmissionInformation.fromMap(json['admissionInformation']);
    }
  }
}
