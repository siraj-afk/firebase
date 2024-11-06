import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
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
            SizedBox(height: 50.h,),
            Image.asset('assets/img3.png',width: 300.w,height: 300.h,),
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
              child: TextField(
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
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 50.h,),
            Padding(
              padding:  EdgeInsets.only(left:  140.0.w),
              child: Row(
                children: [
                  Image.asset('assets/google.png',width: 50.w,height: 50.h,),
                  SizedBox(width: 30.w,),
                  Image.asset('assets/img.png',width: 50.w,height: 50.h,),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
