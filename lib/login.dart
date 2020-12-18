

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: Login(),
    /*routes: {
      '/logn':(context) =>Login(),
      '/sign': (context) => Signup(),//route declaration
    }*/
  ));
}


class Login extends StatefulWidget {
  @override
  Loginn createState() => Loginn();//Login page


}
class Signup extends StatefulWidget {
  @override
  Signupp createState() =>Signupp();
}//User credentials

class Loginn extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String eml,passw;

  @override
  Widget build(BuildContext context) {
    final _auth= FirebaseAuth.instance;// creating instance of firebase
    bool showProgress= false;
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
                      'Login',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: email,
                    onChanged: (value){
                      eml=value ;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: password,
                    onChanged: (value){
                      passw=value ;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () async {
                        setState(() {
                          showProgress = true;
                        });
                        try {
                          final newUser = await _auth.signInWithEmailAndPassword(
                              email: eml,
                              password: passw
                          );//Login using email and password
                          print(newUser.toString());

                        } catch (e) {}
                      },

                    )),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Does not have account?'),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () { //Navigator.pushNamed(context, '/sign');
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> Signup()),);
                          },//navigating to signup screen
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )
                ),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Forget Password'),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'Reset Password',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () async {

                            final reset =   await _auth.sendPasswordResetEmail(email: eml);//reseting passowrd using email
                            print("Check Your mail Inbox......");

                          },//navigating to signup screen
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )
                )
              ],
            )));
  }

}//Login page


class Signupp extends State<Signup> {
  final _auth=FirebaseAuth.instance;

  bool showProgress= false;
  String em,pass,naa;
  final fb = FirebaseDatabase.instance;//creating database reference
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();
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
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: password,
                    onChanged: (value){
                      pass= value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ), Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: repassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Re-Enter Password',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone',
                    ),
                  ),
                ),


                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('SignUp'),
                      onPressed: ()async{
                        setState(() {
                          showProgress =true;
                        });

                        try {

                          final newuser = await _auth.createUserWithEmailAndPassword(
                              email: em,
                              password: pass); //registering user

                          if(newuser !=null) {
                            final ref=fb.reference();//initializing reference to the database
                            ref.child('users').child(newuser.user.uid).set(
                                {
                                  'email': em,
                                  'name':naa,
                                }//adding data to the user credentail table
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login()),
                            );
                            //firebase code
                            setState(() {
                              showProgress = false;
                            });
                          }
                        } catch(e){}
                      },
                    )),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Already have an account?'),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {Navigator.pop(context);  //navigate back to login screen
                          },

                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )
                )
              ],
            )));

  }
}