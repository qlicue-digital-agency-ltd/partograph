import 'package:partograph/model/partograph.dart';

class AdmissionInformation {
  int id;
  String time;
  String? nameOfHealthFacility;
  String? hospitalRegNo;
  String dateOfAdmission;
  String admittingNurseDoctorName;
  String reasonForReferralOrManagementReceived;
  String dangerSignsAndRiskFactors;
  String adimittedFrom;
  Partograph? partograph;

  AdmissionInformation({
    required this.id,
    required this.time,
    this.nameOfHealthFacility,
    this.hospitalRegNo,
    required this.dateOfAdmission,
    required this.adimittedFrom,
    required this.admittingNurseDoctorName,
    required this.reasonForReferralOrManagementReceived,
    required this.dangerSignsAndRiskFactors,
    this.partograph,
  });

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'time': time,
      'name_of_health_facility': nameOfHealthFacility,
      'hospital_reg_no': hospitalRegNo,
      'date_of_admission': dateOfAdmission,
      'adimitted_from': adimittedFrom,
      'admitting_nurse_doctor_name': admittingNurseDoctorName,
      'reason_for_referral_or_management_received':
          reasonForReferralOrManagementReceived,
      'danger_signs_and_risk_factors': dangerSignsAndRiskFactors
    };

    return map;
  }

  factory AdmissionInformation.fromMap(Map<String, dynamic> data) {
    return AdmissionInformation(
      id: data["id"],
      time: data["time"],
      nameOfHealthFacility: data["name_of_health_facility"],
      hospitalRegNo: data["hospital_reg_no"].toString(),
      dateOfAdmission: data["date_of_admission"],
      adimittedFrom: data["adimitted_from"],
      admittingNurseDoctorName: data["admitting_nurse_doctor_name"],
      reasonForReferralOrManagementReceived:
          data["reason_for_referral_or_management_received"],
      dangerSignsAndRiskFactors: data["danger_signs_and_risk_factors"],
      partograph: data['partograph'] == null
          ? null
          : Partograph.fromMap(data['partograph']),
    );
  }
}
