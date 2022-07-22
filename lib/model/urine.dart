import 'package:intl/intl.dart';

class Urine {
  String time;
  int id;
  String protein;
  String acetone;
  double volume;

  Urine(
      {required this.time,
      required this.id,
      required this.protein,
      required this.acetone,
      required this.volume});

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'time': DateFormat('y-M-d H:m:s').format(DateTime.parse(time)),
      'protein': protein,
      'acetone': acetone,
      'volume': volume
    };

    return map;
  }

  factory Urine.fromMap(Map<String, dynamic> data) {
    return Urine(
        time: data["time"],
        id: data["id"],
        protein: data["protein"],
        acetone: data["acetone"],
        volume: double.parse(data["volume"].toString()));
  }
}
