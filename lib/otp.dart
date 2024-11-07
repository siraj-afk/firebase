import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.only(top: 350.0),
        child: Column(
          children: [
            OtpTextField(
              numberOfFields: 4,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode){
                showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    }
                );
              }, // end onSubmit
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
                    'send',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,

                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
