import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  final String userId;

  const UserName({super.key, required this.userId});

  //const UserName({Key? key, required this.UserId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference user = FirebaseFirestore.instance.collection("users");
    return FutureBuilder<DocumentSnapshot>(
        future: user.doc(userId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            return Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
              //color: Colors.yellow,
              child: ListTile(
                subtitle: Text('Email :${data['email']}'),
                title: Text('Name :${data['Name ']}'),


                
              ),
            );
          }
          return const Text("Loading");
        }));
  }
}
