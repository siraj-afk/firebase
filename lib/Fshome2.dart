import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                        title: Text( snapshot.data!.docs[index]['title'].toString()),
                        trailing: Wrap(
                          children: [
                            Icon(Icons.edit, color: Colors.white,),
                            SizedBox(width: 10.w,),
                            Icon(Icons.delete, color: Colors.white,)
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
}
