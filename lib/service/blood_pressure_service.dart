import 'dart:convert';

import 'package:partograph/model/blood_pressure.dart';
import 'package:partograph/model/oxytocin.dart';
import 'package:partograph/service/base/api_base_helper.dart';

class BloodPressureService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Oxytocin>> fetchBloodPressure() async {
    final response = await _helper.getData("bloodPressures");
    return response;
  }

  Future<void> postBloodPressure(
      {required BloodPressure bloodPressure, required int partographId}) async {
    await _helper.postData(
      data: jsonEncode(bloodPressure.toMap()),
      url: "bloodPressure/$partographId",
    );
  }
}

BloodPressureService bloodPressureService = BloodPressureService();
