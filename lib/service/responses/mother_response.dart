import 'package:partograph/model/mother.dart';

class MotherResponse {
  List<Mother> mothers = [];

  MotherResponse.fromJson(Map<String, dynamic> json) {
    if (json['mothers'] != null) {
      mothers = <Mother>[];
      json['mothers'].forEach((v) {
        mothers.add(Mother.fromMap(v));
      });
    }
  }
}
