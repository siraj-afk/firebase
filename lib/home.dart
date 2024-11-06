import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Homes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,title: Center(child: Text('HOME')),
      actions: [
        Padding(
          padding:  EdgeInsets.only(right: 20.0.w),
          child: GestureDetector(onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Homes()));
          },
              child: Icon(Icons.arrow_forward_ios_outlined)),
        )
      ],
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: 400.0.h),
        child: Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                    ),
                  ),
                ),
                SizedBox(height: 50.h,),
                Container(
                  width: 175.w,
                  height: 45.h,
                  decoration: ShapeDecoration(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                      child: Text(
                    'push',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  )),
                ),
                SizedBox(height: 50.h,),
                Container(
                  width: 175.w,
                  height: 45.h,
                  decoration: ShapeDecoration(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                      child: Text(
                        'push',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
