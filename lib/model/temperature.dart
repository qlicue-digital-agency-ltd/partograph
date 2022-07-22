import 'package:intl/intl.dart';

class Temperature {
  String time;
  int id;
  double value;

  Temperature({required this.time, required this.id, required this.value});

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'time': DateFormat('y-M-d H:m:s').format(DateTime.parse(time)),
      'value': value,
    };

    return map;
  }

  factory Temperature.fromMap(Map<String, dynamic> data) {
    return Temperature(
      time: data["time"],
      id: data["id"],
      value: data["value"],
    );
  }
}
