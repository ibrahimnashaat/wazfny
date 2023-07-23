import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:wazfny/bloc/main_cubit/main_states.dart';
import 'package:wazfny/bloc/main_cubit/mian_cubit.dart';
import 'package:wazfny/shared/constatnts/constants.dart';
import 'package:wazfny/shared/local/cach_helper/cach_helper.dart';
import '../../shared/components/components.dart';
import '../login/login.dart';

class Company extends StatefulWidget {
  const Company({Key? key}) : super(key: key);

  @override
  State<Company> createState() => _CompanyState();
}
int i = 0 ;
class _CompanyState extends State<Company> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,

      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: mainColor,
          statusBarIconBrightness: Brightness.light
        ),
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text('Company',
        style: TextStyle(
          color: Theme.of(context).scaffoldBackgroundColor,
          fontSize: 30,
          fontWeight: FontWeight.w900
        ),
        ),
      ),
      body:Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('you post $i posts for yet',
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 22
                  ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  GestureDetector(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Post(),));
                    },
                    child: Container(
                      width: 28.h,
                      height: 10.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            color: Colors.white.withOpacity(0.4),
                            offset: Offset(3,3)

                          ),
                        ]
                      ),
                      child: Center(
                        child: Text('Create Post',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,

                        ),

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: (){
                          cachHelper.removeData('uId').then((value) async {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Login()), (route) => false,
                            );
                          });
                        },
                        child: Text('Logout',
                      style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                      ),),
                      IconButton(
                        icon: Icon(
                            Icons.logout_outlined,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        onPressed: (){
                          cachHelper.removeData('uId').then((value)  {
                            cachHelper.removeData('type');
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Login()), (route) => false,
                            );
                          });
                        },
                      ),
                    ],
                  ),
                ],

              ),
            ),

          ],
        ),
      ),
    );
  }
}

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var requirementsController = TextEditingController();
  var emailController = TextEditingController();
  String? category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).scaffoldBackgroundColor
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: mainColor,
            statusBarIconBrightness: Brightness.light
        ),
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text('New Post',
          style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
              fontSize: 30,
              fontWeight: FontWeight.w900
          ),
        ),
      ),
      body:BlocProvider(
        create: (BuildContext context) => SocialCubit(),
        child: BlocConsumer<SocialCubit, SocialStutes>(
          listener: (BuildContext context, Object? state) {
       },
          builder: (BuildContext context, state) {

            return Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      if(state is CreatePostLoadingStates )
                      LinearProgressIndicator(),
                      if(state is CreatePostLoadingStates )
                      SizedBox(height: 4.h,),
                      Text('Choose one from this categories :',
                      style: TextStyle(
                        color:Theme.of(context).scaffoldBackgroundColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      SizedBox(height: 2.h,),
                      Column(
                        children: [
                          Row(
                            children: [
                              categoryButton(text: 'Engineering', color:category == 'engineering'?Colors.deepOrange : Colors.black54, context: context,
                                onPressed: () {

                                setState(() {
                                  category = 'engineering';
                                });

                                },
                              ),
                              SizedBox(width: 1.h,),

                              categoryButton(text: 'Accounting', color:category == 'accounting'?Colors.deepOrange : Colors.black54, context: context,
                                onPressed: () {

                                  setState(() {
                                    category = 'accounting';
                                  });

                                },
                              ),
                              SizedBox(width: 1.h,),

                              categoryButton(text: 'Workers', color:category == 'workers'?Colors.deepOrange : Colors.black54, context: context,
                                onPressed: () {

                                  setState(() {
                                    category = 'workers';
                                  });

                                },
                              ),
                              SizedBox(width: 1.h,),


                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            children: [
                              categoryButton(text: 'Medicine', color:category == 'medicine'?Colors.deepOrange : Colors.black54, context: context,
                                onPressed: () {

                                  setState(() {
                                    category = 'medicine';
                                  });

                                },
                              ),
                              SizedBox(width: 1.h,),

                              categoryButton(text: 'Teaching', color:category == 'teaching'?Colors.deepOrange : Colors.black54, context: context,
                                onPressed: () {

                                  setState(() {
                                    category = 'teaching';
                                  });

                                },
                              ),

                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h,),
                      TextFormField(
                        controller: titleController,
                        maxLines: 1,
                        maxLength: 25,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'title not found !';
                          }
                        },

                        decoration: InputDecoration(
                          hintText: 'title',
                          counterStyle: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          hintStyle: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,

                          ),

                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).scaffoldBackgroundColor
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(

                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          errorStyle: TextStyle(
                              color: Colors.grey
                          ),
                        ),
                      ),
                      SizedBox(height: 4.h,),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller:descriptionController,

                        maxLength: 150,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'description not found !';
                          }
                        },

                        decoration: InputDecoration(

                          hintText: 'description',
                          counterStyle: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,

                          ),
                          hintStyle: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,


                          ),
                          enabledBorder: UnderlineInputBorder(

                            borderSide: BorderSide(
                                color: Theme.of(context).scaffoldBackgroundColor
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(

                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          errorStyle: TextStyle(
                              color: Colors.grey
                          ),
                        ),

                      ),
                      SizedBox(height: 4.h,),
                      TextFormField(
                        controller:requirementsController,

                        maxLength: 150,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'requirements not found !';
                          }
                        },

                        decoration: InputDecoration(
                          hintText: 'requirements',
                          counterStyle: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          hintStyle: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,

                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).scaffoldBackgroundColor
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(

                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          errorStyle: TextStyle(
                              color: Colors.grey
                          ),
                        ),
                      ),
                      SizedBox(height: 4.h,),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller:emailController,

                        maxLength: 50,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'e-mail not found !';
                          }
                        },

                        decoration: InputDecoration(
                          hintText: 'e-mail',
                          counterStyle: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          hintStyle: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,

                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).scaffoldBackgroundColor
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(

                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          errorStyle: TextStyle(
                              color: Colors.grey
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black54,
                        ),
                        child: MaterialButton(
                          onPressed: () {

                            SocialCubit.get(context).getPostImage();

                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.upload_outlined,
                              color: Theme.of(context).scaffoldBackgroundColor,
                                size: 30,
                              ),
                              SizedBox(width: 2.h,),
                              Text(
                                  'IMAGE',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 2.h,
                      ),
                      if(SocialCubit.get(context).postImage != null)
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Container(
                            height: 30.h,

                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black12,
                              image: DecorationImage(
                                image:FileImage(SocialCubit.get(context).postImage!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: (){
                                SocialCubit.get(context).removePostImage();
                              },
                              icon:CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.lightBlue.withOpacity(0.7),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              )
                          ),
                        ],
                      ),

                      SizedBox(height: 4.h,),


                     category == null ?Text('Please choose one category first ! ',
                     style: TextStyle(
                       color: Colors.deepOrange,
                       fontSize: 24,
                       fontWeight: FontWeight.bold
                     ) ,
                     ): Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            if(formKey.currentState!.validate()){

                              if(SocialCubit.get(context).postImage == null){
                                SocialCubit.get(context).createPost(
                                    title: titleController.text,
                                    email: emailController.text,
                                    requirements: requirementsController.text,
                                    description: descriptionController.text,
                                    category: category
                                );
                              }else{
                                SocialCubit.get(context).uploadPost(
                                    title: titleController.text,
                                    email: emailController.text,
                                    requirements: requirementsController.text,
                                    description: descriptionController.text,
                                    context: context,
                                    category: category,
                                );
                              }

                              print(titleController.text);
                              print(emailController.text);
                              print(requirementsController.text);
                              print(descriptionController.text);

                              i++;

                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => Company()), (route) => false,
                              );
                            }

                          },
                          child: Text(
                              'POST',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: mainColor,
                            ),
                          ),
                        ),
                      ),
                    ],
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


