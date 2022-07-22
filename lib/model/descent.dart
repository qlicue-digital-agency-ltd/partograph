import 'package:intl/intl.dart';

class Descent {
  String time;
  int id;
  int value;

  Descent({required this.time, required this.id, required this.value});

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'time': DateFormat('y-M-d H:m:s').format(DateTime.parse(time)),
      'value': value,
    };

    return map;
  }

  factory Descent.fromMap(Map<String, dynamic> data) {
    return Descent(
      time: data["time"],
      id: data["id"],
      value: data["value"],
    );
  }
}
