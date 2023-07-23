import 'package:wazfny/shared/local/cach_helper/cach_helper.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../login/login.dart';

class Swiping {
  late final String image;
  late final String text1;
  late final String text2;

  Swiping({required this.image, required this.text1, required this.text2});
}

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<Swiping> swipingScreens = [
    Swiping(
        image: 'assets/images/search.png',
        text1: 'Job Finder',
        text2:
            'The app will help you find suitable jobs for you, also you will find comfort in your searches on our app.'),
    Swiping(
        image: 'assets/images/interview.png',
        text1: 'Job Interview',
        text2:
            'Our application will help you find companies, and conduct job interviews with managers.'),
    Swiping(
        image: 'assets/images/work.png',
        text1: 'Finally Work !',
        text2:
            'Finally ! Our application will help you get a job and work, whether remotely or at the company\'s headquarters.'),
  ];

  var pageController = PageController();
  bool isLast = false ;

  void submit(){
    cachHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if(value != null){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Login()), (route) => false);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
            width: 24.w,
            child: TextButton(onPressed: submit,
              child:  Text('SKIP',style: TextStyle(
                  color: HexColor('#D7986F'),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: 2
              ),),),
          ),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
        left: 20.0,
          right: 20.0,
          bottom: 20.0,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(


            children: [

              Expanded(
                child: PageView.builder(
                  onPageChanged: (index){

                    if (index == swipingScreens.length-1){

                      setState ((){
                        isLast =true ;
                      });


                    }else {

                      setState ((){
                        isLast =false ;
                      });
                    }

                  },
                  physics: BouncingScrollPhysics(),
                  controller: pageController,
                  itemBuilder: (context, index) =>
                      onBoarding(swipingScreens[index]),
                  itemCount: swipingScreens.length,
                ),
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: swipingScreens.length,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.black26,
                      activeDotColor: HexColor('#D7986F'),
                      dotHeight: 1.6.h,
                      dotWidth: 3.w,
                      spacing: 5,
                      expansionFactor: 3,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 10.h,
                    child: FloatingActionButton(
                      onPressed: () {

                        if (isLast){

                          submit();


                        }else{
                          pageController.nextPage(
                              duration: Duration(
                                milliseconds: 750,
                              ),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }


                      },
                      backgroundColor: HexColor('#D7986F'),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 3.h,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget onBoarding(Swiping wid) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SingleChildScrollView(
            child: SizedBox(
              height: 50.h,
              child: Image.asset(
                '${wid.image}',

              ),
            ),
          ),

          Text(
            '${wid.text1}',
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent[100],
                letterSpacing: 2),
          ),
          SizedBox(
            height: 4.h,
          ),
          SizedBox(
            width: 80.w,
            child: Text(
              '${wid.text2}',
              //      'I have developed meaningful relationships with individuals of all ages, including seven-year-old Hillary. Many of my mentees come from disadvantaged backgrounds',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: HexColor('#D7986F'),
              ),
            ),
          ),

        ],
      );
}
