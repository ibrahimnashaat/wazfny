import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wazfny/shared/constatnts/constants.dart';
import 'package:wazfny/shared/local/cach_helper/cach_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'bloc/main_cubit/mian_cubit.dart';
import 'layouts/company/company.dart';
import 'layouts/login/login.dart';
import 'layouts/main_home/home.dart';
import 'layouts/on_boarding/on_boarding.dart';
import 'package:sizer/sizer.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await cachHelper.init();
  await Locales.init(['en','ar']);

  Widget widget ;

   var onBoarding = cachHelper.getData(key: 'onBoarding');
   var type = cachHelper.getData(key: 'type');

   //var token = cachHelper.getData(key: 'token');
  // print(onBoarding);


   uId = cachHelper.getData(key: 'uId');

  if (uId != null){

      if(type == 'user'){
            widget = Home();
      }else{
        widget=Company();
      }

  }else{
    if(onBoarding != null){
    widget = Login();}
    else{
      widget = OnBoarding();
    }
  }
  // if (onBoarding != null){
  //
  //   if (token != null){
  //     widget = Home();
  //   }else{
  //     widget = Login();
  //   }
  //
  // }else{
  //   widget = OnBoarding();
  // }

  runApp( MyApp(
      startWidget: widget
  ));
}

class MyApp extends StatefulWidget {
  MyApp({required this.startWidget});
  final Widget startWidget;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late final bool onBoarding;

  final String title = 'Url Launcher';

  @override
  void initState(){
    requestPermission();
    super.initState();
  }
  void requestPermission()async{
    var status = await Permission.storage.status;
    if(!status.isGranted){
      await Permission.storage.request();
    }
    var status1 = await Permission.manageExternalStorage.status;
    if(!status1.isGranted){
      await Permission.manageExternalStorage.request();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return //MultiBlocProvider(
      // providers: [
      //   BlocProvider(
      //     create: (context) => SocialCubit()..getUserData(),
      //   ),
      //
      // ],
      BlocProvider(
        create:(context) => SocialCubit()..getUserData() ,
        child: LocaleBuilder(
          builder:(local)=> MaterialApp(
              localizationsDelegates: Locales.delegates,
              supportedLocales: Locales.supportedLocales,
              locale: local,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                bottomNavigationBarTheme: BottomNavigationBarThemeData(

                  selectedItemColor: HexColor('#8F4A2D'),
                  selectedIconTheme: IconThemeData(
                    color:  HexColor('#8F4A2D'),

                  ),


                ),
                appBarTheme: AppBarTheme(

                  iconTheme: IconThemeData(
                      color: mainColor.withOpacity(0.7),
                      size: 30
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 0.0,

                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Theme.of(context).scaffoldBackgroundColor,
                    statusBarIconBrightness: Brightness.dark,

                  ),



                ),





              ),


              home:Sizer(
                builder: (context, orientation, deviceType) =>ScreenUtilInit(
                  designSize: const Size(428.0, 926.0),
                  builder: (BuildContext context,child) =>widget.startWidget,
                ),
                // MainPage(title: title),
                //startWidget
              )),
        ),
      );


    // );
  }
}


