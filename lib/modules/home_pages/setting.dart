import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:sizer/sizer.dart';
import 'package:wazfny/modules/drawer_pages/about_us.dart';
import 'package:wazfny/modules/drawer_pages/language.dart';
import 'package:wazfny/shared/constatnts/constants.dart';
import 'package:wazfny/shared/local/cach_helper/cach_helper.dart';
import '../../layouts/login/login.dart';
import '../drawer_pages/contact_us.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 68.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.grey[300]
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LocaleText('settings',

                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 40,
                        color: mainColor,
                      ),
                    ),

                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=>const AboutUs(),
                              )
                              );
                            },
                            icon: Icon(Icons.info_outline,
                            color: mainColor,
                              size: 30,
                            ),
                        ),
                        TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context)=>const AboutUs(),
                              )
                              );
                            },
                            child: LocaleText('about',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18
                            ),
                            ),


                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>const Contact(),
                            )
                            );
                          },
                          icon: Icon(Icons.contact_phone_outlined,
                            color: mainColor,
                            size: 30,
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>const Contact(),
                            )
                            );
                          },
                          child: LocaleText('contact',
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 18
                            ),
                          ),


                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.notifications_none_outlined,
                            color: mainColor,
                            size: 30,
                          ),
                        ),
                        TextButton(
                          onPressed: (){},
                          child: LocaleText('notification',
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 18
                            ),
                          ),


                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Language()));
                          },
                          icon: Icon(Icons.language_outlined,
                            color: mainColor,
                            size: 30,
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Language()));
                          },
                          child: LocaleText('language',
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 18
                            ),
                          ),


                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.logout_outlined,
                            color: mainColor,
                            size: 30,
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            cachHelper.removeData('uId').then((value) async {

                              cachHelper.removeData('type');

                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context)=>Login()), (route) =>false,
                              );



                              });
                          },
                          child: LocaleText('logout',
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 18
                            ),
                          ),


                        ),
                      ],
                    ),
                  ],
                ),
              ),

            ),
          ),
        ),
    );
  }
}
