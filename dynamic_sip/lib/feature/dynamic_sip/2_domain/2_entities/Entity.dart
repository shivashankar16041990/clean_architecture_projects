

class Dsip {
  Dsip({
    required this.date,
    required  this.equity,
    required  this.point,
    required  this.sensex,
  });

  String date;
  String equity;
  String point;
  String sensex;

  factory Dsip.fromJson(Map<String, dynamic> json) => Dsip(
    date: json["date"],
    equity: json["equity"],
    point: json["point"],
    sensex: json["sensex"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "equity": equity,
    "point": point,
    "sensex": sensex,
  };
}
