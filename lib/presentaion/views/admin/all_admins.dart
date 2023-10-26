
import 'package:doctors_app/domain/models/country.dart';
import 'package:doctors_app/presentaion/bloc/admin/admin_cubit.dart';
import 'package:doctors_app/presentaion/bloc/admin/admin_state.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/views/HomeApp/choose/choose_view.dart';
import 'package:doctors_app/presentaion/views/admin/Country_admin/update_country.dart';
import 'package:doctors_app/presentaion/views/admin/add_new_admin.dart';
import 'package:doctors_app/presentaion/views/admin/admin_view.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:doctors_app/presentaion/widgets/Custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../domain/models/admin.dart';
import '../../const/app_message.dart';



class AllAdminsyView extends StatelessWidget {
  const AllAdminsyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create:(BuildContext context)=>AdminCubit()..getAllAdmins(),
        child: BlocConsumer<AdminCubit,AdminStates>(
            listener:(context,state){

              if(state is DeleteCountrySuccessState){
                appMessage(text: 'تم الحذف بنجاح');
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
                        CustomButton(
                          text: ' اضافة ',
                          color1:ColorsManager.white,
                          color2:ColorsManager.primary,
                          onPressed:(){
                            Get.to(AddAdminView());
                          },
                        ),
                        const SizedBox(height: 20,),
                        adminWidget(cubit.adminList,cubit),
                      ],
                    ),
                  )
              );
            }

        )
    );
  }
}

Widget adminWidget(List<Admin> listApp,AdminCubit cubit) {
  return SingleChildScrollView(
    child: Container(
      height:7100,
      color: Colors.grey[200],
      //width:double.infinity,
      padding: const EdgeInsets.only(top: 9, left: 7, right: 7),
      child:
      ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listApp.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white70),
                child:   Column(
                  children: [
                    SizedBox(height: 11,),
                    Custom_Text(
                      text: listApp[index].email.toString(),
                      color: ColorsManager.black,
                      fontSize: 21,
                      alignment: Alignment.center,
                    ),
                    SizedBox(height: 10,),
                    // Custom_Text(
                    //   text: listApp[index].email.toString(),
                    //   color: ColorsManager.black,
                    //   fontSize: 21,
                    //   alignment: Alignment.center,
                    // ),
                    // CustomButton(
                    //   text: 'تعديل',
                    //   color1:ColorsManager.primary,
                    //   color2:Colors.white,
                    //   onPressed:(){
                    //
                    //
                    //     Get.to(UpdateCountryView(
                    //       name: listApp[index].name,
                    //       code: listApp[index].code,
                    //       id: listApp[index].id.toString(),
                    //     ));
                    //
                    //   },
                    // ),
                    SizedBox(height: 10,),
                    CustomButton(
                      text: 'حذف',
                      color1:ColorsManager.primary,
                      color2:Colors.white,
                      onPressed:(){
                        print(listApp[index].id);
                        cubit.deleteAdmin(listApp[index].id.toString());

                      },
                    )
                  ],
                ),


              ),
            );
          }),
    ),
  );
}