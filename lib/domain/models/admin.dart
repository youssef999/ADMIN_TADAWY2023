

class  Admin {

  String ?id;
  String? email;
  String ?password;




  Admin({

    this.id, this.email,
    this.password

  });

  factory Admin.fromJson(Map<String,dynamic>json)=>Admin(

    id:json['id'],
    //int.parse(json['id'].toString()),
    email: json['email'],
    password:json['password'],
  );

// Map<String, dynamic> toJson() => {
//   //'user_id': user_id,
//   'doctor_email': user_email,
//   'doctor_name': user_name,
//   'doctor_password': user_password,
//    'doctor_image':doctor_image
// };
}
