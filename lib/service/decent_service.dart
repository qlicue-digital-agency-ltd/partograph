import 'dart:convert';

import 'package:partograph/model/descent.dart';
import 'package:partograph/service/base/api_base_helper.dart';

class DescentService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Descent>> fetchDescentList() async {
    final response = await _helper.getData("descents");
    return response;
  }

  Future<void> postDescent(
      {required Descent descent, required int partographId}) async {
    await _helper.postData(
        data: jsonEncode(descent.toMap()), url: "descent/$partographId");
  }
}

DescentService descentService = DescentService();
