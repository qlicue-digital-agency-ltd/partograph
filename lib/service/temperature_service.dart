import 'dart:convert';

import 'package:partograph/model/temperature.dart';
import 'package:partograph/service/base/api_base_helper.dart';

class TemperatureService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Temperature>> fetchTemperatures() async {
    final response = await _helper.getData("temperatures");
    return response;
  }

  Future<void> postTemperature(
      {required Temperature temperature, required int partographId}) async {
    await _helper.postData(
      data: jsonEncode(temperature.toMap()),
      url: "temperature/$partographId",
    );
  }
}

TemperatureService temperatureService = TemperatureService();
