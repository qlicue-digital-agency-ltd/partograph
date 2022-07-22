import 'package:intl/intl.dart';

class Oxytocin {
  String time;
  int id;
  int drops;
  double amount;

  Oxytocin(
      {required this.time,
      required this.id,
      required this.drops,
      required this.amount});

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'time': DateFormat('y-M-d H:m:s').format(DateTime.parse(time)),
      'drops': drops,
      'amount': amount
    };

    return map;
  }

  factory Oxytocin.fromMap(Map<String, dynamic> data) {
    return Oxytocin(
        time: data["time"],
        id: data["id"],
        drops: data["drops"],
        amount: data["amount"]);
  }
}
