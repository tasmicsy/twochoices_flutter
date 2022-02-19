import 'package:flutter/material.dart';

import 'main.dart';

class History extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Two Choices"),
        actions: [TextButton(
          onPressed: (){},
            child: Icon(Icons.cancel, color: Colors.white)
        )],
      ),
      backgroundColor: Colors.purple.shade50,
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            tileColor: Colors.white,
              trailing: Text((box.getAt(box.length-index-1).answer == 0) ? "×": "○"),
              title:
                Text('${box.getAt(box.length-index-1).question}',
                  style: TextStyle(fontSize: 22.0),),



          ),
        );
      },
        itemCount: box.length,),
    );
  }
}