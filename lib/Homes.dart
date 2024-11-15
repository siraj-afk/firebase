import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled6/toastmsg.dart';

class Homes extends StatefulWidget {
  const Homes({super.key});

  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  final ref = FirebaseDatabase.instance.ref("Data");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 20.0.w, top: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: ref.onValue,
                  builder: (BuildContext context,
                      AsyncSnapshot<DatabaseEvent> snapshot) {
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
                      Map<dynamic, dynamic> map =
                          snapshot.data!.snapshot.value as dynamic;

                      print("hi" + map.values.toString());

                      return ListView.separated(
                        itemCount: snapshot.data!.snapshot.children.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(
                                map.values.toList()[index]["title"].toString()),
                            trailing: Wrap(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      opendailoge(
                                          index: index,
                                          id: map.values
                                              .toList()[index]["id"]
                                              .toString(),
                                          snapshot: snapshot);
                                    },
                                    child: Icon(Icons.edit)),
                                SizedBox(
                                  width: 10.w,
                                ),
                                IconButton(
                                    onPressed: () {
                                      ref
                                          .child(map.values
                                              .toList()[index]["id"]
                                              .toString())
                                          .remove();
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 29.h,
                          );
                        },
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future opendailoge(
      {required int index,
      required String id,
      required AsyncSnapshot<DatabaseEvent> snapshot}) async {
    final editpost = TextEditingController();

    final ref = FirebaseDatabase.instance.ref("Data");
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
              style: ButtonStyle(),
              onPressed: () {
                ref
                    .child(id)
                    .update({'title': editpost.text.toString()})
                    .then(
                      (value) => {
                        ToastMessage()
                            .toastmessage(message: 'Edited Succesfull'),
                        editpost.clear(),
                        Navigator.pop(context),
                      },
                    )
                    .onError(
                      (error, stackTrace) => ToastMessage()
                          .toastmessage(message: error.toString()),
                    );
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
