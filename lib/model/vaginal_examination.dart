class VaginalExamination {
  final String date;
  final String time;
  final String cervixState;
  final String cervixDilation;
  final String presentingPart;
  final String positionOfOcciput;
  final String moulding;
  final String caput;
  final String station;
  final String liquor;

  VaginalExamination({
    required this.date,
    required this.time,
    required this.cervixState,
    required this.cervixDilation,
    required this.presentingPart,
    required this.positionOfOcciput,
    required this.moulding,
    required this.caput,
    required this.station,
    required this.liquor,
  });

  factory VaginalExamination.fromMap(Map<String, dynamic> json) {
    return VaginalExamination(
      date: json['date'],
      time: json['time'],
      cervixState: json['cervix_sate'],
      cervixDilation: json['cervix_dilation'],
      presentingPart: json['presenting_part'],
      positionOfOcciput: json['position_of_occiput'],
      moulding: json['moudling'],
      caput: json['caput'],
      station: json['station'],
      liquor: json['liquor'],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> json = {
      'date': date,
      'time': time,
      'cervix_sate': cervixState,
      'cervix_dilation': cervixDilation,
      'presenting_part': presentingPart,
      'position_of_occiput': positionOfOcciput,
      'moudling': moulding,
      'caput': caput,
      'station': station,
      'liquor': liquor,
    };

    return json;
  }
}
