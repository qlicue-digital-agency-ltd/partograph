import 'package:intl/intl.dart';

class Dilatation {
  String time;
  int id;
  int value;

  Dilatation({required this.time, required this.id, required this.value});

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'time': DateFormat('y-M-d H:m:s').format(DateTime.parse(time)),
      'value': value,
    };

    return map;
  }

  factory Dilatation.fromMap(Map<String, dynamic> data) {
    return Dilatation(
      time: data["time"],
      id: data["id"],
      value: data["value"],
    );
  }
}
