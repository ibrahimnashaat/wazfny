import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wazfny/modules/home_pages/jobs/medicine/medicine.dart';
import 'package:wazfny/modules/home_pages/jobs/software_engineer/software_engineer.dart';
import 'package:wazfny/modules/home_pages/jobs/teaching/teaching.dart';
import 'package:wazfny/modules/home_pages/jobs/workers/workers.dart';
import 'package:wazfny/shared/components/components.dart';
import 'package:wazfny/shared/constatnts/constants.dart';


import 'accounting/accounting.dart';

class Jobs extends StatefulWidget {
  const Jobs({Key? key}) : super(key: key);

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> {


  List<Map> job = [
    {
      'image' : 'https://th.bing.com/th/id/R.c874f790732c11a44ee33ccae4ad83ba?rik=dDmvoeccJwBm9g&pid=ImgRaw&r=0',
      'title' : 'Engineering',
      'body' : 'In this section you will find jobs related to  engineering, and all available jobs',
       Widget  : SoftwareEngineer(),
    },//0
    {
      'image' : 'https://th.bing.com/th/id/R.5f31f504b5e9230ebb559acd853627c6?rik=GxAwPyCb017uRQ&riu=http%3a%2f%2fdpic.tiankong.com%2fl6%2fex%2fQJ6232696946.jpg&ehk=ZoghGcIuMBDxuYrpbDBNttiZTwh26s%2f0fI%2f6VaY5j5o%3d&risl=&pid=ImgRaw&r=0',
      'title' : 'Medicine',
      'body' : 'In this section you will find jobs related to medicine, and all available jobs',
      Widget  : Medicine(),
    },//1
    {
      'image' : 'https://th.bing.com/th/id/R.99d213bd58125e0c71ba803a8b97d38f?rik=%2brQEZjHpm0pNIg&pid=ImgRaw&r=0',
      'title' : 'Accounting',
      'body' : 'In this section you will find jobs related to accounting, and all available jobs',
      Widget  : Accounting(),
    },//2
    {
      'image' : 'https://th.bing.com/th/id/OIP.6SuLlcwqKvxb4QUPkCuN6QHaE8?pid=ImgDet&rs=1',
      'title' : 'Teaching',
      'body' : 'In this section you will find jobs related to teaching, and all available jobs',
      Widget  : Teaching(),
    },//3
    {
      'image' : 'https://th.bing.com/th/id/R.9c83a6e229b54ef846ad35102d27559b?rik=%2fi3qXf5ZPUHOJQ&pid=ImgRaw&r=0',
      'title' : 'workers',
      'body' : 'In this section you will find jobs related to workers, and all available jobs',
      Widget : Workers(),
    },
  ];

  List<Map> searchForJob = [];

  @override
  void initState() {
    // TODO: implement initState
    searchForJob = job;
    super.initState();
  }

  void runSearch (String resultKeywords) {

    List<Map> results = [];
    
    if(resultKeywords.isEmpty){
      
      results = job;
      
    }else{
      results = job.where((user) =>
          user["title"].toLowerCase().contains(resultKeywords.toLowerCase()))
          .toList();
    }
setState(() {
  searchForJob = results;
});

  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(

            children: [
              SizedBox(
                height: 4.h,
              ),
              TextFormField(
                onChanged: (value)=> runSearch(value),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(

                      ),

                    ),
                    enabledBorder: OutlineInputBorder(

                      borderSide: BorderSide(
                        color: Colors.grey,


                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,


                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: mainColor,
                        width: 2,

                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: mainColor,
                    ),
                    hintText: 'Search'


                ),


              ),
              SizedBox(
                height: 2.h,
              ),

              Expanded(
                flex: 11,
                child: ListView.separated(
                    itemBuilder: (context,index)=>jobElementWidget(
                        image: searchForJob[index]['image'],
                        title:searchForJob[index]['title'] ,
                        body: searchForJob[index]['body'],
                      context: context,
                      related_page: searchForJob[index][Widget ],

                    ),
                    separatorBuilder:(context,index)=> Container(
                      height: 4.0.h,
                    ),
                    itemCount: searchForJob.length
                ),
              ),
            ],
          ),
        ),
    );
  }
}
