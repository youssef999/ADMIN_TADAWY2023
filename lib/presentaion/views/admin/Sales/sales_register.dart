
 import 'package:doctors_app/presentaion/bloc/admin/admin_cubit.dart';
import 'package:doctors_app/presentaion/bloc/admin/admin_state.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../const/app_message.dart';
import '../../../widgets/Custom_button.dart';
import '../../../widgets/custom_textformfield.dart';
import '../admin_view.dart';

class SalesRegister extends StatelessWidget {
  const SalesRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AdminCubit()..getAllSales(),
        child: BlocConsumer<AdminCubit, AdminStates>(
        listener: (context, state) {

          if(state is SalesRegisterSuccessState){
            appMessage(text: 'تم تسجيل المندوب بنجاح ');
            Get.offAll(AdminView());
          }
    },
    builder: (context, state) {

    AdminCubit cubit = AdminCubit.get(context);
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: 1,
        backgroundColor:ColorsManager.primary,
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              height: 200,
              color:ColorsManager.primary,
              child:Image.asset('assets/images/logo.png'),
            ),
            SizedBox(height: 20,),
            CustomTextFormField(
              controller:cubit.emailController,
              color:Colors.black,
              hint: " البريد الالكتروني ",
              obs: false,
              obx: false,
              ontap:(){},
              type:TextInputType.text,
            ),
            SizedBox(height: 20,),
            CustomTextFormField(
              controller:cubit.nameController,
              color:Colors.black,
              hint: "   الاسم ",
              obs: false,
              obx: false,
              ontap:(){},
              type:TextInputType.text,
            ),
            SizedBox(height: 20,),
            CustomTextFormField(
              controller:cubit.codeController,
              color:Colors.black,
              hint: "   رمز التسجيل ",
              obs: false,
              obx: false,
              ontap:(){},
              type:TextInputType.text,
            ),
            // SizedBox(height: 20,),
            // CustomTextFormField(
            //   controller:cubit.passController,
            //   color:Colors.black,
            //   hint: "كلمة المرور ",
            //   obs: true,
            //   obx: true,
            //   ontap:(){},
            //   type:TextInputType.text,
            // ),
            SizedBox(height: 20,),
            CustomButton(
              text: 'تسجيل',
              color1:ColorsManager.primary,
              color2:Colors.white,
              onPressed:(){
                cubit.salesRegister();
              },
            )
          ],
        ),
      )
    );

    }));
  }
}