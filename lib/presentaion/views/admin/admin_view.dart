


 import 'package:doctors_app/presentaion/views/admin/Ads/all_ads_view2.dart';
import 'package:doctors_app/presentaion/views/admin/Booking/booking_view.dart';
import 'package:doctors_app/presentaion/views/admin/Country_admin/countries_view.dart';
import 'package:doctors_app/presentaion/views/admin/doctors_type/doctor_type_view.dart';
import 'package:doctors_app/presentaion/views/admin/system_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../resources/color_manager.dart';
import '../../widgets/Custom_button.dart';
import '../Coins/update_coins.dart';
import 'Ads/all_ads_view.dart';
import 'BAKA/baka_view.dart';
import 'BAKA/baka_view2.dart';
import 'Cat/cat_view.dart';
import 'Sales/all_sales_view.dart';
import 'add_new_admin.dart';
import 'all_admins.dart';
import 'doctors/doctors_view.dart';

class AdminView extends StatelessWidget {
  const AdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box=GetStorage();
    String email=box.read('Id')??'x';
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: 6,
        elevation: 0,
        backgroundColor:ColorsManager.primary,
      ),
      body:SingleChildScrollView(
        child:Center(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                height:240,
                child:Image.asset('assets/images/admin.png',fit:BoxFit.fill,),),
              SizedBox(height: 20,),
               if(email=='Alpha@alphatele.net')
              CustomButton(
                text: ' الادمنز  ',
                color1:ColorsManager.primary,
                color2:Colors.white,
                onPressed:(){

               //   Get.to(AddAdminView());
                  Get.to(AllAdminsyView());
                //  Get.to(DoctorType());
                  //   Get.to(DoctorsView());

                },
              ),
              SizedBox(height: 20,),
              CustomButton(
                text: 'الاطباء و المراكز الطبية ',
                color1:ColorsManager.primary,
                color2:Colors.white,
                onPressed:(){

                  Get.to(DoctorType());
               //   Get.to(DoctorsView());

                  },
              ),

              SizedBox(height: 20,),
              CustomButton(
                text: 'الاعلانات ',
                color1:ColorsManager.primary,
                color2:Colors.white,
                onPressed:(){

                  Get.to(AllAdsView());

                },
              ),
              SizedBox(height: 20,),
              CustomButton(
                text: 'الاعلانات في خانة الاطباء ',
                color1:ColorsManager.primary,
                color2:Colors.white,
                onPressed:(){

                  Get.to(AllAdsView2());

                },
              ),
              SizedBox(height: 20,),
              CustomButton(
                text:  ' الاشتراكات  ',
                color1:ColorsManager.primary,
                color2:Colors.white,
                onPressed:(){
                  Get.to( AllBookingView());
                },
              ),
              SizedBox(height: 20,),
              CustomButton(
                text:  'الباقات للاعلانات  ',
                color1:ColorsManager.primary,
                color2:Colors.white,
                onPressed:(){
                  Get.to( AllBakaView());
                },
              ),
              SizedBox(height: 20,),
              CustomButton(
                text:  'باقات الاشتراك في التطبيق  ',
                color1:ColorsManager.primary,
                color2:Colors.white,
                onPressed:(){
                  Get.to( AllBakaView2());
                },
              ),
              SizedBox(height: 20,),
              CustomButton(
                text:  ' الاصناف    ',
                color1:ColorsManager.primary,
                color2:Colors.white,
                onPressed:(){

                  Get.to( CatView());

                },
              ),
              SizedBox(height: 20,),
              CustomButton(
                text:  ' حجز سيستم   ',
                color1:ColorsManager.primary,
                color2:Colors.white,
                onPressed:(){

                  Get.to( SystemView());

                },
              ),
              SizedBox(height: 20,),
              CustomButton(
                text:  ' تعديل نقاط الاعلان   ',
                color1:ColorsManager.primary,
                color2:Colors.white,
                onPressed:(){

                  Get.to(UpdateCoins(type: 'ads',));

                },
              ),
              SizedBox(height: 20,),
              CustomButton(
                text:  ' تعديل نقاط تسجيل الاطباء   ',
                color1:ColorsManager.primary,
                color2:Colors.white,
                onPressed:(){

                  Get.to(UpdateCoins(type: 'login',));

                },
              ),
              SizedBox(height: 20,),
              CustomButton(
                text:  ' تعديل نقاط تسجيل النظام   ',
                color1:ColorsManager.primary,
                color2:Colors.white,
                onPressed:(){
                  Get.to(UpdateCoins(type: 'system',));
                  },
              ),
              SizedBox(height: 20,),
              CustomButton(
                text:  ' المندوبين   ',
                color1:ColorsManager.primary,
                color2:Colors.white,
                onPressed:() {

                  Get.to( AllSalesView());

                },
              ),

              SizedBox(height: 20,),

              CustomButton(
                text:  ' البلاد    ',
                color1:ColorsManager.primary,
                color2:Colors.white,
                onPressed:(){

                  Get.to( AdminCountryView());

                  },
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
