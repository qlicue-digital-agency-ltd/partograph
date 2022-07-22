import 'dart:convert';

import 'package:partograph/model/dilatation.dart';
import 'package:partograph/service/base/api_base_helper.dart';

class DilationService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Dilatation>> fetchDilationList() async {
    final response = await _helper.getData("dilatations");
    return response;
  }

  Future<void> postDilation(
      {required Dilatation dilatation, required int partographId}) async {
    await _helper.postData(
        data: jsonEncode(dilatation.toMap()), url: "dilatation/$partographId");
  }
}

DilationService dilationService = DilationService();
