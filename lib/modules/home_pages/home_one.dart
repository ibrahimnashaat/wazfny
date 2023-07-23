import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:sizer/sizer.dart';
import 'package:wazfny/shared/constatnts/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeOne extends StatelessWidget {
  const HomeOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                  decoration: BoxDecoration (
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.network('https://i.pinimg.com/originals/fe/4a/64/fe4a641684f886f0a89e7f935d9884b0.png',)),
              SizedBox(
                  height: 8.h,),


              LocaleText("welcome",  style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: mainColor
              ),),
              LocaleText('description',  style: TextStyle(
                  fontSize:16,
                  fontWeight: FontWeight.w300,
                  color: mainColor
              ),),
              SizedBox(
                height: 4.h,
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                color: mainColor,
                child: ListTile(

                  title: Center(
                    child: Text(
                      'Create CV',
                      style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,

                      ),
                    ),
                  ),
                  onTap: () => launch('https://www.youtube.com/watch?v=MOYjpdd3hIQ&t=4s'),
                ),
              ),

              SizedBox(
                height: 2.h,
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                color: mainColor,
                child: ListTile(

                  title: Center(
                    child: Text(
                      'Learn English',
                      style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,

                      ),
                    ),
                  ),
                  onTap: () => launch('https://www.youtube.com/watch?v=77IK9T45kiU'),
                ),
              ),



            ],
          ),
        ),
      ),
    ));
  }
}
