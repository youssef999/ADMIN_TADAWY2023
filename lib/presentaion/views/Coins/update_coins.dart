


 import 'package:doctors_app/presentaion/const/app_message.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:doctors_app/presentaion/widgets/Custom_button.dart';
import 'package:flutter/material.dart';
 import 'package:doctors_app/presentaion/bloc/admin/admin_cubit.dart';
 import 'package:doctors_app/presentaion/bloc/admin/admin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../widgets/custom_textformfield.dart';
import '../admin/admin_view.dart';



 class UpdateCoins extends StatelessWidget {
 String type;


 UpdateCoins({required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AdminCubit()..getCoins(),
        child: BlocConsumer<AdminCubit, AdminStates>(

        listener: (context, state) {

          if(state is UpdateAdsCoinsSuccessState){
            appMessage(text: 'تم تعديل النقاط بنجاح');
            Get.offAll(AdminView());
          }
    },

    builder: (context, state) {

    AdminCubit cubit = AdminCubit.get(context);
    TextEditingController Coins=TextEditingController();
    return Scaffold(
      appBar:AppBar(
        backgroundColor:ColorsManager.primary,
      ),
      body:Column(
        children: [
          SizedBox(height: 20,),
          if(type=='login')
          Column(
            children: [
              Custom_Text(text:cubit.coins.login.toString(),fontSize: 26,color:Colors.black,alignment:Alignment.center, ),
             SizedBox(height: 20,),

              CustomTextFormField(
                controller:Coins,
                type:TextInputType.text,
                hint: 'النقاط',
                obs:false,
                obx:false,
                ontap:(){},
                color:Colors.black,
                max: 3,
              ),
              CustomButton(text: 'تعديل',
                color1:ColorsManager.primary,color2:ColorsManager.white,onPressed:(){

                  cubit.updateLoginCoins((Coins.text));
                },)
            ],
          ),

          if(type=='ads')
            Column(
              children: [
                Custom_Text(text:cubit.coins.ads.toString(),fontSize: 26,color:Colors.black,alignment:Alignment.center, ),
                SizedBox(height: 20,),

                CustomTextFormField(
                  controller:Coins,
                  type:TextInputType.text,
                  hint: 'النقاط',
                  obs:false,
                  obx:false,
                  ontap:(){},
                  color:Colors.black,
                  max: 3,
                ),
                CustomButton(text: 'تعديل',
                  color1:ColorsManager.primary,color2:ColorsManager.white,onPressed:(){
                    cubit.updateAdsCoins((Coins.text));

                  },)
              ],
            ),

          if(type=='system')
            Column(
              children: [
                Custom_Text(text:cubit.coins.system.toString(),fontSize: 26,color:Colors.black,alignment:Alignment.center, ),
                SizedBox(height: 20,),

                CustomTextFormField(
                  controller:Coins,
                  type:TextInputType.text,
                  hint: 'النقاط',
                  obs:false,
                  obx:false,
                  ontap:(){},
                  color:Colors.black,
                  max: 3,
                ),
                CustomButton(text: 'تعديل',
                  color1:ColorsManager.primary,color2:ColorsManager.white,onPressed:(){


                  cubit.updateSystemCoins((Coins.text));
                  },)
              ],
            )
        ],
      ),
    );
    }));
  }
}