import 'package:sizer/sizer.dart';
import 'package:wazfny/layouts/company/company.dart';
import 'package:wazfny/shared/components/components.dart';
import 'package:wazfny/shared/local/cach_helper/cach_helper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../bloc/main_cubit/mian_cubit.dart';
import '../../bloc/register_cubit/cubit.dart';
import '../../bloc/register_cubit/states.dart';
import '../../shared/constatnts/constants.dart';
import '../login/login.dart';
import '../main_home/home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var firstnameController = TextEditingController();

  var lastnameController = TextEditingController();



  var phoneController = TextEditingController();

  var birthDayController = TextEditingController();

  var jobQualificationController = TextEditingController();

  var emailController = TextEditingController();



  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  var genderController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  final database = FirebaseDatabase.instance.ref();


  String type = '';



  // late String birthDateInString;
  //
  // late DateTime birthDate;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (BuildContext context, Object? state) {
            if (state is RegisterCreateUserSuccessStates) {
              cachHelper.saveData(key: 'uId', value: state.uId);

              if(type == 'company'){
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => const Company()), (route) => false);
                cachHelper.saveData(key: 'type', value: 'company');
              }else{

                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => const Home()), (route) => false);
                cachHelper.saveData(key: 'type', value: 'user');
              }

              typeInter = type;



              SocialCubit.get(context).getUserData();





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
                          mainAxisAlignment: MainAxisAlignment.center,
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

                            Row(
                              children: [
                                Expanded(child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: type=='user' ? Colors.lightBlue : grey,
                                  ),
                                  child: MaterialButton(

                                    onPressed: (){
                                      setState(() {

                                        type ='user';


                                      });
                                    },
                                    child: Text(
                                        'User',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: type =='user' ? Theme.of(context).scaffoldBackgroundColor:mainColor,
                                      ),
                                    ),

                                  ),
                                ),),
                                SizedBox(width: 6.h,),
                                Expanded(child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:type == 'company' ? Colors.lightBlue : grey  ,
                                  ),
                                  child: MaterialButton(

                                    onPressed: (){
                                      setState(() {

                                        type = 'company';


                                      });
                                    },
                                    child: Text(
                                      'Company',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: type=='company' ? Theme.of(context).scaffoldBackgroundColor : mainColor ,
                                      ),
                                    ),

                                  ),
                                ),),
                              ],
                            ),

                            SizedBox(
                              height:3.h,
                            ),

                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                textFormFieldWidget(

                                    context: context,

                                    title: 'First Name',
                                    controller: firstnameController,
                                    width: MediaQuery.of(context).size.width*0.4,
                                    textInputType: TextInputType.text,
                                    emptyTextFormField_ErrorMessage: 'empty field !',

                                ),
                                const Spacer(),
                                textFormFieldWidget(
                                    context: context,
                                    title: 'Last Name',
                                    controller: lastnameController,
                                    width: MediaQuery.of(context).size.width*0.4,
                                    textInputType: TextInputType.text,
                                    emptyTextFormField_ErrorMessage: 'empty field !'
                                ),
                              ],
                            ),
                            SizedBox(
                              height:6.h,
                            ),
                            type == 'company' ?Container() : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                textFormFieldWidget(

                                  context: context,

                                  title: 'Phone Number',
                                  controller: phoneController,
                                  width: MediaQuery.of(context).size.width*0.4,
                                  textInputType: TextInputType.phone,
                                  emptyTextFormField_ErrorMessage: 'empty field !',

                                ),
                                const Spacer(),
                                textFormFieldWidget(
                                    context: context,
                                    title: 'Birth Day',
                                    controller: birthDayController,
                                    width: MediaQuery.of(context).size.width*0.4,
                                    textInputType: TextInputType.datetime,
                                  emptyTextFormField_ErrorMessage: 'empty field !',
                                    hintText:'Day - Month - Year',
                                ),
                              ],
                            ),
                            type == 'company' ?Container() :SizedBox(
                              height:6.h,
                            ),
                            type == 'company' ?Container() : textFormFieldWidget(

                              context: context,

                              title: 'Job Qualification',
                              controller: jobQualificationController,
                              textInputType: TextInputType.text,
                              emptyTextFormField_ErrorMessage: 'empty field !',
                              hintText: 'Software Engineer',

                            ),
                            type == 'company' ?Container() : SizedBox(
                              height:6.h,
                            ),

                            textFormFieldWidget(

                              context: context,

                              title: 'Email',
                              controller: emailController,
                              textInputType: TextInputType.text,
                              emptyTextFormField_ErrorMessage: 'enter invalid e-mail',
                              hintText: 'ex@gamil.com',

                            ),
                            SizedBox(
                              height:6.h,
                            ),
                            textFormFieldWidget(

                              context: context,

                              title: 'Password',
                              controller: passwordController,
                              textInputType: TextInputType.visiblePassword,
                              emptyTextFormField_ErrorMessage: 'enter invalid password',
                              isPassword: true,

                            ),
                            SizedBox(
                              height:6.h,
                            ),
                            textFormFieldWidget(

                              context: context,

                              title: 'Confirm Password',
                              controller:confirmPasswordController,
                              textInputType: TextInputType.visiblePassword,
                              emptyTextFormField_ErrorMessage: 'enter invalid password',
                              isPassword: true,

                            ),
                            const SizedBox(
                              height: 28,
                            ),


                            type == '' ?SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text('Please choose the type of Customer first !',

                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: mainColor
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                            ):ConditionalBuilder(
                              condition: state != RegisterLoadingStates,
                              builder: (BuildContext context) => SizedBox(
                                width: double.infinity,
                                height: 50.0,
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: const BorderSide(color: Colors.white24)),
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {

                                      if(passwordController.text == confirmPasswordController.text) {
                                        RegisterCubit.get(context).userRegister(

                                          name: '${firstnameController.text} ${lastnameController.text}',
                                          email: emailController.text,
                                          phone: type == 'company' ?'' : phoneController.text,
                                          password: passwordController.text,
                                          birthDay: type == 'company' ?'' : birthDayController.text,
                                          jopQualification: type == 'company' ?'' : jobQualificationController.text,
                                          context: context,
                                          type: type
                                        );
                                      }
                                      else {
                                        showToast(
                                            msg: 'Password not confirmed true !',
                                            state: ToastStates.ERORR
                                        );
                                      }






                                    }
                                  },
                                  color: HexColor('#8F4A2D'),
                                  textColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  child: const Text("REGISTER",
                                      style: TextStyle(fontSize: 22)),
                                ),
                              ),
                              fallback: (BuildContext context) =>
                                  const CircularProgressIndicator(),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'have an account?',
                                  style: TextStyle(color: Colors.black54),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Login()),
                                          (route) => false);
                                    },
                                    child:  Text('LOGIN',
                                      style: TextStyle(
                                          color: Colors.blue[400],
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
