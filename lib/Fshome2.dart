import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled6/toastmsg.dart';
class Fshome2 extends StatefulWidget {
  const Fshome2({super.key});

  @override
  State<Fshome2> createState() => _Fshome2State();
}

class _Fshome2State extends State<Fshome2> {
  final editpost = TextEditingController();
  final firestore = FirebaseFirestore.instance.collection('Data').snapshots();
  final ref =FirebaseFirestore.instance.collection('Data');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: firestore,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('error'),
                  );
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder:
                        (BuildContext context, int index) {
                      return ListTile(
                        title: Text( snapshot.data!.docs[index]['title'].toString(),style: TextStyle(color: Colors.white),),
                        trailing: Wrap(
                          children: [
                            GestureDetector( onTap: () {
                              opendailoge(index: index, id: snapshot.data!.docs[index]['id'].toString(), snapshot: snapshot);
                            },

                                child: Icon(Icons.edit, color: Colors.white,)),
                            SizedBox(width: 10.w,),
                            IconButton(
                                onPressed: () {
                                  ref.doc(snapshot.data!.docs[index]["id"].toString()).delete();
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      );
                    },

                  );
                }
                else {
                  return SizedBox();
                }
              })
          )
        ],
      ),
    );
  }
  Future opendailoge({required int index,
    required String id,
    required AsyncSnapshot<QuerySnapshot> snapshot}) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Here'),
        content: TextFormField(
          controller: editpost,
          textInputAction: TextInputAction.next,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              filled: true,
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              fillColor: Color(0xFFF7F8F9),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)),
              hintText: 'Type here',
              hintStyle:
              TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
              labelStyle: TextStyle(
                color: Color(0xFF7C7C7C),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 0.10,
              )),
          validator: (email) {
            if (email!.isEmpty) {
              return 'Enter something';
            }
            return null;
          },
        ),
        actions: [
          ElevatedButton(

              onPressed: () {
                ref.doc(snapshot.data!.docs[index]["id"].toString()).update({"title":editpost.text.toString()}).then((value) => {
                  ToastMessage().toastmessage(message: 'Edited Succesfull'),
                  editpost.clear(),

                  Navigator.pop(context),

                },).onError((error, stackTrace) => ToastMessage().toastmessage(message: error.toString()),);
              },
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
