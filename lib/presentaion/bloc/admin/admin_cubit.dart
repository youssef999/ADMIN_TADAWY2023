
import 'dart:convert';
import 'package:doctors_app/domain/models/coins.dart';
import 'package:doctors_app/domain/models/country.dart';
import 'package:doctors_app/domain/models/systemBooking.dart';
import 'package:doctors_app/domain/models/user.dart';
import 'package:doctors_app/presentaion/const/app_message.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:doctors_app/Data/api_connection/api_connection.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import '../../../domain/models/admin.dart';
import '../../../domain/models/ads.dart';
import '../../../domain/models/booking.dart';
import '../../../domain/models/bouquet.dart';
import '../../../domain/models/cat.dart';
import '../../../domain/models/sales.dart';
import '../../views/admin/admin_view.dart';
import 'admin_state.dart';

 class AdminCubit extends Cubit<AdminStates> {

  AdminCubit() :super(AppIntialState());
  // objects mn nfsy
  static AdminCubit get(context) => BlocProvider.of(context);

  List<DoctorModel> doctorList = [];
  List<Sales> salesList = [];
  List<Baka> bakaList = [];
  List<Baka> bakaList2 = [];
  List<Ads> adsList = [];
  List<Ads> adsList2 = [];
  List<Booking> bookingList=[];
  List<System> systemList=[];
  List<Cat> catList = [];
  List<Admin> adminList = [];
  var imageLink = '';
  Coins  coins= Coins();
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController coinsController = TextEditingController();
  TextEditingController codeIdController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController freeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController  numController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController adv = TextEditingController();
  TextEditingController days = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController catController = TextEditingController();
  final ImagePicker _picker=ImagePicker();
  XFile? pickedImageXFile;
  List<Country>countryList=[];

 //  Map<String, String> myheaders = {
 // "lang": 'ar',
 // // "Content-Type": "application/json",
 //    'authorization':'Basic ' +
 //        base64Encode(utf8.encode(
 //            'user_test:123456'))
 //  };

  Future <List<Country>> getAllCountries()async {


    emit(GetCountryLoadingState());
    try{
      var res = await http.get(Uri.parse(API.Country),);

      if (res.statusCode == 200) {

        print("API222");
        print("res======${res.body}");
        var responseBody = jsonDecode(res.body);
        if (responseBody["success"] == true) {
          (responseBody['Data'] as List).forEach((eachRecord) {

            countryList.add(Country.fromJson(eachRecord));


          });
        }
        emit(GetCountrySuccessState());
      }
      else {
        print("eeee");
        emit(GetCountryErrorState('error'));
      }

    }
    catch(e){
      print("eeee");
      emit(GetCountryErrorState('error'));

    }
    return countryList;
  }





  void addNewAds (String date,String best) async{

    print("c"+countryController.text);
    print(best);
    print(date);
    try{
      emit(AddNewAdsLoadingState());
      var res =await http.post(Uri.parse(API.AddNewAdd,),

        body: {
          'doctor_id':idController.text,
          'details':detailsController.text,
          'image':imageLink,
          'name':nameController.text,
          'date_end':date,
          'country':countryController.text,
          'best':best
        },
      );

      if(res.statusCode==200){

        var responseBody =jsonDecode(res.body);

        if(responseBody["success"]==true) {
          emit(AddNewAdsSuccessState());
        }


      }
      else{
        print(res.statusCode);
        emit(AddNewAdsErrorState(error: 'error'));

      }
    }
    catch(e){
      print(e.toString());
      emit(AddNewAdsErrorState(error: '$e'));
    }





  }













  void addToBestAds (String id) async{

      try{
        emit(AddBestLoadingState());
        var res =await http.post(Uri.parse(API.AddBestAdd,),

          body: {
          'id':id,
        },
        );

        if(res.statusCode==200){

          var responseBody =jsonDecode(res.body);

          if(responseBody["success"]==true) {
            emit(AddCatSuccessState());
          }


        }
        else{
          print(res.statusCode);
          emit(AddBestErrorState(error: 'error'));

        }
      }
      catch(e){
        print(e.toString());
        emit(AddBestErrorState(error: '$e'));
      }





  }


  updateAdsCoins(var coins) async {
    try {

      emit(UpdateAdsCoinsLoadingState());
      var res = await http.post(Uri.parse(API.UpdateAdsCoins),

          body:
          {
            'ads':coins.toString(),
            'id':'1'
            //nameController.text,
          }
      );
      if (res.statusCode == 200) {
        var resOfSignUp = jsonDecode(res.body);
        print(resOfSignUp);
        if (resOfSignUp['success'] == true) {
          print("SUCCESS");
          emit(UpdateAdsCoinsSuccessState());
        } else {
          print(res.body);
          print("error${res.statusCode}");
          emit(UpdateAdsCoinsErrorState(error: 'not 200'));

        }
      }
    } catch (e) {
      print("ERROR==$e");
      emit(UpdateAdsCoinsErrorState(error: '$e'));
    }
  }


  updateLoginCoins(var coins) async {
    try {

      emit(UpdateAdsCoinsLoadingState());
      var res = await http.post(Uri.parse(API.UpdateLoginCoins),

          body:
          {
            'login':coins.toString(),
            'id':'1'
            //nameController.text,
          }
      );
      if (res.statusCode == 200) {
        var resOfSignUp = jsonDecode(res.body);
        print(resOfSignUp);
        if (resOfSignUp['success'] == true) {
          print("SUCCESS");
          emit(UpdateAdsCoinsSuccessState());
        } else {
          print(res.body);
          print("error${res.statusCode}");
          emit(UpdateAdsCoinsErrorState(error: 'not 200'));

        }
      }
    } catch (e) {
      print("ERROR==$e");
      emit(UpdateAdsCoinsErrorState(error: '$e'));
    }
  }


  updateSystemCoins(var coins) async {
    try {

      emit(UpdateAdsCoinsLoadingState());
      var res = await http.post(Uri.parse(API.UpdateSystemCoins),

          body:
          {
            'system':coins.toString(),
            'id':'1'
            //nameController.text,
          }
      );
      if (res.statusCode == 200) {
        var resOfSignUp = jsonDecode(res.body);
        print(resOfSignUp);
        if (resOfSignUp['success'] == true) {
          print("SUCCESS");
          emit(UpdateAdsCoinsSuccessState());
        } else {
          print(res.body);
          print("error${res.statusCode}");
          emit(UpdateAdsCoinsErrorState(error: 'not 200'));

        }
      }
    } catch (e) {
      print("ERROR==$e");
      emit(UpdateAdsCoinsErrorState(error: '$e'));
    }
  }

  addNewBaka() async {
    try {

      emit(AddBakaLoadingState());
      var res = await http.post(Uri.parse(API.AddBaka),

          body:
      {
        'details':detailsController.text,
        'description':desController.text,
        'name':nameController.text,
        'price':price.text,
        'advantages':adv.text,
        'days':days.text,
         'free_ads':freeController.text
      }
      );

      if (res.statusCode == 200) {
        var resOfSignUp = jsonDecode(res.body);
        print(resOfSignUp);
        if (resOfSignUp['success'] == true) {
          print("SUCCESS");
          emit(AddBakaSuccessState());
        } else {
          print(res.body);
          print("error${res.statusCode}");
          emit(AddBakaErrorState(error: 'not 200'));

        }
      }
    } catch (e) {
      print("ERROR==$e");
      emit(AddBakaErrorState(error: '$e'));

    }
  }

  addNewBaka2() async {
    try {

      emit(AddBakaLoadingState());
      var res = await http.post(Uri.parse(API.AddBaka2),

          body:
          {
            'details':detailsController.text,
            'des':desController.text,
            'name':nameController.text,
            'price':price.text,
            'adv':adv.text,
            'days':days.text,
            'free_ads':freeController.text
          }
      );

      if (res.statusCode == 200) {
        var resOfSignUp = jsonDecode(res.body);
        print(resOfSignUp);
        if (resOfSignUp['success'] == true) {
          print("SUCCESS");
          emit(AddBakaSuccessState());
        } else {
          print(res.body);
          print("error${res.statusCode}");
          emit(AddBakaErrorState(error: 'not 200'));

        }
      }
    } catch (e) {
      print("ERROR==$e");
      emit(AddBakaErrorState(error: '$e'));

    }
  }

  addNewCat() async {
   try {

     print("IMAGE");
     print("$imageLink");
        emit(AddCatLoadingState());
        var res = await http.post(Uri.parse(API.AddCat),

            body:
        {
          'image':imageLink,
          'name':nameController.text,
          'cat2':catController.text
        }
        );

        if (res.statusCode == 200) {
          var resOfSignUp = jsonDecode(res.body);
          print(resOfSignUp);
          if (resOfSignUp['success'] == true) {
            print("SUCCESS");
            emit(AddCatSuccessState());
          } else {
            print(res.body);
            print("error${res.statusCode}");
            emit(AddCatErrorState(error: 'not 200'));

          }
        }
      } catch (e) {
        print("ERROR==$e");
        emit(AddCatErrorState(error: '$e'));

    }
  }

  addNewCountry() async {
    try {

      emit(AddCountryLoadingState());
      var res = await http.post(Uri.parse(API.AddCountry),

          body:
      {
        'name':nameController.text,
        'countryCode':codeIdController.text,
         'image':imageLink
      }
      );
      if (res.statusCode == 200) {
        var resOfSignUp = jsonDecode(res.body);
        print(resOfSignUp);
        if (resOfSignUp['success'] == true) {
          print("SUCCESS");
          emit(AddCountrySuccessState());
        } else {

          print(res.body);
          print("error${res.statusCode}");
          emit(AddCountryErrorState(error: 'not 200'));

        }
      }
    } catch (e) {
      print("ERROR==$e");
      emit(AddCountryErrorState(error: '$e'));
    }
  }


  login() async {




    try {

      var res = await http.post(Uri.parse(API.adminLogin), body: {

        'email': emailController.text.trim(),
        'password': passController.text.trim(),
      });

      print("res${res.body}");

      if (res.statusCode == 200) {
        print("200");

        var resOfLogin = jsonDecode((res.body));

        if (resOfLogin['success'] == true) {

          final box = GetStorage();

          box.write('Id',resOfLogin['userData']['email']);

          print("SUCCESSS");
          Get.offAll(AdminView());

        }

        else {

          appMessage(text: 'بيانات خطا');

        }
      }
      else{
        print(res.statusCode);
      }
    } catch (e) {
      print(e);
     // emit(LoginErrorState(e.toString()));

    }
  }

  addAdmin() async {




     if(emailController.text.contains('@')&&passController.text.length>4){
       try {

         var res = await http.post(Uri.parse(API.addAdmin), body: {

           'email': emailController.text.trim(),
           'password': passController.text.trim(),

         });

         print("res${res.body}");

         if (res.statusCode == 200) {
           print("200");

           var resOfLogin = jsonDecode((res.body));

           if (resOfLogin['success'] == true) {

             appMessage(text: 'تم اضافة الادمن بنجاح');

             print("SUCCESSS");
             Get.offAll(AdminView());
           }

           else {

             appMessage(text: 'خطا');
           }
         }
         else{
           print(res.statusCode);
         }
       } catch (e) {
         print(e);
         // emit(LoginErrorState(e.toString()));

       }
     }else{
       appMessage(text: 'تاكد من ادخال البيانات بشكل سليم');
     }

  }


  updateCountry(String name,String code,String id) async {

    String n='';
    String c='';
    if(nameController.text==''){
      n=name;
    }
    else{
      n=nameController.text;
    }
    if(codeIdController.text==''){
      c=code;
    }else{
      c=codeIdController.text;
    }
    try {
      emit(UpdateCountryLoadingState());
      var res = await http.post(Uri.parse(API.UpdateCountry),

          body:
          {
            'name':n,
            'countryCode':c,
            'id':id
           // 'image':imageLink
          }
      );

      if (res.statusCode == 200) {
        var resOfSignUp = jsonDecode(res.body);
        print(resOfSignUp);
        if (resOfSignUp['success'] == true) {
          print("SUCCESS");

          emit(UpdateCountrySuccessState());

        } else {
          print(res.body);
          print("error${res.statusCode}");
          emit(UpdateCountryErrorState(error: 'not 200'));

        }
      }
    } catch (e) {
      print("ERROR==$e");
      emit(UpdateCountryErrorState(error: '$e'));
    }
  }


  deleteAdmin(String id) async {

    print('id'+id);
    emit(DeleteCatLoadingState());
    try {
      var res =
      await http.post(Uri.parse(API.DeleteAdmin),

          body:
          {
            "id":id,
          }
      );
      if (res.statusCode == 200) {
        print('HERE');
        var resOfSignUp = jsonDecode(res.body);
        print(resOfSignUp);
        if (resOfSignUp['Success'] == true) {
          emit(DeleteCountrySuccessState());

        } else {
          print(res.body);
          print("error${res.statusCode}");
          emit(DeleteCountryErrorState( error: 'e',));
        }
      }
    }

    catch (e) {
      print("ERROR==$e");
      emit(DeleteCountryErrorState( error: '$e',));
    }
  }

  deleteCountry (String id) async {
    emit(DeleteCatLoadingState());
    try {
      var res =
      await http.post(Uri.parse(API.DeleteCountry),

          body:
      {
        "id":id,
      }
      );
      if (res.statusCode == 200) {
        print('HERE');
        var resOfSignUp = jsonDecode(res.body);
        print(resOfSignUp);
        if (resOfSignUp['Success'] == true) {
          emit(DeleteCountrySuccessState());
        } else {
          print(res.body);
          print("error${res.statusCode}");
          emit(DeleteCountryErrorState( error: 'e',));
        }
      }
    }

    catch (e) {
      print("ERROR==$e");
      emit(DeleteCountryErrorState( error: '$e',));
    }
  }


  Future<List<Cat>> getAllCat() async {
    try {
      emit(getCatLoadingState());
      var res = await http.get(
        Uri.parse(API.allCat),

      );

      if (res.statusCode == 200) {
        print(res.bodyBytes);
        var responseBody = jsonDecode(res.body);
        if (responseBody["success"] == true) {
          print(responseBody['Data']);

          (responseBody['Data'] as List).forEach((eachRecord) {
            catList.add(Cat.fromJson(eachRecord));
          });
          print("List===$catList");
        }
        emit(getCatSuccessState());
      } else {
        print(res.statusCode);
        emit(getCatErrorState(error: 'error'));
      }
    } catch (e) {
      print(e.toString());
      emit(getCatErrorState(error: e.toString()));
    }

    return catList;
  }

  Future<List<Admin>> getAllAdmins() async {

    try {
      emit(getCatLoadingState());
      var res = await http.get(
        Uri.parse(API.allAdmins),

      );

      if (res.statusCode == 200) {
        print(res.bodyBytes);
        var responseBody = jsonDecode(res.body);
        if (responseBody["success"] == true) {
          print(responseBody['Data']);

          (responseBody['Data'] as List).forEach((eachRecord) {
            adminList.add(Admin.fromJson(eachRecord));
          });
          print("List===$adminList");
        }
        emit(getCatSuccessState());
      } else {
        print(res.statusCode);
        emit(getCatErrorState(error: 'error'));
      }
    } catch (e) {
      print(e.toString());
      emit(getCatErrorState(error: e.toString()));
    }

    return adminList;
  }




  Future<List<Baka>> getAllBouquet() async{

    try{
      emit(getBakaLoadingState());
      var res =await http.get(Uri.parse(API.bouquet),

      );

      if(res.statusCode==200){
        var responseBody =jsonDecode(res.body);
        if(responseBody["success"]==true) {
          print(responseBody['Data']);

          (responseBody['Data']as List).forEach ((eachRecord) {

            bakaList.add(Baka.fromJson(eachRecord));

          });
          print("BAKA===$bakaList");
        }
        emit(getBakaSuccessState());
      }
      else{
        emit(getBakaErrorState(error: 'error'));
      }
    }
    catch(e){

      print("BAKA ERROR=="+e.toString());
      emit(getBakaErrorState(error: '$e'));
    }

    return bakaList;
  }


  Future<List<Baka>> getAllBouquet2() async{

    try{
      emit(getBakaLoadingState());
      var res =await http.get(Uri.parse(API.bouquet2),

      );

      if(res.statusCode==200){
        var responseBody =jsonDecode(res.body);
        if(responseBody["success"]==true) {
          print(responseBody['Data']);

          (responseBody['Data']as List).forEach ((eachRecord) {

            bakaList2.add(Baka.fromJson(eachRecord));

          });
          print("BAKA===$bakaList2");
        }
        emit(getBakaSuccessState());
      }
      else{
        emit(getBakaErrorState(error: 'error'));
      }
    }
    catch(e){

      print("BAKA ERROR=="+e.toString());
      emit(getBakaErrorState(error: '$e'));
    }

    return bakaList2;
  }


  getCoins() async {



    emit(GetCoinsLoadingState());
    try {
      var res = await http.get(Uri.parse(API.Coins));

      print("res Sales Data ======== ${res.body}");

      if (res.statusCode == 200) {

        print("200");
        var resOfLogin = jsonDecode((res.body));

        if (resOfLogin['success'] == true) {

          coins = Coins.fromJson(resOfLogin['Data']);
          //
          // final box=GetStorage();
          // box.write('adsCoins', coins.ads);
          // box.write('systemCoins', coins.system);
          // box.write('loginCoins', coins.login);

          emit(GetCoinsSuccessState());
        }
        else {
          emit(GetCoinsErrorState('not 200'));

        }
      }
      else{
        print(res.statusCode);
      }
    } catch (e) {
      print(e);
      emit(GetCoinsErrorState('$e'));

    }
  }



  deleteBaka (String id) async {

    emit(DeleteBakaLoadingState());
    try {

      var res =
      await http.post(Uri.parse(API.DeleteBaka),

          body:
      {
        "id":id,
      }
      );

      if (res.statusCode == 200) {

        print('HERE');
        var resOfSignUp = jsonDecode(res.body);
        print(resOfSignUp);
        if (resOfSignUp['Success'] == true) {
          emit(DeleteBakaSuccessState());
        } else {
          print(res.body);
          print("error${res.statusCode}");
          emit(DeleteAdErrorState('e'));
        }
      }
    }
    catch (e) {
      print("ERROR==$e");
      emit(DeleteBakaErrorState('$e'));
    }


  }

  deleteBaka2 (String id) async {

    emit(DeleteBakaLoadingState());
    try {

      var res =
      await http.post(Uri.parse(API.DeleteBaka2),

          body:
          {
            "id":id,
          }
      );

      if (res.statusCode == 200) {

        print('HERE');
        var resOfSignUp = jsonDecode(res.body);
        print(resOfSignUp);
        if (resOfSignUp['Success'] == true) {
          emit(DeleteBakaSuccessState());
        } else {
          print(res.body);
          print("error${res.statusCode}");
          emit(DeleteAdErrorState('e'));
        }
      }
    }
    catch (e) {
      print("ERROR==$e");
      emit(DeleteBakaErrorState('$e'));
    }


  }





  deleteCat (String id) async {
    emit(DeleteCatLoadingState());
    try {
      var res =
      await http.post(Uri.parse(API.DeleteCat), body:
      {
        "id":id,
      }
      );
      if (res.statusCode == 200) {
        print('HERE');
        var resOfSignUp = jsonDecode(res.body);
        print(resOfSignUp);
        if (resOfSignUp['Success'] == true) {
          emit(DeleteCatSuccessState());
        } else {
          print(res.body);
          print("error${res.statusCode}");
          emit(DeleteCatErrorState('e'));
        }
      }
    }

    catch (e) {
      print("ERROR==$e");
      emit(DeleteBakaErrorState('$e'));
    }


  }

  salesRegister () async {
    emit(SalesRegisterLoadingState());
    try {
      var res =
      await http.post(Uri.parse(API.SalesReg), body:
      {
       'name':nameController.text,
        'email':emailController.text,
        'password':'123456',
        'code':codeController.text,
        'coins':'0'
      }
      );
      if (res.statusCode == 200) {
        print('HERE');
        var resOfSignUp = jsonDecode(res.body);
        print(resOfSignUp);
        if (resOfSignUp['Success'] == true) {
          emit(SalesRegisterSuccessState());
        } else {
          print(res.body);
          print("error${res.statusCode}");
          emit(SalesRegisterErrorState(error: 'e'));
        }
      }
    }

    catch (e) {
      print("ERROR==$e");
      emit(SalesRegisterErrorState(error: '$e'));
    }


  }

  salesDelete (String id) async {
    emit(SalesDeleteLoadingState());
    try {
      var res =
      await http.post(Uri.parse(API.SalesDelete), body:
      {
        'id':id,
      }
      );
      if (res.statusCode == 200) {
        print('HERE');
        var resOfSignUp = jsonDecode(res.body);
        print(resOfSignUp);
        if (resOfSignUp['Success'] == true) {
          emit(SalesDeleteSuccessState());
        } else {
          print(res.body);
          print("error${res.statusCode}");
          emit(SalesDeleteErrorState(error: 'e'));
        }
      }
    }

    catch (e) {
      print("ERROR==$e");
      emit(SalesDeleteErrorState(error: '$e'));
    }


  }



  Future<List<DoctorModel>> getAllDoctors(String cat2) async {
    try {
      emit(GetAllDoctorsLoadingState());
      var res = await http.post(
        Uri.parse(API.allDoctorsData),
        body: {
          'cat2': cat2,
        },
      );
      if (res.statusCode == 200) {
        print(res.body);
        var responseBody = jsonDecode(res.body);

        if (responseBody["success"] == true) {
          print(responseBody['Data']);
          (responseBody['Data'] as List).forEach((eachRecord) {
            doctorList.add(DoctorModel.fromJson(eachRecord));
          });
          print("List===$doctorList");
        }
        emit(GetAllDoctorsSuccessState());
      } else {
        print(res.statusCode);
        emit(GetAllDoctorsErrorState('e'));
      }
    } catch (e) {
      print("Error===");
      print(e.toString());
      emit(GetAllDoctorsErrorState('$e'));
    }
    return doctorList;
  }


  // Future<List<DoctorModel>> getAllDoctors() async {
  //   try {
  //     emit(GetAllDoctorsLoadingState());
  //     var res = await http.get(
  //       Uri.parse(API.AdminGetDoctors),
  //
  //     );
  //     if (res.statusCode == 200) {
  //       print(res.body);
  //       var responseBody = jsonDecode(res.body);
  //
  //       if (responseBody["success"] == true) {
  //         print(responseBody['Data']);
  //         (responseBody['Data'] as List).forEach((eachRecord) {
  //           doctorList.add(DoctorModel.fromJson(eachRecord));
  //         });
  //         print("List===$doctorList");
  //       }
  //       emit(GetAllDoctorsSuccessState());
  //     } else {
  //       print(res.statusCode);
  //       emit(GetAllDoctorsErrorState('error'));
  //     }
  //   } catch (e) {
  //     print("Error===");
  //     print(e.toString());
  //     emit(GetAllDoctorsErrorState(e.toString()));
  //   }
  //
  //   return doctorList;
  // }


  Future<List<Sales>> getAllSales() async {
    try {
      emit(GetAllSalesLoadingState());
      var res = await http.get(
        Uri.parse(API.AllSales),

      );
      if (res.statusCode == 200) {
        print(res.body);
        var responseBody = jsonDecode(res.body);

        if (responseBody["success"] == true) {
          print(responseBody['Data']);
          (responseBody['Data'] as List).forEach((eachRecord) {
            salesList.add(Sales.fromJson(eachRecord));
          });
          print("List===$salesList");
        }
        emit(GetAllSalesSuccessState());
      } else {
        print(res.statusCode);
        emit(GetAllSalesErrorState('error'));
      }
    } catch (e) {
      print("Error===");
      print(e.toString());
      emit(GetAllSalesErrorState(e.toString()));
    }

    return salesList;
  }


  Future<List<Ads>> getAllAds() async {


    try {
      emit(GetAllAdsLoadingState());
      var res = await http.get(
        Uri.parse(API.ads),
       // headers: myheaders,
      );
      print("RES");
      print(res.body);
      print(res.statusCode);
      print(res.headers);
      print(res.request);
      if (res.statusCode == 200) {
        print(res.body);
        var responseBody = jsonDecode(res.body);
        print(responseBody);
        if (responseBody["success"] == true) {
          print("DATA");
          print(responseBody['Data']);

          (responseBody['Data'] as List).forEach((eachRecord) {
            adsList.add(Ads.fromJson(eachRecord));
          });

          print("Appointment===$adsList");
        }

        emit(GetAllAdsSuccessState());
      }

      else {

        print("ERROR HERE1111");

        print("ERRRROORRRRRRRRRRR................");

        print(res.statusCode);

        emit(GetAllAdsErrorState( 'error'));
      }
    } catch (e) {

      print("ERROR HERE2222");

      print("ERRRROORRRRRRRRRRR................");

      print(e.toString());

      emit(GetAllAdsErrorState( e.toString()));
    }

    return adsList;
  }


  Future<List<System>>getAllSystemBooking() async {
    try {
      emit(GetAllSalesLoadingState());
      var res = await http.get(
        Uri.parse(API.GetSystemBooking),
        // headers: myheaders,
      );

      if (res.statusCode == 200) {
        print(res.body);
        var responseBody = jsonDecode(res.body);
        print(responseBody);
        if (responseBody["success"] == true) {
          print("DATA");
          print(responseBody['Data']);

          (responseBody['Data'] as List).forEach((eachRecord) {
            systemList.add(System.fromJson(eachRecord));
          });


        }

        emit(GetAllSystemSuccessState());
      }

      else {

        print("ERROR HERE1111");

        print("ERRRROORRRRRRRRRRR................");

        print(res.statusCode);

        emit(GetAllSystemErrorState( 'error'));
      }
    } catch (e) {

      print("ERROR HERE2222");

      print("ERRRROORRRRRRRRRRR................");

      print(e.toString());

      emit(GetAllSystemErrorState( '$e'));
    }

    return systemList;
  }



  Future<List<Ads>> getAllAds2() async {
    try {
      emit(GetAllAdsLoadingState());
      var res = await http.get(
        Uri.parse(API.ads2),
        // headers: myheaders,
      );
      print("RES");
      print(res.body);
      print(res.statusCode);
      print(res.headers);
      print(res.request);
      if (res.statusCode == 200) {
        print(res.body);
        var responseBody = jsonDecode(res.body);
        print(responseBody);
        if (responseBody["success"] == true) {
          print("DATA");
          print(responseBody['Data']);

          (responseBody['Data'] as List).forEach((eachRecord) {
            adsList2.add(Ads.fromJson(eachRecord));
          });

          print("Appointment===$adsList");
        }

        emit(GetAllAdsSuccessState());
      }

      else {

        print("ERROR HERE1111");

        print("ERRRROORRRRRRRRRRR................");

        print(res.statusCode);

        emit(GetAllAdsErrorState( 'error'));
      }
    } catch (e) {

      print("ERROR HERE2222");

      print("ERRRROORRRRRRRRRRR................");

      print(e.toString());

      emit(GetAllAdsErrorState( e.toString()));
    }

    return adsList;
  }

  addToTopDoctor(String id) async {

    emit(BestDoctorsLoadingState());
    try {

      var res =
      await http.post(Uri.parse(API.AddToTopDoctor), body:
      {
        "doctor_id":id,
      }
      );

      if (res.statusCode == 200) {

        print('HERE');
        var resOfSignUp = jsonDecode(res.body);

        print(resOfSignUp);
        if (resOfSignUp['success'] == true) {

          emit(BestDoctorsSuccessState());

        } else {

          print(res.body);
          print("error${res.statusCode}");
          emit(BestDoctorsErrorState());
        }
      }
    } catch (e) {
      print("ERROR==$e");
      emit(BestDoctorsErrorState());

    }


  }

  deleteDoctor(String id) async {

    emit(DeleteDoctorsLoadingState());
    try {

      var res =
      await http.post(Uri.parse(API.deleteDoctor), body:
      {
        "doctor_id":id,
      }
      );

      if (res.statusCode == 200) {

        print('HERE');
        var resOfSignUp = jsonDecode(res.body);

        print(resOfSignUp);
        if (resOfSignUp['Success'] == true) {

          emit(DeleteDoctorsSuccessState());

        } else {

          print(res.body);
          print("error${res.statusCode}");
          emit(DeleteDoctorsErrorState('ERRROR'));
        }
      }
    } catch (e) {

      print("ERROR==$e");
      emit(DeleteDoctorsErrorState('$e'));

    }


  }

  deleteAd(String id) async {

    emit(DeleteAdLoadingState());
    try {

      var res =
      await http.post(Uri.parse(API.deleteAd), body:
      {
        "id":id,
      }
      );

      if (res.statusCode == 200) {

        print('HERE');
        var resOfSignUp = jsonDecode(res.body);
        print(resOfSignUp);
        if (resOfSignUp['Success'] == true) {
          emit(DeleteAdSuccessState());
        } else {
          print(res.body);
          print("error${res.statusCode}");
          emit(DeleteAdErrorState('e'));
        }
      }
    }
    catch (e) {
      print("ERROR==$e");
      emit(DeleteAdErrorState('$e'));
    }


  }

  Future<List<Booking>> getAllBooking() async {


    try {
      emit(GetAllBookingLoadingState());
      var res = await http.get(
        Uri.parse(API.AllBooking),
      );
      print(res.body);
      if (res.statusCode == 200) {
        print(res.body);
        var responseBody = jsonDecode(res.body);

        print(responseBody);

        if (responseBody["success"] == true) {
          print(responseBody['Data']);

          (responseBody['Data'] as List).forEach((eachRecord) {
            bookingList.add(Booking.fromJson(eachRecord));
          });

          print("Booking ===$bookingList");
        }
        emit(GetAllBookingSuccessState());
      } else {
        print("ERRRROORRRRRRRRRRR................");
        print(res.statusCode);
        emit(GetAllBookingErrorState( 'error'));
      }
    } catch (e) {
      print("ERRRROORRRRRRRRRRR................");
      print(e.toString());
      emit(GetAllBookingErrorState( e.toString()));
    }

    return bookingList;
  }

  showDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Colors.white,
            title: const Custom_Text(
              text: 'الصورة ',
              alignment: Alignment.center,
              fontSize: 19,
              color: Colors.black,
            ),
            children: [
              SimpleDialogOption(
                child: const Custom_Text(
                  text: 'كاميرا ',
                  alignment: Alignment.center,
                  fontSize: 14,
                  color: Colors.black,
                ),
                onPressed:(){
                  captureImage();
                },
              ),
              SimpleDialogOption(
                  child: const Custom_Text(
                    text: ' اختر صورة  ',
                    alignment: Alignment.center,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    pickImage();
                  }),
              SimpleDialogOption(
                  child: const Custom_Text(
                    text: 'الغاء  ',
                    alignment: Alignment.center,
                    fontSize: 14,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    Get.back();
                  })
            ],
          );
        });
  }

  captureImage()async{
    pickedImageXFile= await _picker.pickImage(source: ImageSource.camera);
    Get.back();
    pickedImageXFile;

    emit( setImageSuccessState());

    uploadImageToServer();
  }

  pickImage()async{
    pickedImageXFile= await _picker.pickImage(source: ImageSource.gallery);
    Get.back();
    emit( setImageSuccessState());
    uploadImageToServer();
  }

  uploadImageToServer()async {
    emit(sendImageToServerLoadingState());
    try {
      var requestImgurApi = http.MultipartRequest(
          "POST",
          Uri.parse("https://api.imgur.com/3/image")
      );

      String imageName = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      requestImgurApi.fields['title'] = imageName;
      requestImgurApi.headers['Authorization'] =
          "Client-ID " + "fb8a505f4086bd5";
      //"6ca0d6456311e4d";

      var imageFile = await http.MultipartFile.fromPath(
        'image',
        pickedImageXFile!.path,
        filename: imageName,
      );

      requestImgurApi.files.add(imageFile);
      var responseFromImgurApi = await requestImgurApi.send();

      var responseDataFromImgurApi = await responseFromImgurApi.stream
          .toBytes();
      var resultFromImgurApi = String.fromCharCodes(responseDataFromImgurApi);

      print("RESULT= = = $resultFromImgurApi");

      Map<String, dynamic> jsonRes = json.decode(resultFromImgurApi);
      imageLink = (jsonRes["data"]["link"]).toString();
     // String deleteHash = (jsonRes["data"]["deletehash"]).toString();

      emit(setImageSuccessState());
    } catch (e) {
      print(e);

      emit(sendImageToServerErrorState(error: e.toString()));
    }
  }
 }









