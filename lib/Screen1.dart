
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Screen2.dart';
import 'Screen3.dart';
class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
      SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(left: 20.0.w,top: 200.h,),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 30.h,),

              Text('All your shopping in\none App' ,style: TextStyle(
                color: Colors.white,
                fontSize: 35.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),),
              SizedBox(height: 20.h,),
              Container(
                width: 381.w,
                height: 100.h,
                child: Text( 'Sell your devices the smarter, faster way for \n'
                    'immediate cash and a cleaner conscience.Sell\n'
                    'your devices the smarter, faster way for \n'
                    'immediate cash and a cleaner conscience.', style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),),
              ),
              SizedBox(height: 60.h,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen3()));
                  },
                    child: Container(
                      width: 175.w,
                      height: 45.h,
                      decoration: ShapeDecoration(
                        color: Colors.red,
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
                  SizedBox(width: 20.w,),
                  GestureDetector(onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen2()));
                  },
                    child: Container(
                        width: 175.w,
                        height: 45.h,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),

                        ),
                        child: Center(
                          child: Text('Sign up',style: TextStyle(
                            color:  Colors.red,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),),
                        )
                    ),
                  ),


                ],
              )],
          ),
        ),
      ),

    );
  }
}
