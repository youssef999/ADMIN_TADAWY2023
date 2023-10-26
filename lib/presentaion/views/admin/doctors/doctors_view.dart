
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
import '../../../widgets/Custom_button.dart';
import '../../User/doctors/doctor-details_view.dart';


class DoctorsView extends StatelessWidget {


String cat;

DoctorsView({required this.cat});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context) => AdminCubit()..getAllDoctors(cat),
        child: BlocConsumer<AdminCubit, AdminStates>(

            listener: (context, state) {
              if(state is  BestDoctorsSuccessState){
                appMessage(text: 'تم الاضافة لافضل الاطباء بنجاح');
                Get.offAll(AdminView());
              }
              if(state is DeleteDoctorsSuccessState){
                appMessage(text: 'تم الحذف بنجاح');
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
                      AllDoctorsWidget(cubit.doctorList,cubit,cat),
                    ],
                  ),
                ),
              );

            }));
  }
}

Widget AllDoctorsWidget(List<DoctorModel> listApp, AdminCubit cubit,String cat) {


  List<DoctorModel>list=[];
  if(listApp.isNotEmpty ){
    return SingleChildScrollView(
      child: Container(
        height:11202301,
        color: Colors.grey[200],
        //width:double.infinity,
        padding: const EdgeInsets.only(top: 9, left: 7, right: 7),
        child:
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listApp.length,
            itemBuilder: (context, index) {

                list.add(listApp[index]);

                return 
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 20,),
                            SizedBox(
                               height: 100,
                              //width: 230,
                              //height: 300,
                              child:Image.network( listApp[index].doctor_image.toString()),
                            ),
                            const SizedBox(height: 30,),
                            Column(
                              children: [
                                Custom_Text(
                                  text: listApp[index].doctor_name.toString(),
                                  color:ColorsManager.black,
                                  fontSize: 20,
                                  alignment:Alignment.topRight,
                                ),
                                const SizedBox(height: 20,),
                                Custom_Text(
                                  alignment:Alignment.topRight,
                                  text: listApp[index].doctor_cat.toString(),
                                  color:ColorsManager.primary,
                                  fontSize: 17,
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Divider(height: 3,color:Colors.black),
                            ),

                            Row(
                              children: [

                                Icon(Icons.phone,color:ColorsManager.primary,),
                                const SizedBox(width: 60,),
                                Column(
                                  children: [
                                    // Custom_Text(text:doctorData.doctor_phone.toString(),alignment:Alignment.topRight,
                                    //   fontSize:15,
                                    //   color:ColorsManager.black,
                                    // ),
                                    Custom_Text(text: 'رقم  ارضي ',alignment: Alignment.topRight),
                                    SizedBox(height: 10,),
                                    Custom_Text(text:  listApp[index].clink_phone1.toString(),alignment:Alignment.center,
                                      fontSize:15,
                                      color:ColorsManager.black,
                                    ),
                                    SizedBox(height: 10,),
                                    Custom_Text(text: 'رقم  موبيل ',alignment: Alignment.topRight),
                                    SizedBox(height: 10,),
                                    Custom_Text(text:   listApp[index].clink_phone2.toString(),alignment:Alignment.center,
                                      fontSize:15,
                                      color:ColorsManager.black,
                                    ),
                                    SizedBox(height: 10,),
                                    Custom_Text(text: 'رقم  واتس ',alignment: Alignment.topRight),
                                    SizedBox(height: 10,),
                                    Custom_Text(text:   listApp[index].clink_phone3.toString(),alignment:Alignment.center,
                                      fontSize:15,
                                      color:ColorsManager.black,
                                    ),
                                    SizedBox(height: 6,),
                                  ],
                                )


                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Divider(height: 3,color:Colors.black),
                            ),


                            // (doctorData.address.toString()!='')?

                            Row(
                              children: [
                                Icon(Icons.place,color:ColorsManager.primary,),
                                const SizedBox(width: 20,),

                                ( listApp[index].address!='')?
                                Container(
                                  width: 170,
                                  child: Custom_Text(text: listApp[index].address.toString(),alignment:Alignment.topRight,
                                    fontSize:13,
                                    color:ColorsManager.black,
                                  ),
                                ):SizedBox(),
                                const SizedBox(width: 10,),
                                Container(
                                  child: Column(
                                    children: [
                                      Custom_Text(text:  listApp[index].time.toString(),alignment:Alignment.topRight,
                                        fontSize:15,
                                        color:ColorsManager.black,
                                      ),
                                      SizedBox(height: 10,),
                                      Icon(Icons.arrow_circle_down_outlined,color: ColorsManager.primary,size: 37,),
                                      SizedBox(height: 10,),
                                      Custom_Text(text:  listApp[index].time1x.toString(),alignment:Alignment.topRight,
                                        fontSize:15,
                                        color:ColorsManager.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15,),
                            Custom_Text(text: '- - - - - - - - - - - - - - - - -',fontSize: 21,color:ColorsManager.primary,alignment: Alignment.center,),

                            const SizedBox(height: 15,),
                            InkWell(
                              child: Row(
                                children:  [

                                  Icon(Icons.maps_ugc_sharp,color:ColorsManager.primary,),
                                  SizedBox(width: 20,),
                                  Custom_Text(text: 'موقع الطبيب  علي الخريطة    -  ',alignment:Alignment.topRight,
                                    fontSize:15,
                                    color:Colors.grey,
                                  ),
                                  SizedBox(width: 10,),

                                ],
                              ),
                              onTap:(){

                                print( listApp[index].lat);
                              //  url( listApp[index].lat!, listApp[index].lng!);

                              },
                            ),
                            SizedBox(height: 20,),

                            ( listApp[index].address2.toString()!='')?

                            Row(
                              children: [

                                Icon(Icons.place,color:ColorsManager.primary,),
                                const SizedBox(width: 20,),
                                Container(
                                  width: 170,
                                  child: Custom_Text(text: listApp[index].address2.toString(),alignment:Alignment.topRight,
                                    fontSize:15,
                                    color:ColorsManager.black,
                                  ),
                                ),
                                const SizedBox(width: 50,),
                                Column(
                                  children: [
                                    Custom_Text(text:  listApp[index].time2.toString(),alignment:Alignment.topRight,
                                      fontSize:15,
                                      color:ColorsManager.black,
                                    ),
                                    Icon(Icons.arrow_circle_down_outlined,color: ColorsManager.primary,size: 37,),
                                    SizedBox(height: 10,),
                                    Custom_Text(text:  listApp[index].time2x.toString(),alignment:Alignment.topRight,
                                      fontSize:15,
                                      color:ColorsManager.black,
                                    ),
                                  ],
                                ),

                              ],
                            ) :const SizedBox(
                              height: 1,
                            ),


                            const SizedBox(height: 6,),
                            if( listApp[index].location2!='')
                              InkWell(
                                child: Row(
                                  children:  [
                                    SizedBox(width: 60,),
                                    Icon(Icons.maps_ugc_sharp,color:ColorsManager.primary,),
                                    SizedBox(width: 20,),
                                    Custom_Text(text:  listApp[index].location2! ,alignment:Alignment.center,
                                      fontSize:15,
                                      color:Colors.grey,
                                    ),
                                    SizedBox(width: 10,),

                                  ],
                                ),
                                onTap:(){
                                  // print( listApp[index]);
                                  // url( listApp[index].lat!, listApp[index].lng!);
                                },
                              ),

                            const SizedBox(height: 15,),
                            ( listApp[index].address3.toString()!='')?

                            Row(
                              children: [

                                Icon(Icons.place,color:ColorsManager.primary,),
                                const SizedBox(width: 20,),
                                Custom_Text(text:  listApp[index].address3.toString(),alignment:Alignment.topRight,
                                  fontSize:15,
                                  color:ColorsManager.black,
                                ),
                                const SizedBox(width: 10,),
                                Custom_Text(text:  listApp[index].time2.toString(),alignment:Alignment.topRight,
                                  fontSize:15,
                                  color:ColorsManager.black,
                                ),
                              ],
                            ) :const SizedBox(),

                            const SizedBox(height: 15,),
                            const SizedBox(height: 25,),
                            Row(
                              children: [

                                Icon(Icons.price_change,color:ColorsManager.primary,),
                                const SizedBox(width: 20,),
                                const Custom_Text(text: 'السعر   -  ',alignment:Alignment.topRight,
                                  fontSize:15,
                                  color:ColorsManager.black,
                                ),
                                const SizedBox(width: 10,),
                                Custom_Text(text:  listApp[index].price.toString(),alignment:Alignment.topRight,
                                  fontSize:15,
                                  color:ColorsManager.black,
                                ),

                              ],
                            ),
                            const SizedBox(height: 25,),



                            const Padding(
                              padding: EdgeInsets.only(left:36.0,right:36.0),
                              child: Divider(
                                height:6,
                                color:Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              children: [

                                Container(
                                  child: Image.asset('assets/images/profile.png'),
                                ),
                                const SizedBox(width: 20,),
                                const Custom_Text(text: ' معلوماتي  ',alignment:Alignment.topRight,
                                  fontSize:24,
                                  color:ColorsManager.black,
                                ),

                                const SizedBox(width: 10,),



                              ],
                            ),
                            const SizedBox(height: 15,),




                            Custom_Text(text:  listApp[index].doctor_info.toString(),alignment:Alignment.center,
                              fontSize:15,
                              color:ColorsManager.black,
                            ),
                            const SizedBox(height: 22,),
                            ( listApp[index].image1!='' &&  listApp[index].image1!=null)?
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                  width: 70,
                                  child:Image.network( listApp[index].image1!,)
                              ),
                            ):SizedBox(height: 1,),
                            const SizedBox(height: 22,),
                            Row(
                              children: [

                                Container(
                                  child: Image.asset('assets/images/grade.png'),
                                ),
                                const SizedBox(width: 20,),
                                const Custom_Text(text: ' الدرجة العلمية ',alignment:Alignment.topRight,
                                  fontSize:24,
                                  color:ColorsManager.black,
                                ),
                                const SizedBox(width: 10,),



                              ],
                            ),

                            const SizedBox(height: 12,),

                            Custom_Text(text:  listApp[index].doctor_degree.toString(),alignment:Alignment.center,
                              fontSize:15,
                              color:ColorsManager.black,
                            ),

                            const SizedBox(height: 20,),
                            ( listApp[index].image2!=''&& listApp[index].image2!=null)?
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                  width: 70,
                                  //  height: 100,
                                  child:Image.network( listApp[index].image2!,
                                    fit:BoxFit.fill,
                                  )
                              ),
                            ):SizedBox(height: 1,),
                            const SizedBox(height: 20,),



                            ( listApp[index].image2.toString()!='')?
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                //   width: 100,
                                height: 140,
                                child: Image.network( listApp[index].image2.toString(),fit:BoxFit.fill),
                              ),
                            ):SizedBox(),
                            const SizedBox(height: 12,),
                            Custom_Text(text:  listApp[index].doctor_degree.toString(),alignment:Alignment.center,
                              fontSize:15,
                              color:ColorsManager.black,
                            ),
                            const SizedBox(height: 22,),
                            (  listApp[index].clink_name2!.isNotEmpty)?
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Divider(height: 2,thickness: 2,color:Colors.grey,),
                                ),
                                SizedBox(height: 10,),
                                Custom_Text(text: 'مكان عملك الاخر',alignment:Alignment.center,
                                  fontSize:22,
                                  color:ColorsManager.black,
                                ),
                                SizedBox(height: 10,),

                                Custom_Text(text:  listApp[index].clink_name2.toString(),alignment:Alignment.center,
                                  fontSize:15,
                                  color:ColorsManager.black,
                                ),
                                SizedBox(height: 10,),
                                Custom_Text(text:  listApp[index].address2.toString(),alignment:Alignment.center,
                                  fontSize:15,
                                  color:ColorsManager.black,
                                ),
                                SizedBox(height: 10,),
                                Custom_Text(text: 'رقم  ارضي ',alignment: Alignment.topRight),
                                //  SizedBox(height: 6,),
                                Custom_Text(text:  listApp[index].clink_phone4.toString(),alignment:Alignment.center,
                                  fontSize:15,
                                  color:ColorsManager.black,
                                ),
                                SizedBox(height: 6,),
                                Custom_Text(text: 'رقم  موبيل ',alignment: Alignment.topRight),
                                //  SizedBox(height: 6,),
                                Custom_Text(text:  listApp[index].clink_phone5.toString(),alignment:Alignment.center,
                                  fontSize:15,
                                  color:ColorsManager.black,
                                ),
                                SizedBox(height: 6,),
                                Custom_Text(text: 'رقم  واتس ',alignment: Alignment.topRight),
                                //  SizedBox(height: 6,),
                                Custom_Text(text: listApp[index].clink_phone6.toString(),alignment:Alignment.center,
                                  fontSize:15,
                                  color:ColorsManager.black,
                                ),
                                SizedBox(height: 6,),
                                Custom_Text(text: 'المنصب ',alignment: Alignment.topRight),
                                //   SizedBox(height: 6,),
                                Custom_Text(text:  listApp[index].clink_p2.toString(),alignment:Alignment.center,
                                  fontSize:15,
                                  color:ColorsManager.black,
                                ),
                              ],
                            ):SizedBox(height: 1,),

                            ( listApp[index].clink_name3!.isNotEmpty)?
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Divider(height: 2,thickness: 2,color:Colors.grey,),
                                ),
                                SizedBox(height: 10,),
                                Custom_Text(text: 'مكان عملك الاخر',alignment:Alignment.center,
                                  fontSize:22,
                                  color:ColorsManager.black,
                                ),
                                SizedBox(height: 10,),

                                Custom_Text(text:  listApp[index].clink_name3.toString(),alignment:Alignment.center,
                                  fontSize:15,
                                  color:ColorsManager.black,
                                ),
                                SizedBox(height: 10,),
                                Custom_Text(text: listApp[index].address3.toString(),alignment:Alignment.center,
                                  fontSize:15,
                                  color:ColorsManager.black,
                                ),
                                SizedBox(height: 10,),
                                Custom_Text(text: 'رقم  ارضي ',alignment: Alignment.topRight),
                                //  SizedBox(height: 6,),
                                Custom_Text(text: listApp[index].clink_phone7.toString(),alignment:Alignment.center,
                                  fontSize:15,
                                  color:ColorsManager.black,
                                ),
                                SizedBox(height: 6,),
                                Custom_Text(text: 'رقم  موبيل ',alignment: Alignment.topRight),
                                //  SizedBox(height: 6,),
                                Custom_Text(text:  listApp[index].clink_phone8.toString(),alignment:Alignment.center,
                                  fontSize:15,
                                  color:ColorsManager.black,
                                ),
                                SizedBox(height: 6,),
                                Custom_Text(text: 'رقم  واتس ',alignment: Alignment.topRight),
                                //  SizedBox(height: 6,),
                                Custom_Text(text: listApp[index].clink_phone9.toString(),alignment:Alignment.center,
                                  fontSize:15,
                                  color:ColorsManager.black,
                                ),
                                SizedBox(height: 6,),
                                Custom_Text(text: 'المنصب ',alignment: Alignment.topRight),
                                //   SizedBox(height: 6,),
                                Custom_Text(text: listApp[index].clink_p3.toString(),alignment:Alignment.center,
                                  fontSize:15,
                                  color:ColorsManager.black,
                                ),

                              ],
                            ):SizedBox(height: 1,),
                            const SizedBox(height: 20,),
                                                  (listApp[index].rate!<=3)?
                                                  Center(
                                                    child: CustomButton(
                                                      text: "اضف لافضل الاطباء ",
                                                      color1:ColorsManager.primary,
                                                      color2:Colors.white,
                                                      onPressed:(){

                                                        cubit. addToTopDoctor(listApp[index].doctor_id.toString());

                                                      },
                                                    ),
                                                  ):Custom_Text(text: 'هذا من افضل الاطباء',fontSize:21,color:ColorsManager.primary,alignment:Alignment.center),
                                                  const SizedBox(height: 20,),
                                                  Center(
                                                    child: CustomButton(
                                                      text: "حذف  ",
                                                      color1:ColorsManager.primary,
                                                      color2:Colors.white,
                                                      onPressed:(){

                                                        cubit.deleteDoctor(listApp[index].doctor_id.toString());

                                                      },
                                                    ),
                                                  ),


                            SizedBox(height: 12,),


                          ],
                        ),
                      ),
                    ),
                  );
                //   Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: InkWell(
                //     child: Container(
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(15),
                //           color: Colors.white),
                //       child: Directionality(
                //         textDirection: TextDirection.rtl,
                //         child: Column(
                //           children: [
                //             const SizedBox(
                //               height: 12,
                //             ),
                //             SizedBox(
                //                 height: 90,
                //                 width: MediaQuery.of(context).size.width * 0.30,
                //                 child: Image.network(
                //                     listApp[index].doctor_image.toString())),
                //             Row(
                //               children: [
                //
                //
                //                 const SizedBox(
                //                   width: 10,
                //                 ),
                //
                //                 SizedBox(
                //                   // width: MediaQuery.of(context).size.width * 0.3,
                //                   child: Column(
                //                     children: [
                //
                //
                //                       const SizedBox(
                //                         height: 10,
                //                       ),
                //                       Row(
                //                         children: [
                //                           Custom_Text(
                //                             text: listApp[index].doctor_name.toString(),
                //                             color:ColorsManager.black,
                //                             fontSize: 20,
                //                             alignment:Alignment.topRight,
                //                           ),
                //                           const SizedBox(width: 40,),
                //                           Custom_Text(
                //                             alignment:Alignment.topRight,
                //                             text: listApp[index].doctor_cat.toString(),
                //                             color:ColorsManager.primary,
                //                             fontSize: 20,
                //                           ),
                //                         ],
                //                       ),
                //
                //                       const SizedBox(height: 15,),
                //                       Row(
                //                         children: [
                //
                //                           const Icon(Icons.phone,color:ColorsManager.primary,),
                //                           const SizedBox(width: 20,),
                //                           Custom_Text(text:listApp[index].doctor_phone.toString(),alignment:Alignment.topRight,
                //                             fontSize:15,
                //                             color:ColorsManager.black,
                //                           ),
                //
                //                         ],
                //                       ),
                //                       const SizedBox(height: 15,),
                //                       (listApp[index].address.toString()!='')?
                //                       Row(
                //                         children: [
                //
                //                           const Icon(Icons.place,color:ColorsManager.primary,),
                //                           const SizedBox(width: 20,),
                //                           Container(
                //                             width: 200,
                //                             child: Custom_Text(text: listApp[index].address.toString(),alignment:Alignment.topRight,
                //                               fontSize:14,
                //                               color:ColorsManager.black,
                //                             ),
                //                           ),
                //
                //
                //                         ],
                //                       ) :const SizedBox(),
                //                       const SizedBox(height: 15,),
                //                       const SizedBox(width: 10,),
                //                       Custom_Text(text: listApp[index].time.toString(),alignment:Alignment.topRight,
                //                         fontSize:15,
                //                         color:ColorsManager.primary,
                //                       ),
                //                       SizedBox(height: 15,),
                //                       InkWell(
                //                         child: Row(
                //                           children: const [
                //                             SizedBox(width: 60,),
                //                             Icon(Icons.maps_ugc_sharp,color:ColorsManager.primary,),
                //                             SizedBox(width: 20,),
                //                             Custom_Text(text: 'موقع الطبيب  علي الخريطة    -  ',alignment:Alignment.center,
                //                               fontSize:15,
                //                               color:Colors.grey,
                //                             ),
                //                             SizedBox(width: 10,),
                //
                //                           ],
                //                         ),
                //                         onTap:(){
                //                           url(listApp[index].location.toString());
                //                         },
                //                       ),
                //                       SizedBox(height: 10,),
                //                       Custom_Text(text: listApp[index].doctor_phone1.toString(),alignment:Alignment.center,
                //                         fontSize:15,
                //                         color:Colors.grey,
                //                       ),
                //
                //
                //                       const SizedBox(height: 10,),
                //                       (listApp[index].address2.toString()!='')?
                //
                //                       Row(
                //                         children: [
                //
                //                           const Icon(Icons.place,color:ColorsManager.primary,),
                //                           const SizedBox(width: 20,),
                //                           Custom_Text(text: listApp[index].address2.toString(),alignment:Alignment.topRight,
                //                             fontSize:15,
                //                             color:ColorsManager.black,
                //                           ),
                //                           const SizedBox(width: 10,),
                //                           Custom_Text(text:listApp[index].time2.toString(),alignment:Alignment.topRight,
                //                             fontSize:15,
                //                             color:ColorsManager.black,
                //                           ),
                //
                //                         ],
                //                       ) :const SizedBox(),
                //
                //
                //                       const SizedBox(height: 15,),
                //                       if(listApp[index].location2!='')
                //                         InkWell(
                //                           child: Row(
                //                             children: const [
                //                               SizedBox(width: 60,),
                //                               Icon(Icons.maps_ugc_sharp,color:ColorsManager.primary,),
                //                               SizedBox(width: 20,),
                //                               Custom_Text(text: 'موقع الطبيب  علي الخريطة    -  ',alignment:Alignment.center,
                //                                 fontSize:15,
                //                                 color:Colors.grey,
                //                               ),
                //                               SizedBox(width: 10,),
                //
                //                             ],
                //                           ),
                //                           onTap:(){
                //                             url(listApp[index].location2.toString());
                //                           },
                //                         ),
                //                       SizedBox(height: 10,),
                //                       Custom_Text(text:listApp[index].doctor_phone2.toString(),alignment:Alignment.center,
                //                         fontSize:15,
                //                         color:Colors.grey,
                //                       ),
                //
                //                       const SizedBox(height: 15,),
                //                       (listApp[index].address3.toString()!='')?
                //
                //                       Row(
                //                         children: [
                //
                //                           const Icon(Icons.place,color:ColorsManager.primary,),
                //                           const SizedBox(width: 20,),
                //                           Custom_Text(text:listApp[index].address3.toString(),alignment:Alignment.topRight,
                //                             fontSize:15,
                //                             color:ColorsManager.black,
                //                           ),
                //                           const SizedBox(width: 10,),
                //                           Custom_Text(text: listApp[index].time2.toString(),alignment:Alignment.topRight,
                //                             fontSize:15,
                //                             color:ColorsManager.black,
                //                           ),
                //                         ],
                //                       ) :const SizedBox(),
                //
                //                       const SizedBox(height: 15,),
                //                       if(listApp[index].location3!='')
                //                         InkWell(
                //                           child: Row(
                //                             children: const [
                //                               SizedBox(width: 60,),
                //                               Icon(Icons.maps_ugc_sharp,color:ColorsManager.primary,),
                //                               SizedBox(width: 20,),
                //                               Custom_Text(text: 'موقع الطبيب  علي الخريطة    -  ',alignment:Alignment.center,
                //                                 fontSize:15,
                //                                 color:Colors.grey,
                //                               ),
                //                               SizedBox(width: 10,),
                //
                //                             ],
                //                           ),
                //                           onTap:(){
                //                             url(listApp[index].location3.toString());
                //                           },
                //                         ),
                //                       SizedBox(height: 10,),
                //                       Custom_Text(text: listApp[index].doctor_phone3.toString(),alignment:Alignment.center,
                //                         fontSize:15,
                //                         color:Colors.grey,
                //                       ),
                //                       const SizedBox(height: 25,),
                //                       Row(
                //                         children: [
                //
                //                           const Icon(Icons.price_change,color:ColorsManager.primary,),
                //                           const SizedBox(width: 20,),
                //                           const Custom_Text(text: 'السعر   -  ',alignment:Alignment.topRight,
                //                             fontSize:15,
                //                             color:ColorsManager.black,
                //                           ),
                //                           const SizedBox(width: 10,),
                //                           Custom_Text(text: listApp[index].price.toString(),alignment:Alignment.topRight,
                //                             fontSize:15,
                //                             color:ColorsManager.black,
                //                           ),
                //
                //                         ],
                //                       ),
                //                       const SizedBox(height: 25,),
                //
                //
                //
                //                       const Padding(
                //                         padding: EdgeInsets.only(left:36.0,right:36.0),
                //                         child: Divider(
                //                           height:6,
                //                           color:Colors.black,
                //                         ),
                //                       ),
                //                       const SizedBox(height: 15,),
                //                       Row(
                //                         children: [
                //
                //                           Container(
                //                             child: Image.asset('assets/images/profile.png'),
                //                           ),
                //                           const SizedBox(width: 20,),
                //                           const Custom_Text(text: ' معلوماتي  ',alignment:Alignment.topRight,
                //                             fontSize:24,
                //                             color:ColorsManager.black,
                //                           ),
                //                           const SizedBox(width: 10,),
                //
                //
                //                         ],
                //                       ),
                //                       const SizedBox(height: 15,),
                //                       Custom_Text(text: listApp[index].doctor_info.toString(),alignment:Alignment.center,
                //                         fontSize:15,
                //                         color:ColorsManager.black,
                //                       ),
                //                       const SizedBox(height: 22,),
                //                       Row(
                //                         children: [
                //
                //                           Container(
                //                             child: Image.asset('assets/images/grade.png'),
                //                           ),
                //                           const SizedBox(width: 20,),
                //                           const Custom_Text(text: ' الدرجة العلمية ',alignment:Alignment.topRight,
                //                             fontSize:24,
                //                             color:ColorsManager.black,
                //                           ),
                //                           const SizedBox(width: 10,),
                //
                //
                //                         ],
                //                       ),
                //
                //                       const SizedBox(height: 12,),
                //                       Custom_Text(text:listApp[index].doctor_degree.toString(),alignment:Alignment.center,
                //                         fontSize:15,
                //                         color:ColorsManager.black,
                //                       ),
                //                       const SizedBox(height: 22,),
                //                       (  listApp[index].clink_name2!.isNotEmpty)?
                //                       Column(
                //                         children: [
                //                           Padding(
                //                             padding: const EdgeInsets.all(16.0),
                //                             child: Divider(height: 2,thickness: 2,color:Colors.grey,),
                //                           ),
                //                           SizedBox(height: 10,),
                //                           Custom_Text(text: 'مكان عملك الاخر',alignment:Alignment.center,
                //                             fontSize:22,
                //                             color:ColorsManager.black,
                //                           ),
                //                           SizedBox(height: 10,),
                //
                //                           Custom_Text(text:  listApp[index].clink_name2.toString(),alignment:Alignment.center,
                //                             fontSize:15,
                //                             color:ColorsManager.black,
                //                           ),
                //                           SizedBox(height: 10,),
                //                           Custom_Text(text: listApp[index].address2.toString(),alignment:Alignment.center,
                //                             fontSize:15,
                //                             color:ColorsManager.black,
                //                           ),
                //                           SizedBox(height: 10,),
                //                           Custom_Text(text: 'رقم  ارضي ',alignment: Alignment.topRight),
                //                           //  SizedBox(height: 6,),
                //                           Custom_Text(text:  listApp[index].clink_phone4.toString(),alignment:Alignment.center,
                //                             fontSize:15,
                //                             color:ColorsManager.black,
                //                           ),
                //                           SizedBox(height: 6,),
                //                           Custom_Text(text: 'رقم  موبيل ',alignment: Alignment.topRight),
                //                           //  SizedBox(height: 6,),
                //                           Custom_Text(text:  listApp[index].clink_phone5.toString(),alignment:Alignment.center,
                //                             fontSize:15,
                //                             color:ColorsManager.black,
                //                           ),
                //                           SizedBox(height: 6,),
                //                           Custom_Text(text: 'رقم  واتس ',alignment: Alignment.topRight),
                //                           //  SizedBox(height: 6,),
                //                           Custom_Text(text:  listApp[index].clink_phone6.toString(),alignment:Alignment.center,
                //                             fontSize:15,
                //                             color:ColorsManager.black,
                //                           ),
                //                           SizedBox(height: 6,),
                //                           Custom_Text(text: 'المنصب ',alignment: Alignment.topRight),
                //                           //   SizedBox(height: 6,),
                //                           Custom_Text(text: listApp[index].clink_p2.toString(),alignment:Alignment.center,
                //                             fontSize:15,
                //                             color:ColorsManager.black,
                //                           ),
                //                         ],
                //                       ):SizedBox(height: 1,),
                //
                //                       ( listApp[index].clink_name3!.isNotEmpty)?
                //                       Column(
                //                         children: [
                //                           Padding(
                //                             padding: const EdgeInsets.all(16.0),
                //                             child: Divider(height: 2,thickness: 2,color:Colors.grey,),
                //                           ),
                //                           SizedBox(height: 10,),
                //                           Custom_Text(text: 'مكان عملك الاخر',alignment:Alignment.center,
                //                             fontSize:22,
                //                             color:ColorsManager.black,
                //                           ),
                //                           SizedBox(height: 10,),
                //
                //                           Custom_Text(text:  listApp[index].clink_name3.toString(),alignment:Alignment.center,
                //                             fontSize:15,
                //                             color:ColorsManager.black,
                //                           ),
                //                           SizedBox(height: 10,),
                //                           Custom_Text(text: listApp[index].address3.toString(),alignment:Alignment.center,
                //                             fontSize:15,
                //                             color:ColorsManager.black,
                //                           ),
                //                           SizedBox(height: 10,),
                //                           Custom_Text(text: 'رقم  ارضي ',alignment: Alignment.topRight),
                //                           //  SizedBox(height: 6,),
                //                           Custom_Text(text:  listApp[index].clink_phone7.toString(),alignment:Alignment.center,
                //                             fontSize:15,
                //                             color:ColorsManager.black,
                //                           ),
                //                           SizedBox(height: 6,),
                //                           Custom_Text(text: 'رقم  موبيل ',alignment: Alignment.topRight),
                //                           //  SizedBox(height: 6,),
                //                           Custom_Text(text:  listApp[index].clink_phone8.toString(),alignment:Alignment.center,
                //                             fontSize:15,
                //                             color:ColorsManager.black,
                //                           ),
                //                           SizedBox(height: 6,),
                //                           Custom_Text(text: 'رقم  واتس ',alignment: Alignment.topRight),
                //                           //  SizedBox(height: 6,),
                //                           Custom_Text(text: listApp[index].clink_phone9.toString(),alignment:Alignment.center,
                //                             fontSize:15,
                //                             color:ColorsManager.black,
                //                           ),
                //                           SizedBox(height: 6,),
                //                           Custom_Text(text: 'المنصب ',alignment: Alignment.topRight),
                //                           //   SizedBox(height: 6,),
                //                           Custom_Text(text: listApp[index].clink_p3.toString(),alignment:Alignment.center,
                //                             fontSize:15,
                //                             color:ColorsManager.black,
                //                           ),
                //
                //                         ],
                //                       ):SizedBox(height: 1,),
                //                       const SizedBox(height: 20,),
                //                       (listApp[index].rate!<=3)?
                //                       Center(
                //                         child: CustomButton(
                //                           text: "اضف لافضل الاطباء ",
                //                           color1:ColorsManager.primary,
                //                           color2:Colors.white,
                //                           onPressed:(){
                //
                //                             cubit. addToTopDoctor(listApp[index].doctor_id.toString());
                //
                //                           },
                //                         ),
                //                       ):Custom_Text(text: 'هذا من افضل الاطباء',fontSize:21,color:ColorsManager.primary,alignment:Alignment.center),
                //                       const SizedBox(height: 20,),
                //                       Center(
                //                         child: CustomButton(
                //                           text: "حذف  ",
                //                           color1:ColorsManager.primary,
                //                           color2:Colors.white,
                //                           onPressed:(){
                //
                //                             cubit.deleteDoctor(listApp[index].doctor_id.toString());
                //
                //                           },
                //                         ),
                //                       )
                //                     ],
                //                   ),
                //                 ),
                //
                //
                //               ],
                //             ),
                //             const SizedBox(
                //               height: 12,
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     onTap: () {
                //       Get.to(DoctorDetailsView(listApp[index]));
                //     },
                //   ),
                // );



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
