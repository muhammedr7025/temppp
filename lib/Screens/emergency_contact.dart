import 'package:air_pollution/Components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'addPost.dart';
import 'contact_details.dart';

class EmergencyContact extends StatefulWidget {
  final String role1;
  const EmergencyContact({super.key, required this.role1});

  @override
  State<EmergencyContact> createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
  late Future future;
//  DocumentReference<Map<String, dynamic>> usId = FirebaseFirestore.instance.collection("users").doc();
  List<String> contactDetails = [];

  Future getUserDetail() async {
    await FirebaseFirestore.instance
        .collection("emergency_contact")
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              contactDetails.add(element.reference.id);
            }));
  }

  @override
  void initState() {
    future = getUserDetail();
    super.initState();
  }

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          ListTile(
            title: const Text(
              'Emergency contact',
              style: TextStyle(fontSize: 27),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 27,
                )),
          ),
          Expanded(
            child: FutureBuilder(
                future: future,
                builder: ((context, snapshot) {
                  return ListView.builder(
                    itemCount: contactDetails.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: ListTile(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                            dense: true,
                            visualDensity: const VisualDensity(vertical: 3),
                            leading: CircleAvatar(child: Text("A"),),
                            tileColor: primaryclr,
                            textColor: Colors.white,
                            title: ContactDetails(
                              userId: contactDetails[index],
                              role: widget.role1,
                            ),
                            trailing: IconButton(onPressed: () {
                              setState(() {
                                final docUser = FirebaseFirestore.instance.collection('emergency_contact').doc(contactDetails.removeAt(index));
                                contactDetails.removeAt(index);
                                docUser.delete();
                              });
                            }, icon: Icon(Icons.delete,color: Colors.red,)),
                          ),
                        ),
                      );
                    },
                  );
                })),
          ),
          widget.role1 == "admin"
              ? FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => (const AddPost()),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.add,
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
