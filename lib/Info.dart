
import 'package:flutter/material.dart';

List<String> InfoItems = [
  "利用規約",
  "プライバシーポリシー",
  "このアプリについて"
];

class Info extends StatelessWidget {

  List<Widget> InfoPages = [
    Terms(),
    PrivacyPolicy(),
    AboutThisApp()
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: Text("Information"),),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPages[index]));
          },
          title: Card(
            child:Padding(
              child: Text('${InfoItems[index]}',
                style: TextStyle(fontSize: 22.0),),
              padding: EdgeInsets.all(20.0),
            ),
          ),
        );
      },

        itemCount: 3,),
    );
  }
}

class Terms extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(InfoItems[0]),
      ),
    );
  }
}
class PrivacyPolicy extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(InfoItems[1]),
      ),
      body: Text(
          """
      
          """
      )
    );
  }
}

class AboutThisApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(InfoItems[2]),
      ),
    );
  }
}


