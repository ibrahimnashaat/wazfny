import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';




dynamic uId =FirebaseAuth.instance.currentUser?.uid;
Color mainColor = HexColor('#8F4A2D') ;
Color? grey = Colors.grey[300];

String? image1 ;

String? typeInter;

