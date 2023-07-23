
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';


import '../../bloc/main_home_cubit/cubit.dart';
import '../../bloc/main_home_cubit/states.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => JobCubit(),
      child: BlocConsumer<JobCubit,NeuroStates>(
       listener: (context , state){},
        builder:  (context, state){

          var cubit = JobCubit.get(context);



         return Scaffold(

            body: Container(

                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/0.jpg'),
                    fit: BoxFit.cover
                  )
                ),
                child: cubit.screens[cubit.currentIndex]),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,

              selectedFontSize: 16,
              selectedItemColor: HexColor('#8F4A2D').withOpacity(0.7),
              iconSize: 6.h,

              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomNavItems,
              elevation: 10,

            ),



          );
        },
      ),
    );
  }
}
