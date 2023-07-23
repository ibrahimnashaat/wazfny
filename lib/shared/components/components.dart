

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/login_cubit/cubit.dart';
import '../../bloc/register_cubit/cubit.dart';
import '../../layouts/quiz/screens/main_menu.dart';
import '../constatnts/constants.dart';
import 'package:url_launcher/url_launcher.dart';



void showToast({required String msg, required ToastStates state})=>Fluttertoast.showToast(
msg: msg,
toastLength: Toast.LENGTH_LONG,
gravity: ToastGravity.BOTTOM,
timeInSecForIosWeb: 5,
backgroundColor: chooseToastColor(state),
textColor: Colors.white,
fontSize: 16.0);

enum ToastStates{ERORR, SUCCESS, WARNING}

Color chooseToastColor(ToastStates test){
  Color color;
  switch(test){

    case ToastStates.SUCCESS:
      color = Colors.green;
      break;

    case ToastStates.ERORR:
      color = Colors.red;
      break;

    case ToastStates.WARNING:
      color = Colors.orange;
      break;



  }

  return color;
}




Widget textFormFieldWidget ({
  required BuildContext context,
  required String title,
  double width = double.infinity,
  required TextEditingController controller,
  String hintText = '',
  required TextInputType textInputType,
  required String emptyTextFormField_ErrorMessage ,

  bool isPassword = false ,
  bool isLogin = false,


}

    ){

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(title,
        style: TextStyle(

            color: Colors.black54,
            fontSize: 14,
            fontWeight: FontWeight.w500,

        ),
      ),
      SizedBox(
        height:1.5.h,
      ),
      SizedBox(
        // the width of the text field
        width:width,


        child: TextFormField(

          //text field controller
          controller: controller,
          obscureText:isPassword ? isLogin ?LoginCubit.get(context).isNotVisible : RegisterCubit.get(context).isNotVisible  : false,
          validator: (value) {
            if (value!.isEmpty) {
              return emptyTextFormField_ErrorMessage;
            }
          },

          keyboardType: textInputType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),

  suffixIcon: isPassword ? IconButton(
  icon: isLogin ?   Icon(LoginCubit.get(context).suffix) : Icon(RegisterCubit.get(context).suffix) ,
  onPressed: () {
  isLogin ?   LoginCubit.get(context).changePasswordVisability() : RegisterCubit.get(context).changePasswordVisability() ;
  },
  ) : null,




            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(),
            ),
            hintText:hintText,



            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,


              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,


              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: HexColor('#8F4A2D'),
                width: 2,

              ),
            ),

          ),
        ),
      ),
    ],
  );

}

//
// UserModel? model;
// void firebaseAuth (){
//   final uId = FirebaseAuth.instance.currentUser?.uid;
//
//   FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
//     model = UserModel.fromJson(value.data()!);
//   });
//
// }


Widget jobElementWidget (
{
  required String image,
  required String title,
  required String body,
  required BuildContext context,
  required Widget related_page,
}
    ){
  return GestureDetector(
    onTap: (){

      Navigator.push(context, MaterialPageRoute(
          builder: (context)=>related_page,
      ),);

    },
    child: Container(
      height: 30.0.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: grey,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 30.0.h,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(image),
                  )
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,

            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 28,
                left: 6,
                bottom: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: mainColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,

                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Text(body,
                      style: TextStyle(
                        fontSize: 15,

                        color: mainColor.withOpacity(0.5),
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,

                    ),
                  ),
                ],
              ),
            ),),
        ],
      ),

    ),
  );
}



Widget workID (
{
  required String title,
  required String image,
  required String description,
  required String requirements,
  required BuildContext context,
  required String email,

}
    ) => Container(
  height: 48.h,
  width: double.infinity,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    color: grey,
  ),
  child: Column(
    children: [
      Expanded(
        flex: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text('$title',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w900,
                        color: mainColor.withOpacity(0.7),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  title.toLowerCase() =='web' ? Expanded(

                    child: RawMaterialButton(
                      onPressed: () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainMenu(),
                            ));
                      },
                      shape: const StadiumBorder(),
                      fillColor: mainColor,
                      child: const Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                        child: Text(
                          "Exam",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ) :Container(),
                ],
              ),

              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            height: 34.h,
                            width: 24.h,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: mainColor

                            ),
                          ),
                          Container(
                            height: 32.h,
                            width: 22.h,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: image == '' ? const AssetImage('assets/images/logo_with_name.jpeg')as ImageProvider:NetworkImage('$image'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),

                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(

                            left: 10.0,

                        ),
                        child: SizedBox(
                          width: 10.h,
                          height: 30.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(

                                children: [
                                  Icon(Icons.description_outlined,
                                    color: mainColor.withOpacity(0.7),
                                  ),
                                  SizedBox(
                                    width: 1.0.h,
                                  ),
                                  Expanded(
                                    child: Text('Description',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: mainColor.withOpacity(0.7)
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 2.h,),
                              Expanded(
                                child: Text('$description',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: mainColor.withOpacity(0.5)
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 2.h,),
                              Row(

                                children: [
                                  Icon(Icons.refresh,
                                    color: mainColor.withOpacity(0.7),
                                  ),
                                  SizedBox(
                                    width: 1.0.h,
                                  ),
                                  Expanded(
                                    child: Text('Requirements',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: mainColor.withOpacity(0.7)
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 2.h,),
                              Expanded(
                                child: Text('$requirements',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: mainColor.withOpacity(0.5)
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 8
          ),
          child: MaterialButton(

            color: mainColor.withOpacity(0.8),


            onPressed: () {
              launch('mailto:$email?subject=Hello&body=Thank you for this opportunity');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.upload_outlined,
                  color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
                  size: 28,
                ),
                Text('Upload Your CV',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7)
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ],
  ),
);


Widget categoryButton(
{
  required String text,
  required Color color ,
  required BuildContext context,
  required Function() onPressed,
}
    ){
  return Expanded(
  child: Container(

  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: color
  ),
  child: MaterialButton(
  onPressed: onPressed,
  child: Text(text,
  style: TextStyle(
  color: Theme.of(context).scaffoldBackgroundColor,
  fontSize: 12,
  fontWeight: FontWeight.bold
  ),
  ),
  ),
  ),
  );
}