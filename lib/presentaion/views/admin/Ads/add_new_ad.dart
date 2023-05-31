



 import 'dart:io';

import 'package:doctors_app/presentaion/const/app_message.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/widgets/Custom_button.dart';
import 'package:doctors_app/presentaion/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
 import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import '../../../bloc/admin/admin_cubit.dart';
import '../../../bloc/admin/admin_state.dart';
import '../../../widgets/Custom_Text.dart';
import '../admin_view.dart';

class AddNewAd extends StatefulWidget {
    const AddNewAd({Key? key}) : super(key: key);

    @override
    State<AddNewAd> createState() => _AddNewAdState();
  }

  class _AddNewAdState extends State<AddNewAd> {
    SingingCharacter? _character = SingingCharacter.x;
    String day='';
    List<DateTime?> today = [
      DateTime(2023, 5, 1),
      //DateTime(2050, 8, 13),
    ];
    @override
    Widget build(BuildContext context) {
      return BlocProvider(
          create: (BuildContext context) => AdminCubit()..getAllAds2(),
          child: BlocConsumer<AdminCubit, AdminStates>(

          listener: (context, state) {
        if(state is AddNewAdsSuccessState){
          appMessage(text: 'تم الاضافة بنجاح');
          Get.offAll(AdminView());
        }
      },

      builder: (context, state) {

      AdminCubit cubit = AdminCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsManager.primary,
          toolbarHeight: 1,
        ),
        body:Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [

          const SizedBox(height: 20,),
          cubit.pickedImageXFile != null?
          InkWell(
            child: Container(
              height:  MediaQuery.of(context).size.width*0.6,
              width: MediaQuery.of(context).size.width*0.8,
              decoration:BoxDecoration(
                  image: DecorationImage(
                      image:FileImage(
                          File(cubit.pickedImageXFile!.path)),
                      fit:BoxFit.fill
                  )
              ),
            ),
            onTap:(){
              cubit.showDialogBox(context);
            },
          ):InkWell(
            child: Column(
              children: [

                CircleAvatar(
                  radius: 100,
                  child:Image.asset('assets/images/logo.png'),
                ),
                const SizedBox(height: 20,),
                const Custom_Text(text: 'اضف صورة الاعلان',color:Colors.black,
                  fontSize:21,alignment:Alignment.center,
                ),
              ],
            ),
            onTap:(){
              cubit.showDialogBox(context);
            }),
              SizedBox(height: 20,),
              CustomTextFormField(
                controller:cubit.idController,
                color:Colors.black,
                hint: " رمز الطبيب  ",
                max: 2,
                obs: false,
                obx: false,
                ontap:(){},
                type:TextInputType.text,
              ),
              const SizedBox(height: 20,),
              CustomTextFormField(
                controller:cubit.nameController,
                color:Colors.black,
                hint: "اسم الاعلان ",
                max: 2,
                obs: false,
                obx: false,
                ontap:(){},
                type:TextInputType.text,
              ),
              const SizedBox(height: 10,),
              CustomTextFormField(
                controller:cubit.detailsController,
                color:Colors.black,
                hint: "تفاصيل",
                max:4,
                obs: false,
                obx: false,
                ontap:(){},
                type:TextInputType.text,
              ),
              const SizedBox(height: 10,),
              // CustomTextFormField(
              //   controller:cubit.numController,
              //   color:Colors.black,
              //   hint: "عدد ايام الاعلان",
              //   max:2,
              //   obs: false,
              //   obx: false,
              //   ontap:(){},
              //   type:TextInputType.number,
              // ),
              ListTile(
                title: const Text('من افضل الاعلانات'),
                leading: Radio<SingingCharacter>(
                  value: SingingCharacter.x,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                      day='true';
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('ليس من افضل الاعلانات'),
                leading: Radio<SingingCharacter>(
                  value: SingingCharacter.y,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                      day='false';
                    });
                  },
                ),
              ),
              const SizedBox(height: 20,),

              CustomTextFormField(
                controller:cubit.countryController,
                color:Colors.black,
                hint: "البلد",
                max:2,
                obs: false,
                obx: false,
                ontap:(){},
                type:TextInputType.text,
              ),
              const SizedBox(height: 20,),
          CalendarDatePicker2(
            config: CalendarDatePicker2Config(),
            value: today,
            onValueChanged: (dates) => today = dates,
          ),


              SizedBox(height: 20,),
              CustomButton(text: 'اضافة', onPressed: (){


                print(today);
                cubit.addNewAds(today.toString().replaceAll('[','').replaceAll(']','').replaceAll('00:00:00.000',''), day);

              }, color1: ColorsManager.primary, color2:Colors.white),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      );
      }));
    }
  }

 enum SingingCharacter { x, y }