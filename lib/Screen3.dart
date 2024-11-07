import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled6/home.dart';
import 'package:untitled6/phone.dart';
import 'package:untitled6/toastmsg.dart';

import 'forget.dart';
class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 428.w,
              height: 159.h,
              color: Colors.black,
              child: Center(child: Padding(
                padding: EdgeInsets.only(top: 20.0.h),
                child: Text('FIRE BASE',style:
                TextStyle(fontSize: 50.sp,color: Colors.white,fontWeight:FontWeight.w800 ,
                  fontFamily: 'Inter',),),
              )),
            ),
            Container(
              width: 428.w,
              height: 15.h,
              color: Colors.orange,

            ),
            Container(
              width: 428.w,
              height: 10.h,
              color: Colors.black,

            ),
            SizedBox(height: 20.h,),
            Image.asset('assets/img3.png',width: 300.w,height: 300.h,),
            SizedBox(height: 10.h,),
            Container(
              width: 385.w,
              height: 55.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.2199999988079071),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: TextField(controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'email',
                ),
              ),
            ),
            SizedBox(height: 30.h,),
            Container(
              width: 385.w,
              height: 55.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.2199999988079071),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: TextField(controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 30.h,),
            GestureDetector(onTap: (){
              firebaseAuth
                  .signInWithEmailAndPassword(
                  email: email.text, password: password.text)
                  .then((value) => {
                ToastMessage().toastmessage(message: 'Successfully registerd'),
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Home()))
              })
                  .onError((error, stackTrace) => ToastMessage()
                  .toastmessage(message: error.toString()));
            },
              child: Container(
                width: 175.w,
                height: 45.h,
                decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                ),
                child: Center(child: Text('Log In', style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),)),

              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding:  EdgeInsets.only(left:  140.0.w),
              child: Row(
                children: [
                  Image.asset('assets/google.png',width: 50.w,height: 50.h,),
                  SizedBox(width: 30.w,),
                  GestureDetector(onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Phone()));
                  },

                      child: Image.asset('assets/img.png',width: 50.w,height: 50.h,)),
                ],
              ),
            ),
            SizedBox(height: 30.h,),

            Center(child: GestureDetector(onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Forget()));
            },
              child: Text('forget password?',
                style: TextStyle( color: Color(0xFF0DA54B),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),),
            ))

          ],
        ),
      ),
    );
  }
}
