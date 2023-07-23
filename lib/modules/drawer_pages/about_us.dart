import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:wazfny/shared/constatnts/constants.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
              left: 20,
              right: 20
          ),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

                width: double.infinity,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: mainColor,
                ),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        top: 10

                      ),
                      child: LocaleText('about',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).scaffoldBackgroundColor,

                      ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(20.0),
                      child: LocaleText('information',
                       style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),

                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(child: LocaleText('team',style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,
                color: mainColor,),)),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor:mainColor,
                        radius: 56,

                        backgroundImage: AssetImage('assets/images/p1.jpeg',),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                          'Seif Hossam',
                      style: TextStyle(
                        fontSize: 20,
                        color:mainColor,
                      ),
                      ),
                    ],
                  ),
                  Spacer(),

                  Column(
                    children: [
                      Container(
                        width: 18.h,
                        height: 18.h,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          image: DecorationImage(
                            image: AssetImage('assets/images/p2.jpeg'),
                          ),



                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Donia Ayman',
                        style: TextStyle(
                            color:mainColor,
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),

                ],
              ),
              SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: mainColor,
                        radius: 56,
                        backgroundImage: AssetImage('assets/images/p3.jpeg'),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Dina Ashraf',
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),

                  Spacer(),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: mainColor,
                        radius: 56,
                        backgroundImage: AssetImage('assets/images/p4.jpeg'),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Rokaya Ibrahim',
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: mainColor,
                        radius: 56,
                        backgroundImage: AssetImage('assets/images/p5.jpeg'),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Khaled Talat',
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),

                  Spacer(),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: mainColor,
                        radius: 56,
                        backgroundImage: AssetImage('assets/images/p6.jpeg'),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Ahmed Mohamed',
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 18.h,
                        height: 18.h,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          image: DecorationImage(
                            image: AssetImage('assets/images/p7.jpeg'),
                          ),



                        ),
                      ),


                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Saed Mohamed',
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),

                  Spacer(),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: mainColor,
                        radius: 56,
                        backgroundImage: AssetImage('assets/images/p8.jpeg'),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Mohamed Ali',
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor:mainColor,
                        radius: 56,
                        backgroundImage: AssetImage('assets/images/p9.jpeg'),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Adam Mohamed',
                        style: TextStyle(
                          fontSize: 20,
                          color: mainColor,
                        ),
                      ),
                    ],
                  ),


                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
