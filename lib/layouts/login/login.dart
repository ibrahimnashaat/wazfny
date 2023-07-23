import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wazfny/shared/constatnts/constants.dart';
import 'package:wazfny/shared/local/cach_helper/cach_helper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/login_cubit/cubit.dart';
import '../../bloc/login_cubit/states.dart';
import '../../bloc/main_cubit/mian_cubit.dart';
import '../../models/class_user_model.dart';
import '../../shared/components/components.dart';
import '../company/company.dart';
import '../main_home/home.dart';
import '../register/register.dart';




class Login extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (BuildContext context, Object? state) {

            if (state is LoginErrorStates){

              showToast(
                  msg: 'Email or Password not true, please try again.',
                  state: ToastStates.ERORR
              );

              // cachHelper.saveData(key: 'token', value: false);

            }
            else if (state is LoginSuccessStates ) {

              cachHelper.saveData(key: 'uId', value: state.uId).then(
                      (value) {
                       SocialCubit.get(context).getUserData();
                       UserModel? userModel ;

                       final uId = FirebaseAuth.instance.currentUser?.uid;
                       FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
                         userModel=UserModel.fromJson(value.data()!);
                         if(userModel!.type == 'company'){
                           Navigator.pushAndRemoveUntil(context,
                               MaterialPageRoute(builder: (context) => const Company()), (route) => false);
                           cachHelper.saveData(key: 'type', value: 'company');
                         }else{

                           Navigator.pushAndRemoveUntil(context,
                               MaterialPageRoute(builder: (context) => const Home()), (route) => false);
                           cachHelper.saveData(key: 'type', value: 'user');
                         }


                       }).catchError((e){
                         print(e.toString());
                       });






                      }).catchError((error){

                        print(error.toString());

              });
              
                          }

          },
          builder: (BuildContext context, state) {
            return SafeArea(
              child: Container(

                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/0.jpg'),
                        fit: BoxFit.cover
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            SizedBox(
                                height: 24.h,
                                width: 24.h,
                                child: CircleAvatar(
                                  backgroundColor: mainColor,
                                  backgroundImage: const AssetImage('assets/images/logo_with_name.jpeg'),

                                )
                            ),


                            SizedBox(
                              height:6.h,
                            ),
                            textFormFieldWidget(
                                context: context,
                                title: 'Email',
                                controller: emailController,
                                textInputType: TextInputType.emailAddress,
                                emptyTextFormField_ErrorMessage: 'please enter your email',
                                hintText: 'ex@gmail.com',

                            ),

                            SizedBox(
                              height: 20,
                            ),
                            textFormFieldWidget(
                                context: context,
                                title: 'Password',
                                controller: passwordController,
                                textInputType: TextInputType.visiblePassword,
                                emptyTextFormField_ErrorMessage:'enter a valid password' ,
                              isPassword: true,
                              isLogin : true,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 TextButton(onPressed: (){

                                 }, child: Text('Forget password?',
                                   style: TextStyle(
                                       color: Colors.blue[400]
                                   ),
                                 ))
                               ],

                            ),

                            ConditionalBuilder(
                              condition: state != LoginLoadingStates,
                              builder: (BuildContext context) => Container(
                                width: double.infinity,
                                height: 50.0,
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(color: Colors.white24)),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      LoginCubit.get(context).userLogin(
                                        context: context,
                                          email: emailController.text,
                                          password: passwordController.text);

                                    }
                                  },
                                  color: HexColor('#8F4A2D'),
                                  textColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  child:
                                      Text("LOGIN", style: TextStyle(fontSize: 28)),
                                ),
                              ),
                              fallback: (BuildContext context) =>
                                  CircularProgressIndicator(),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('don\'t have an account?',
                                style: TextStyle(
                                  color: Colors.black54
                                ),),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Register()), (route) => false);

                                    }, child: Text('REGISTER',
                                style: TextStyle(
                                  color: Colors.blue[400]
                                ),
                                ))
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );


  }

}
