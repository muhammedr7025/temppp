import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  final String userId;

  const PostDetails({super.key, required this.userId});

  //const UserName({Key? key, required this.UserId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference user =
        FirebaseFirestore.instance.collection("CommunityPost");
    return FutureBuilder<DocumentSnapshot>(
        future: user.doc(userId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return ListTile(
              title: Column(

                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('tittle : ${data['tittle']}',style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 10),
                              Text('location : ${data['location']}',style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 20),
                            ],
                          ),
                        ],
                      ),
                      Container(

                        height: 400,

                        decoration: BoxDecoration(image: DecorationImage(
                          image: AssetImage('assets/images/bground.jpg'),
                          fit: BoxFit.cover,
                        ),),
                      ),

                      Padding(padding: EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                          Text('description : ${data['description']}',style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 10),





                        ],),
                      ),


                    ],
                  )
                ],
              ),

              tileColor: Colors.purple,
            );
          }
          return const Text("Loading");
        }));
  }
}
