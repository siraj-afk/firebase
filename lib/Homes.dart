import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Homes extends StatefulWidget {
  const Homes({super.key});

  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     body: Padding(
       padding: EdgeInsets.only(left: 20.0.w,top: 50.h),
       child: Column(crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Expanded(
             child: ListView.separated(
                 itemCount: 5,
                 itemBuilder: (BuildContext context, int index) {
                   return Text('anything');
                 }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 29.h,); },),
           ),
         ],
       ),
     ),
    );
  }
}
