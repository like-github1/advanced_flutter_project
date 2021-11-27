import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: " Simple Interest Calculator App",
    home: homepage(),
    //flutter primerycolor

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
  String namevalue="dollar";
  TextEditingController textEditingController=TextEditingController();
  TextEditingController principaltextEditingControllers=TextEditingController();
  TextEditingController termtextEditingController=TextEditingController();
 double Dispalytext= 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // resizeToAvoidBottomInset: false,//avoids bottom overflow
      appBar: AppBar(
        title: const Text("Calculator app"),
        centerTitle:true ,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            getimage(),
          Padding(
            padding:  EdgeInsets.all(_miniPadding),
            child: TextField(
              controller: textEditingController,
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
                controller: principaltextEditingControllers,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "principal",
                    hintText: 'enter principal',
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
                    controller: termtextEditingController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "eneter number",
                        labelText: 'Term',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                ),

               Expanded(
                    child: DropdownButton(
                      items: namelist.map((e){
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (index){
                        doropdownSelecteditem(index);
                      },
                      value: namevalue,
                    ),

                ),

              ],
            ),
            Row(
              children: <Widget>[
                 Expanded(
                    child: ElevatedButton(

                      onPressed: (){
                        setState(() {
                          Dispalytext=getPrincipal();

                        });
                      },
                      child: Text("calculet"),
                    ),
                  ),
                 Expanded(
                    child: ElevatedButton(
                      onPressed: (){
                    setState(() {
                      _reset();
                    });
                      },
                      child: Text("reset"),

                    ),
                  ),

              ],
            ),
            Text("your Current principal is $Dispalytext")
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

  void doropdownSelecteditem(Object? index) {
    setState(() {
      namevalue=index as String;
    });
  }

  double getPrincipal() {
    double principal= double.parse(principaltextEditingControllers.text);
    double text= double.parse(textEditingController.text);
    double term= double.parse(this.termtextEditingController.text);
    double totalamountopay= principal+(principal*text*term)/100;
    return totalamountopay;

  }

  void _reset() {
     Dispalytext=0.0;
    termtextEditingController.text="";
     principaltextEditingControllers.text="";
   textEditingController.text="";
     namevalue=namelist[0];
  }
}


