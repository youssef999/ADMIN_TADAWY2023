


import 'package:doctors_app/domain/models/user.dart';
import 'package:doctors_app/presentaion/bloc/admin/admin_cubit.dart';
import 'package:doctors_app/presentaion/bloc/admin/admin_state.dart';
import 'package:doctors_app/presentaion/const/app_message.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/views/admin/Sales/sales_register.dart';
import 'package:doctors_app/presentaion/views/admin/admin_view.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../domain/models/sales.dart';
import '../../../widgets/Custom_button.dart';
import '../../User/doctors/doctor-details_view.dart';


 class AllSalesView extends StatelessWidget {

  const  AllSalesView( {super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context) => AdminCubit()..getAllSales(),
        child: BlocConsumer<AdminCubit, AdminStates>(
            listener: (context, state) {

              if(state is SalesDeleteSuccessState){
                appMessage(text: 'تم حذف المندوب بنجاح');
                Get.offAll(AdminView());
              }
            },
            builder: (context, state) {

              AdminCubit cubit = AdminCubit.get(context);

              return Scaffold(
                appBar: AppBar(
                  toolbarHeight: 6,
                  elevation: 0,
                  backgroundColor: ColorsManager.primary,
                ),
                body: Container(
                  color: Colors.grey[200],
                  child: ListView(
                    children: [


                      const SizedBox(
                        height: 10,
                      ),

                      CustomButton(text: 'انشاء مندوب جديد',
                          onPressed: (){

                        Get.to(SalesRegister());
                          }, color1: ColorsManager.primary, color2:Colors.white),
                      const SizedBox(
                        height: 10,
                      ),
                      AllDoctorsWidget(cubit.salesList,cubit),
                    ],
                  ),
                ),
              );

            }));
  }
}

Widget AllDoctorsWidget(List<Sales> listApp, AdminCubit cubit) {


 // if(listApp.isNotEmpty){
    return SingleChildScrollView(
      child: Container(
        height:9130,
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
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  height: 90,
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  child: CircleAvatar(
                                    radius: 80,
                                    backgroundColor:ColorsManager.primary,
                                    child: Image.asset(
                                        'assets/images/logo.png'),
                                  )),

                              const SizedBox(
                                width: 23,
                              ),

                              SizedBox(
                                // width: MediaQuery.of(context).size.width * 0.3,
                                child: Column(
                                  children: [
                                    Custom_Text(
                                      text: listApp[index].email.toString(),
                                      color: ColorsManager.black,
                                      fontSize: 16,
                                      alignment: Alignment.center,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Custom_Text(
                                      text: listApp[index].name.toString(),
                                      color: ColorsManager.black,
                                      fontSize: 16,
                                      alignment: Alignment.center,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Custom_Text(
                                      text: listApp[index].id.toString(),
                                      color: ColorsManager.primary,
                                      fontSize: 16,
                                      alignment: Alignment.center,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 21,
                                        ),
                                        Custom_Text(
                                          text: 'النقاط  '.toString(),
                                          color: Colors.grey,
                                          fontSize: 14,
                                          alignment: Alignment.center,
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Custom_Text(
                                          text: listApp[index].coins.toString(),
                                          color: ColorsManager.primary,
                                          fontSize: 16,
                                          alignment: Alignment.center,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    CustomButton(text:'حذف المندوب', onPressed:(){


                                      cubit.salesDelete( listApp[index].id!);

                                    }, color1:ColorsManager.primary, color2:Colors.white)
                                  ],
                                ),
                              ),


                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  ),

                ),
              );



            }),
      ),
    );
  //}

}
