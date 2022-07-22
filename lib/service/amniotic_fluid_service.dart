import 'dart:convert';

import 'package:partograph/model/amniotic_fluid.dart';
import 'package:partograph/service/base/api_base_helper.dart';

class AmnioticFluidService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<AmnioticFluid>> fetchAmnioticFluidList() async {
    final response = await _helper.getData("amnioticFluids");
    return response;
  }

  Future<void> postAmnioticFluid(
      {required AmnioticFluid amnioticFluid, required int partographId}) async {
    await _helper.postData(
        data: jsonEncode(amnioticFluid.toMap()),
        url: "amnioticFluid/$partographId");
  }
}

AmnioticFluidService amnioticFluidService = AmnioticFluidService();
