import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constatnts/constants.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LocaleText('Language'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 20.h,
              height: 30.h,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: mainColor.withOpacity(0.7)
                    ),
                    child: ListTile(
                      title: Text('English',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Theme.of(context).scaffoldBackgroundColor
                      ),
                      ),
                      onTap: (){
                        LocaleNotifier.of(context)?.change('en');
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: mainColor.withOpacity(0.7)
                    ),
                    child: ListTile(
                      title: Text('العربية',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Theme.of(context).scaffoldBackgroundColor
                        ),
                      ),
                      onTap: (){
                        LocaleNotifier.of(context)?.change('ar');
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
