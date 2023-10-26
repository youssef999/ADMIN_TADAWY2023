// To parse this JSON data, do
//
//     final appointment = appointmentFromJson(jsonString);

import 'dart:convert';

List<Country> catFromJson(String str) => List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

//String AdsToJson(List<Ads> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Country {
  Country({
    required this.id,
    required this.name,
    required this.code,required this.price
  });

  int id;
  String name;
  String code;
  String price;


  factory Country.fromJson(Map<String, dynamic> json) => Country (
    id: int.parse(json["id"]),
    name: json["name"]??"",
    code: json["countryCode"]??"",
    price:json['price']??""
  );

// Map<String, dynamic> toJson() => {
//   "id": id,
//   "doctor_name": doctorName,
//   "user_name": userName,
//   "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
//   "time": time,
// };
}
