import 'package:partograph/constants/enum.dart';
import 'package:partograph/model/admission_informations.dart';

class Mother {
  int id;
  String surname;
  String otherNames;
  String dateOfBirth;
  String husbandPartnerName;
  String residence;
  String permanentAddress;
  String? nextOfKin;
  String? cellPhone;
  CaseCategory caseCategory;

  List<AdmissionInformation> admissionInformations;

  Mother({
    required this.id,
    required this.surname,
    required this.otherNames,
    required this.dateOfBirth,
    required this.husbandPartnerName,
    required this.residence,
    required this.permanentAddress,
    required this.nextOfKin,
    required this.cellPhone,
    required this.admissionInformations,
    required this.caseCategory,
  });

  Map<dynamic, dynamic> toMap() {
    var map = <dynamic, dynamic>{
      'id': id,
      'surname': surname,
      'other_names': otherNames,
      'date_of_birth': dateOfBirth,
      'husband_partner_name': husbandPartnerName,
      'residence': residence,
      'permanent_address': permanentAddress,
      'next_of_kin': nextOfKin,
      'cell_phone': cellPhone,
      'case_category': caseCategory.toString().replaceAll("CaseCategory.", ""),
      // 'admission_informations': admissionInformations.map((e) => e.toMap()
      // )
    };

    return map;
  }

  factory Mother.fromMap(Map<String, dynamic> data) {
    return Mother(
        id: data["id"],
        surname: data["surname"],
        otherNames: data["other_names"],
        dateOfBirth: data["date_of_birth"],
        husbandPartnerName: data["husband_partner_name"] ?? '',
        residence: data["residence"],
        permanentAddress: data["permanent_address"],
        nextOfKin: data["next_of_kin"],
        cellPhone: data["cell_phone"],
        caseCategory: data["case_category"] == "critical"
            ? CaseCategory.critical
            : (data["case_category"] == "active"
                ? CaseCategory.active
                : (data["case_category"] == "latent"
                    ? CaseCategory.latent
                    : (data["case_category"] == "incoming"
                        ? CaseCategory.incoming
                        : CaseCategory.done))),
        admissionInformations: (data['admission_informations']
            .map<AdmissionInformation>((i) => AdmissionInformation.fromMap(i))
            .toList()));
  }

  Mother copyInstance() {
    return Mother(
        id: id,
        surname: surname,
        otherNames: otherNames,
        dateOfBirth: dateOfBirth,
        husbandPartnerName: husbandPartnerName,
        residence: residence,
        permanentAddress: permanentAddress,
        nextOfKin: nextOfKin,
        cellPhone: cellPhone,
        caseCategory: caseCategory,
        admissionInformations: admissionInformations);
  }
}
