import 'dart:convert';

import 'package:partograph/model/drug_iv_fluids.dart';
import 'package:partograph/model/oxytocin.dart';
import 'package:partograph/service/base/api_base_helper.dart';

class DrugIvFluidService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Oxytocin>> fetchOxytocinList() async {
    final response = await _helper.getData("drugIvFluids");
    return response;
  }

  Future<void> postDrugIvFluid(
      {required DrugIvFluid drugIvFluid, required int partographId}) async {
    await _helper.postData(
      data: jsonEncode(drugIvFluid.toMap()),
      url: "drugIvFluid/$partographId",
    );
  }
}

DrugIvFluidService drugIvFluidService = DrugIvFluidService();
