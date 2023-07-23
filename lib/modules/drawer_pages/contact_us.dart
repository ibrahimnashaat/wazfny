
import 'package:flutter/material.dart';

import 'package:wazfny/shared/constatnts/constants.dart';

import '../../shared/constatnts/contactus.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);


  @override
  State<Contact> createState() => _ContactUsState();
}

class _ContactUsState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: ContactUsBottomAppBar(
        companyName: 'Wazfny',
        textColor:mainColor.withOpacity(0.5),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        email: 'Wazfnyb27@gmail.com',

      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ContactUs(

          cardColor: mainColor.withOpacity(0.3),
          textColor: Theme.of(context).scaffoldBackgroundColor,
          logo: AssetImage('assets/images/logo.png',),
          email: 'Wazfnyb27@gmail.com',
          companyName: 'WAZFNY',
          companyColor: mainColor,
          dividerThickness: 2,

          tagLine: 'Job Group',
          taglineColor: mainColor.withOpacity(0.5),
),

    );
  }
}
