import 'dart:convert';

import 'package:partograph/model/urine.dart';
import 'package:partograph/service/base/api_base_helper.dart';

class UrineService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Urine>> fetchUrines() async {
    final response = await _helper.getData("urines");
    return response;
  }

  Future<void> postUrine(
      {required Urine urine, required int partographId}) async {
    await _helper.postData(
      data: jsonEncode(urine.toMap()),
      url: "temperature/$partographId",
    );
  }
}

UrineService urineService = UrineService();
