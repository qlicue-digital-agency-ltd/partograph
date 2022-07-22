import 'dart:convert';

import 'package:partograph/model/uterine_contractions.dart';
import 'package:partograph/service/base/api_base_helper.dart';

class UterineContractionService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<UterineContraction>> fetchUterineContractionList() async {
    final response = await _helper.getData("uterineContractions");
    return response;
  }

  Future<void> postUterineContraction(
      {required UterineContraction uterineContraction,
      required int partographId}) async {
    await _helper.postData(
        data: jsonEncode(uterineContraction.toMap()),
        url: "uterineContraction/$partographId");
  }
}

UterineContractionService uterineContractionService =
    UterineContractionService();
