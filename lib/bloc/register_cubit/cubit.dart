import 'package:wazfny/bloc/register_cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/class_user_model.dart';
import '../../models/login_model/login_model.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialStates());

  static RegisterCubit get(context) => BlocProvider.of(context);

  ShopLoginModel? loginModel;






   void createUser (
      {
        required String name,
        required String email,
        required String phone,
        required String birthDay,
        required String jopQualification,
        required String uId,
        required String type,

      }
      ){

      UserModel model = UserModel(
      name : name,
      email:email,
      phone:phone,
      uId:uId,
      isEmailVerified: false,
      image : 'assets/images/logo_with_name.jpeg',
      cover: 'assets/images/logo.png',
      bio: 'write your bio ...',
      birthDay: birthDay,
      jopQualification: jopQualification,
        type: type,


    );

    FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap()).then((value) {

      print('شغال');
      emit(RegisterCreateUserSuccessStates(uId: uId));
    }).catchError((error){
      print ('مش شغال');
      emit(RegisterCreateUserErrorStates(error.toString()));
    });

  }


  void userRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String birthDay,
    required String jopQualification,
    required context,
    required String type,


  }) async {
    emit(RegisterLoadingStates());

    showDialog(
      context: context,
      builder:(context){
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

   await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,).then((value){
          print(value.user!.email);
          print(value.user!.uid);



          Navigator.of(context).pop();

         createUser(
            name : name,
            email:email,
            phone:phone,
            uId:value.user!.uid,
           birthDay: birthDay,
           jopQualification: jopQualification,
           type: type,


          );
         emit(RegisterSuccessStates());

    }).catchError((error){
          emit(RegisterErrorStates(error.toString()));
    });
  }



  IconData suffix = Icons.visibility_off_outlined;
  bool isNotVisible = true;

  void changePasswordVisability() {
    isNotVisible = !isNotVisible;

    suffix = isNotVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(PasswordStates());
  }
}
