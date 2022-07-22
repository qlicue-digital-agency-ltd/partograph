import 'dart:convert';

import 'package:partograph/model/pulse.dart';
import 'package:partograph/service/base/api_base_helper.dart';

class PulseService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Pulse>> fetchPulses() async {
    final response = await _helper.getData("pulses");
    return response;
  }

  Future<void> postPulse(
      {required Pulse pulse, required int partographId}) async {
    await _helper.postData(
      data: jsonEncode(pulse.toMap()),
      url: "pulse/$partographId",
    );
  }
}

PulseService pulseService = PulseService();
