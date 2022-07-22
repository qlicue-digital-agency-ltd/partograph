import 'dart:convert';

import 'package:partograph/model/oxytocin.dart';
import 'package:partograph/service/base/api_base_helper.dart';

class OxytocinService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Oxytocin>> fetchOxytocinList() async {
    final response = await _helper.getData("oxytocins");
    return response;
  }

  Future<void> postOxytocin(
      {required Oxytocin oxytocin, required int partographId}) async {
    await _helper.postData(
        data: jsonEncode(oxytocin.toMap()), url: "oxytocin/$partographId");
  }
}

OxytocinService oxytocinService = OxytocinService();
