import 'dart:convert';

import 'package:partograph/model/moulding_fetal.dart';
import 'package:partograph/service/base/api_base_helper.dart';

class MouldingService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<MouldingFetal>> fetchMouldingList() async {
    final response = await _helper.getData("mouldingFetals");
    return response;
  }

  Future<void> postMoulding(
      {required MouldingFetal moulding, required int partographId}) async {
    await _helper.postData(
        data: jsonEncode(moulding.toMap()), url: "mouldingFetal/$partographId");
  }
}

MouldingService mouldingService = MouldingService();
