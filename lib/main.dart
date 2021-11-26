import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(const MaterialApp(
    title: " Simple Interest Calculator App",
    home: homepage(),
  ));
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String>namelist=["dollar",'yeroo','rupii'];
  final _miniPadding=5.0;
  String namevalue="name";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator app"),
        centerTitle:true ,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            getimage(),
          Padding(
            padding:  EdgeInsets.all(_miniPadding),
            child: TextField(
             keyboardType: TextInputType.number,
             decoration: InputDecoration(
               labelText: "enter your name",
               hintText: 'name',
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(8.0),


               )

             ),
         ),
          ),
            Padding(
              padding:  EdgeInsets.all(_miniPadding),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "enter your name",
                    hintText: 'name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),


                    )

                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "eneter number",
                        labelText: 'please eneter name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                ),
                DropdownButton(
                  items: <String>['name','city','adress'].map((e){
                    return DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (index){
                    setState(() {
                      namevalue=index as String;
                    });

                  },
                  value: namevalue,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getimage() {
    AssetImage assetImage= AssetImage("images/dollar.PNG");
    Image image= Image(image: assetImage,width: 325.0,height: 225.0,);
    return Container(
      child:image,
      margin: EdgeInsets.all(_miniPadding*0.1),
    );

  }
}

