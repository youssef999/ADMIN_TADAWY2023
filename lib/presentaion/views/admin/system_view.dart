
import 'package:doctors_app/domain/models/systemBooking.dart';
import 'package:doctors_app/domain/models/user.dart';
import 'package:doctors_app/presentaion/bloc/admin/admin_cubit.dart';
import 'package:doctors_app/presentaion/bloc/admin/admin_state.dart';
import 'package:doctors_app/presentaion/const/app_message.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/views/admin/admin_view.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';



class SystemView extends StatelessWidget {




  SystemView();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context) => AdminCubit()..getAllSystemBooking(),
        child: BlocConsumer<AdminCubit, AdminStates>(

            listener: (context, state) {

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
                      AllDoctorsWidget(cubit.systemList,cubit),
                    ],
                  ),
                ),
              );

            }));
  }
}

Widget AllDoctorsWidget(List<System> listApp, AdminCubit cubit) {


  List<System>list=[];
  if(listApp.isNotEmpty ){
    return SingleChildScrollView(
      child: Container(
        height:120230,
        color: Colors.grey[200],
        //width:double.infinity,
        padding: const EdgeInsets.only(top: 9, left: 7, right: 7),
        child:
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listApp.length,
            itemBuilder: (context, index) {

              list.add(listApp[index]);

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


                              const SizedBox(
                                width: 10,
                              ),

                              SizedBox(
                                // width: MediaQuery.of(context).size.width * 0.3,
                                child: Column(
                                  children: [

                                    Custom_Text(
                                      text: listApp[index].doctor_name.toString(),
                                      color: ColorsManager.black,
                                      fontSize: 16,
                                      alignment: Alignment.center,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),


                                    const SizedBox(height: 15,),
                                    Row(
                                      children: [

                                        const Icon(Icons.phone,color:ColorsManager.primary,size: 33),
                                        const SizedBox(width: 20,),
                                        Custom_Text(text:listApp[index].doctor_phone.toString(),alignment:Alignment.topRight,
                                          fontSize:15,
                                          color:ColorsManager.black,
                                        ),

                                      ],
                                    ),


                                    const SizedBox(height: 10,),
                                    Custom_Text(
                                      text: listApp[index].notes.toString(),
                                      color: ColorsManager.black,
                                      fontSize: 16,
                                      alignment: Alignment.center,
                                    ),



                                    Row(
                                      children: [

                                        const Icon(Icons.price_change,color:ColorsManager.primary,),
                                        const SizedBox(width: 20,),
                                        const Custom_Text(text: 'السعر   -  ',alignment:Alignment.topRight,
                                          fontSize:15,
                                          color:ColorsManager.black,
                                        ),
                                        const SizedBox(width: 10,),
                                        Custom_Text(text: listApp[index].price.toString(),alignment:Alignment.topRight,
                                          fontSize:15,
                                          color:ColorsManager.black,
                                        ),

                                      ],
                                    ),
                                    const SizedBox(height: 25,),





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
                  onTap: () {

                  },
                ),
              );



            }),
      ),
    );
  }

  else{
    return     Container(
      color:Colors.white,
      child:

      Center(
        child:

        Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(
              height:260,
              child:Image.asset("assets/images/data.png"),
            ),
            const SizedBox(height: 11,),
            const Custom_Text(
              text: 'القسم لا يحتوي علي بيانات الان ',
              fontSize: 22,
              color:Colors.black,
              alignment:Alignment.center,
            ),
            const SizedBox(height: 400,),

          ],
        ),
      ),
    );
  }

}
