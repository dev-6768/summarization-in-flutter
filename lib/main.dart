import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:summarization_in_flutter/calculate_function.dart';

void main(){
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

          title: Text("Paragraph Summarizer."),
          centerTitle: false,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), 
            bottomRight: Radius.circular(25)),
          ),
          
          backgroundColor: Colors.blueAccent[400],
        ),
        
        body: const Controller(),
      ),
        
    );
}
}

class Controller extends StatefulWidget {
  const Controller({super.key});
  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller>{
  String url = "";
  var data;
  var output = "Summarized paragraph will be shown here.";
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Paste your paragraph.',  
            ),
            onChanged: (value){
              url = "https://unexpected-slash-salmonberry.glitch.me/?query=$value";
            }   
          ),
        ),


        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: ElevatedButton(
            child: Text("Summarize the Paragraph."),
            onPressed: () async {
              //print("URL - " + url);
              data = await fetchData(url);
              //print(data);
              var decoded = jsonDecode(data);
              setState(() {
                output = decoded["output"]; 
              });
            }

        ),
      ),
        
           
        


        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical:16),
          child: Text('Result : $output'),
          ), 
      ],
    );
  }
}    