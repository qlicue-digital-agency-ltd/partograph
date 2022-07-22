import 'package:intl/intl.dart';

class UterineContraction {
  String time;
  int id;
  int value;

  UterineContraction(
      {required this.time, required this.id, required this.value});

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'time': DateFormat('y-M-d H:m:s').format(DateTime.parse(time)),
      'value': value,
    };

    return map;
  }

  factory UterineContraction.fromMap(Map<String, dynamic> data) {
    return UterineContraction(
      time: data["time"],
      id: data["id"],
      value: data["value"],
    );
  }
}
