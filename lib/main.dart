import 'package:flutter/material.dart';
void main(){
  runApp(const MaterialApp(
    title: "flutter app",
    home: homepage(),
  ));
}
class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  String name="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("flutter  app"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (String userinput){
                setState(() {
                  name= userinput;

                });

              },
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text("current user input is $name"),
            ),
          ],
        ),
      ),

    );
  }
}
