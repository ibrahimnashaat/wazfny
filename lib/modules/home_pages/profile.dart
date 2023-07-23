import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wazfny/bloc/main_cubit/main_states.dart';
import 'package:wazfny/bloc/main_cubit/mian_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:wazfny/shared/constatnts/constants.dart';
import 'package:wazfny/shared/local/cach_helper/cach_helper.dart';


class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var typeController = TextEditingController();
  var birthDayController = TextEditingController();
  var jopQualificationController = TextEditingController();

  var score = cachHelper.getData(key: 'score');

  bool updatedCover = true;
  bool updatedImage = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStutes>(
      listener: (context, state) {},
      builder: (context, state) {

        final model = SocialCubit.get(context).userModel;


        var image = model?.image;
        image1 = image;

        var cover = model?.cover;
        nameController.text = model?.name??'loading..';
        bioController.text = model?.bio??'loading..';
        typeController.text = model?.type??'loading..';
        phoneController.text = model?.phone??'loading..';
        emailController.text = model?.email??'loading..';
        birthDayController.text = model?.birthDay??'loading..';
        jopQualificationController.text = model?.jopQualification??'loading..';
        var profileImage = SocialCubit.get(context).ProfileImage;
        var profileCover = SocialCubit.get(context).CoverImage;

        var assetImage = AssetImage('$image');
        var networkImage = NetworkImage('$image');








        return Scaffold(
          appBar: AppBar(

            actions: [
              TextButton(
                onPressed: () {
                  SocialCubit.get(
                      context).updateUser(
                    name: nameController.text,
                    phone: phoneController.text,
                    email: emailController.text,
                    bio: bioController.text,
                    birthDay: birthDayController.text,
                    jopQualification: jopQualificationController.text,
                    type: typeController.text

                  );
                },
                child: SizedBox(
                  child: Text(
                    'Update',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: mainColor.withOpacity(0.7)
                    ),
                  ),
                  width:22.w,
                ),

              )

            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 36.h,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 30.h,

                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  color: Colors.black12,
                                  image: DecorationImage(
                                    image: profileCover == null ?
                                    cover == 'assets/images/logo.png' ?
                                    AssetImage('$cover') as ImageProvider :
                                    NetworkImage('$cover') :
                                    FileImage(profileCover) ,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: (){
                                    updatedCover = false;
                                    SocialCubit.get(context).getCoverImage();
                                  },
                                  icon:CircleAvatar(
                                    radius: 28,
                                    backgroundColor: Colors.lightBlue.withOpacity(0.7),
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,

                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 56,
                                backgroundColor: Colors.black12,
                                backgroundImage:profileImage == null ?
                                image == 'assets/images/logo_with_name.jpeg'?
                                AssetImage('$image') as ImageProvider :
                                NetworkImage('$image') :
                                FileImage(profileImage)  ,
                              ),
                            ),
                            IconButton(
                                onPressed: (){
                                  updatedImage = false;
                                  SocialCubit.get(context).getProfileImage();
                                },
                                icon:CircleAvatar(
                                  radius: 28,
                                  backgroundColor: Colors.lightBlue.withOpacity(0.7),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                  ),
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 2.h,
                  ),

                  Text(
                    '${model?.name??'loading..'}',
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),


                  SizedBox(
                    height: 10.h,
                  ),

                  if (SocialCubit.get(context).CoverImage != null || SocialCubit.get(context).ProfileImage != null )
                    Row(
                      children: [
                        if(SocialCubit.get(context).CoverImage != null)

                          Expanded(
                            child:  Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: updatedCover==false ? OutlinedButton(
                                    onPressed: (){
                                      SocialCubit.get(context).upLoudProfilCover(
                                          name: nameController.text,
                                          phone: phoneController.text,
                                          email: emailController.text,
                                          bio: bioController.text,
                                          birthDay: birthDayController.text,
                                          jopQualification: jopQualificationController.text,
                                          type: typeController.text
                                      );

                                      setState(() {
                                        updatedCover = true;

                                      });

                                    },
                                    child: Text('Update Cover',
                                      style: TextStyle(
                                          fontSize: 18.sp
                                      ),
                                    ),
                                    style: OutlinedButton.styleFrom(

                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    ),
                                  ) : Container(),
                                ),
                                if(state is SocialUserUpdateLoadingStates)
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                if(state is SocialUserUpdateLoadingStates)
                                  LinearProgressIndicator(),
                              ],
                            ),
                          ),



                        SizedBox(
                          width: 2.w,
                        ),
                        if(SocialCubit.get(context).ProfileImage != null)

                          Expanded(
                            child:  Column(
                              children: [
                                updatedImage == false ? OutlinedButton(
                                  onPressed: (){
                                    SocialCubit.get(context).upLoudProfilImage(
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        email: emailController.text,
                                        bio: bioController.text,
                                        birthDay: birthDayController.text,
                                        jopQualification: jopQualificationController.text,
                                        type: typeController.text);
                                    setState(() {
                                      updatedImage = true;
                                    });
                                  },
                                  child: Text('Update Image',
                                    style: TextStyle(
                                        fontSize: 18.sp
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: Size(100, 50),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                  ),
                                ) : Container(),
                                if(state is SocialUserUpdateLoadingStates)
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                if(state is SocialUserUpdateLoadingStates)
                                  LinearProgressIndicator(),
                              ],
                            ),
                          ),


                      ],
                    ),
                  if (SocialCubit.get(context).CoverImage != null || SocialCubit.get(context).ProfileImage != null )
                    SizedBox(
                      height: 6.h,
                    ),

                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: mainColor.withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              'Your Score is : ${score ?? 0} / 100',
                              style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w600,
                                  color: mainColor
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 6.h,
                  ),

                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: Text('User Name'),
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    controller: jopQualificationController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your jop qualification';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: Text('Jop Qualification'),
                      prefixIcon: Icon(
                        Icons.workspace_premium,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    enabled: false,
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your phone';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: Text('phone'),
                      prefixIcon: Icon(
                        Icons.phone,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    controller: emailController,
                    enabled: false,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: Text('e-mail'),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
