import 'package:intl/intl.dart';

class DrugIvFluid {
  String time;
  int id;
  String value;

  DrugIvFluid({required this.time, required this.id, required this.value});

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'time': DateFormat('y-M-d H:m:s').format(DateTime.parse(time)),
      'value': value,
    };

    return map;
  }

  factory DrugIvFluid.fromMap(Map<String, dynamic> data) {
    return DrugIvFluid(
      time: data["time"],
      id: data["id"],
      value: data["value"],
    );
  }
}
