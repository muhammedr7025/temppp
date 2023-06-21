import 'package:flutter/material.dart';
class App  extends StatelessWidget {
  const App ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text("List Title "),

      ),
      body: Container(
        color: Colors.grey,
        padding: EdgeInsets.all(20),
        child: ListView(children: [
          Card(
            elevation:5 ,
            child: Container(
             //margin: EdgeInsets.only(bottom: 1),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue,),
              child: ListTile(title: Text("Example title "),

                       subtitle: Text("SUb"),
                       trailing: Icon(Icons.arrow_forward_ios),
                       leading: Icon(Icons.account_circle),
                       contentPadding: EdgeInsets.all(24),
                       iconColor: Colors.red,
                       textColor: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 20,),
          Card(
            elevation:5 ,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue,),
              child: ListTile(title: Text("Example title "),
                subtitle: Text("SUb"),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(Icons.account_circle),
                contentPadding: EdgeInsets.all(24),
                iconColor: Colors.red,
                textColor: Colors.black,
              ),
            ),
          ),

        ],),
      ),
    ),);
  }
}
