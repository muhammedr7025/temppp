import 'package:flutter/material.dart';

class PostomePage extends StatelessWidget {
  const PostomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

                Text(
                  "Community Page",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                ),

                    Icon(Icons.add,color: Colors.black,),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Icon(Icons.favorite,color: Colors.black,),
                    ),
                    Icon(Icons.share,color: Colors.black,),




          ],
        ),
      ),
      body: Column(

        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    child: Text('A',textAlign: TextAlign.center,style: TextStyle(fontSize:30,color: Colors.white,),),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.purple, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 270),
                  Icon(Icons.more_vert),
                ],
              ),
              Container(

                height: 400,

                decoration: BoxDecoration(image: DecorationImage(
                  image: AssetImage('assets/images/bground.jpg'),
                  fit: BoxFit.cover,
                ),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.favorite,size: 30,),
                      SizedBox(width: 20,),
                      Icon(Icons.chat_bubble_outline,size: 30),
                      SizedBox(width: 20,),
                      Icon(Icons.share,size: 30),
                    ],
                  ),
                  Icon(Icons.bookmark),
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 16),
              child: Row(children: [
                Text('Liked by '),
                Text(
                  "DJ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('and'),
                Text(
                  "others",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

              ],),
              ),


            ],
          )
        ],
      ),
    );
  }
}
