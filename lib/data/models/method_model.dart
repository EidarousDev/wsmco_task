class MethodModel {
  final int sn;
  final String transportation;
  final String type;
  final String nationality;
  final String status;
  final String reviewer;
  final int isSuspect;

  MethodModel(
      {required this.sn,
      required this.transportation,
      required this.type,
      required this.nationality,
      required this.status,
      required this.reviewer,
      required this.isSuspect});

  factory MethodModel.fromJson(Map<String, dynamic> json) => MethodModel(
      sn: json['sn'],
      transportation: json['transportation'],
      type: json['type'],
      nationality: json['nationality'],
      status: json['status'],
      reviewer: json['reviewer'],
      isSuspect: json['is_suspect']);
}
