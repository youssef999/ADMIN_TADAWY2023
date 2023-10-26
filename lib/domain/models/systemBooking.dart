class  System {

  String ?id;
  String ? doctor_phone;
  String ?doctor_name;
  String ?price;
  String ?notes;

  System({
    this.id, this.doctor_name, this.doctor_phone,this.price,this.notes
  });

  factory System.fromJson(Map<String,dynamic>json)=>System(
      id:json['id'],
      doctor_phone:(json['doctor_phone']),
      doctor_name:(json['doctor_name']),
      //int.parse(json['coins'].toString()),
      price: json['price'],
      notes:json["notes"]
  );

// Map<String, dynamic> toJson() => {
//   //'user_id': user_id,
//   'doctor_email': user_email,
//   'doctor_name': user_name,
//   'doctor_password': user_password,
//    'doctor_image':doctor_image
// };
}