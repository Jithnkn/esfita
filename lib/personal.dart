import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    home: Personal(),
    /*routes: {
      '/logn':(context) =>Login(),
      '/sign': (context) => Signup(),//route declaration
    }*/
  ));
}


class Personal extends StatefulWidget {
  @override
  personal createState() =>personal();
}//User credentials
class personal extends State<Personal> {


  bool showProgress= false;
  String em,pass,naa;
  int _value=1;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController phone = TextEditingController();
  //initailizing text editor controllers
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Esfita'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                        'SignIn',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: name,
                    onChanged: (value){
                      naa=value ;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',

                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(

                    controller: email,
                    onChanged: (value){
                      em=value;//get the values entred in the text field
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',


                    ),
                  ),
                ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: DropdownButton(
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("bank detail"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Account over 2 Years"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                        child: Text("Account over 1 and above"),
                        value: 3
                    ),
                    DropdownMenuItem(
                        child: Text("Account over 6 months"),
                        value: 4
                    ),
                    DropdownMenuItem(
                        child: Text("Others"),
                        value: 5
                    )
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  }),
            ),

                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Submit'),
                      onPressed: ()async{
                        setState(() {
                          showProgress =true;
                        });


                      },
                    )),

              ],
            )));

  }
}
