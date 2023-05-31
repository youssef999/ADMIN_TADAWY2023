



 import 'package:doctors_app/presentaion/bloc/admin/admin_state.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/views/admin/doctors/doctors_view.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../domain/models/cat.dart';
import '../../../bloc/admin/admin_cubit.dart';

class DoctorType extends StatelessWidget {
  const DoctorType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AdminCubit()..getAllCat(),
        child: BlocConsumer<AdminCubit, AdminStates>(

        listener: (context, state) {

    },

    builder: (context, state) {

    AdminCubit cubit = AdminCubit.get(context);
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: 3,
        backgroundColor:ColorsManager.primary,
      ),
      body:ListView(children: [

        SizedBox(height: 20,),
        CatWidget(cubit.catList),
      ],

      )
    );
    }));
  }
}

 Widget CatWidget(List<Cat> catList){

   double height=300;
   if(catList.length>4){
     height=400;
   }

   if(catList.length>5){
     height=500;
   }
   if(catList.length>7){
     height=640;
   }
   if(catList.length>9){
     height=780;
   }

   return   SizedBox(
     height: height,
     child: GridView.builder(
         physics: const NeverScrollableScrollPhysics(),
         gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
             maxCrossAxisExtent: 230,
             childAspectRatio: 3 / 2,
             crossAxisSpacing: 10,
             mainAxisSpacing: 20),
         itemCount: catList.length,


         itemBuilder: (context, index) {
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: InkWell(
               child: Container(
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(25),
                     color: Colors.white70),
                 child: Directionality(
                   textDirection: TextDirection.rtl,
                   child: Column(
                     children: [
                       const SizedBox(
                         height: 12,
                       ),
                       SizedBox(
                           height: 66,
                           width: MediaQuery.of(context).size.width * 0.2,
                           child: Image.network(
                               catList[index].image.toString())),
                       const SizedBox(
                         height: 3,
                       ),

                       SizedBox(
                         //  width: MediaQuery.of(context).size.width * 0.2,
                         child: Column(
                           children: [
                             Custom_Text(
                               text: catList[index].name.toString(),
                               color: ColorsManager.black,
                               fontSize: 15,
                               alignment: Alignment.center,
                             ),
                             const SizedBox(
                               height: 5,
                             ),

                           ],
                         ),
                       ),



                     ],
                   ),
                 ),
               ),
               onTap: () {

                 Get.to(DoctorsView(cat: catList[index].cat2,));
                 //
                 // print(AllDoctorsView(catList[index].cat2));
                 // Get.to(AllDoctorsView(catList[index].cat2));

               },
             ),
           );
         }),
   );

 }