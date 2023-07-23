import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wazfny/bloc/main_home_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/home_pages/jobs/jobs.dart';
import '../../modules/home_pages/home_one.dart';
import '../../modules/home_pages/profile.dart';
import '../../modules/home_pages/setting.dart';



class JobCubit extends Cubit<NeuroStates> {
  JobCubit() : super(NeuroInitialState());

  static JobCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;


  List<BottomNavigationBarItem> bottomNavItems =  [

    BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
          color: HexColor('#8F4A2D').withOpacity(0.7),
        ),
        label: 'Home',

    ),
    BottomNavigationBarItem(

        icon: Icon(
          Icons.work_history_outlined,
          color: HexColor('#8F4A2D').withOpacity(0.7),
        ),
        label: 'Jobs '

    ),

    BottomNavigationBarItem(

        icon: Icon(
          Icons.settings_outlined,
          color: HexColor('#8F4A2D').withOpacity(0.7),
        ),
        label: 'Settings'

    ),

    BottomNavigationBarItem(

        icon: Icon(
          Icons.account_circle_outlined,
          color: HexColor('#8F4A2D').withOpacity(0.7),
        ),
        label: 'Profile '

    ),



  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NeuroBottomNavState());
  }

  List<Widget> screens =  [

    const HomeOne(),
    const Jobs(),
    const Setting(),
    const UserProfile(),
  ];




}