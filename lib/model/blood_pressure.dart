import 'package:intl/intl.dart';

class BloodPressure {
  String time;
  int id;
  int systolic;
  int diastolic;

  BloodPressure(
      {required this.time,
      required this.id,
      required this.systolic,
      required this.diastolic});

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'time': DateFormat('y-M-d H:m:s').format(DateTime.parse(time)),
      'systolic': systolic,
      'diastolic': diastolic
    };

    return map;
  }

  factory BloodPressure.fromMap(Map<String, dynamic> data) {
    return BloodPressure(
      time: data["time"],
      id: data["id"],
      systolic: data["systolic"],
      diastolic: data["diastolic"],
    );
  }
}
