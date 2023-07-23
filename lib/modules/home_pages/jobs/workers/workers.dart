import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../shared/components/components.dart';
import '../../../../shared/constatnts/constants.dart';

class Workers extends StatefulWidget {
  const Workers({Key? key}) : super(key: key);

  @override
  State<Workers> createState() => _WorkersState();
}

class _WorkersState extends State<Workers> {


  String name ='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value){
                  setState(() {
                    name=value;
                  });
                },
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

                  hintText: 'Search',



                ),



              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(

                child:StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('workers').snapshots(),
                  builder:(context,snapshots){
                    return (snapshots.connectionState == ConnectionState.waiting)?Center(child: CircularProgressIndicator(),):ListView.separated(
                      itemBuilder: (context,index){
                        var data = snapshots.data!.docs[index].data() as Map<String,dynamic>;
                        if(name.isEmpty){
                          return workID(
                              title: data['title'],
                              image: data['image']?? '',
                              description: data['description'],
                              requirements: data['requirements'],
                              email : data['email'],
                              context: context);
                        }
                        if(data['title'].toString().toLowerCase().startsWith(name.toLowerCase())){
                          return workID(
                              title: data['title'],
                              image: data['image']?? '',
                              description: data['description'],
                              requirements: data['requirements'],
                              email : data['email'],
                              context: context);
                        }
                        return Container();
                      },
                      separatorBuilder: (context, index) => Container(height: 4.h,),
                      itemCount: snapshots.data!.docs.length,
                    );
                  } ,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
