


import 'package:doctors_app/presentaion/bloc/admin/admin_cubit.dart';
import 'package:doctors_app/presentaion/bloc/admin/admin_state.dart';
import 'package:doctors_app/presentaion/const/app_message.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';

import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:doctors_app/presentaion/widgets/Custom_button.dart';
import 'package:doctors_app/presentaion/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class AdminLoginView extends StatefulWidget {


  AdminLoginView();

  @override
  State<AdminLoginView> createState() => _UserLoginViewState();
}

class _UserLoginViewState extends State<AdminLoginView> {


  @override
  Widget build(BuildContext context) {




    return BlocProvider(
        create: (BuildContext context) => AdminCubit(),
        child:
        BlocConsumer<AdminCubit, AdminStates>(listener: (context, state) {


        }, builder: (context, state) {
           AdminCubit cubit =  AdminCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: ColorsManager.primary,
              toolbarHeight: 1,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Column(
                        children: [

                          const SizedBox(
                            height: 20,
                          ),
                          const Custom_Text(
                            text: ' قم بتسجيل دخول ',
                            fontSize: 24,
                            alignment: Alignment.center,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 30,
                          ),

                          const SizedBox(
                            height: 20,
                          ),


                          Container(
                            width: 350,
                            child: CustomTextFormField(
                              controller: cubit.emailController,
                              color: Colors.black,
                              hint: "البريد الالكتروني ",
                              max: 2,
                              obs: false,
                              obx: false,
                              ontap: () {},
                              type: TextInputType.text,
                            ),
                          ) ,


                          const SizedBox(
                            height: 30,
                          ),

                          Container(
                            width: 350,
                            child: CustomTextFormField(
                              controller: cubit.passController,
                              color: Colors.black,
                              hint: "كلمة المرور ",
                              obs: true,
                              obx: true,
                              ontap: () {},
                              type: TextInputType.text,
                            ),
                          ),

                          const SizedBox(
                            height: 30,
                          ),
                          CustomButton(
                              text: "تسجيل الدخول ",
                              onPressed: () {

                                cubit.login();

                                },
                              color1: ColorsManager.primary,
                              color2: Colors.white),


                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }

}


