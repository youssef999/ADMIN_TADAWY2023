

import 'package:doctors_app/domain/models/country.dart';
import 'package:doctors_app/presentaion/bloc/admin/admin_cubit.dart';
import 'package:doctors_app/presentaion/bloc/admin/admin_state.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/views/HomeApp/choose/choose_view.dart';
import 'package:doctors_app/presentaion/views/admin/admin_view.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:doctors_app/presentaion/widgets/Custom_button.dart';
import 'package:doctors_app/presentaion/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../const/app_message.dart';
import 'add_new_country.dart';

class UpdateCountryView extends StatelessWidget {
String id,name,code;


UpdateCountryView({required this.id,required this.name,required this.code});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create:(BuildContext context)=>AdminCubit()..getAllCountries(),
        child: BlocConsumer<AdminCubit,AdminStates>(
            listener:(context,state){

              if(state is UpdateCountrySuccessState){
                appMessage(text: 'تم التعديل بنجاح');
                Get.offAll(AdminView());
              }
            },
            builder:(context,state){

              AdminCubit cubit =AdminCubit.get(context);

              return Scaffold(
                  appBar:AppBar(
                    toolbarHeight: 7,
                    elevation: 0,
                    backgroundColor:ColorsManager.primary,
                  ),
                  body: Container(
                    color:ColorsManager.primary,
                    child: ListView(
                      children: [
                        const SizedBox(height: 10,),
                        Container(
                          color:ColorsManager.primary,
                          height: 150,
                          child:Image.asset('assets/images/logo.png'),
                        ),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CustomTextFormField(
                            controller:cubit.nameController,
                            color:Colors.black,
                            hint: "$name ",
                            max: 2,
                            obs: false,
                            obx: false,
                            ontap:(){},
                            type:TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CustomTextFormField(
                            controller:cubit.codeIdController,
                            color:Colors.black,
                            hint: " $code",
                            max: 2,
                            obs: false,
                            obx: false,
                            ontap:(){},
                            type:TextInputType.text,
                          ),
                        ),
                        CustomButton(
                          text: ' تعديل ',
                          color1:ColorsManager.white,
                          color2:ColorsManager.primary,
                          onPressed:(){

                            cubit.updateCountry(name, code,id);

                            },
                        ),
                        const SizedBox(height: 20,),
                      //  CountryWidget(cubit.countryList,cubit),
                      ],
                    ),
                  )
              );
            }

        )
    );
  }
}
