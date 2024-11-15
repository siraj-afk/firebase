import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled6/toastmsg.dart';

import 'Fshome2.dart';
class Fshome extends StatefulWidget {
  const Fshome({super.key});

  @override
  State<Fshome> createState() => _FshomeState();
}

class _FshomeState extends State<Fshome> {
  final auth = FirebaseAuth.instance;
  final post = TextEditingController();
  final firestore = FirebaseFirestore.instance.collection('Data');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Text('Fire Store')),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0.w),
            child: Icon(Icons.arrow_forward_ios_outlined),
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
                    controller: post,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                GestureDetector(onTap: (){
                  final id = DateTime.now().microsecondsSinceEpoch.toString();
                  firestore
                      .doc(id)
                      .set({"id": id, "title": post.text.toString()})
                      .then(
                        (value) => {
                      ToastMessage()
                          .toastmessage(message: 'adding Succesfully'),
                      post.clear(),
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => Fshome2()))
                    },
                  )
                      .onError(
                        (error, stackTrace) => ToastMessage()
                        .toastmessage(message: error.toString()),
                  );
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
                ),
                SizedBox(
                  height: 50.h,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
