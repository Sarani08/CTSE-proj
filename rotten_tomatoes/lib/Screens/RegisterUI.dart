import 'package:flutter/material.dart';
import '../navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Services/auth.dart';
import './drawer.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  _SignupPageState({this.auth});
  BaseAuth auth;
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String _errorMessage;
  bool _isLoading;


  String name;
  String email;
  String password;
  String username;

  bool validateAndSave() {
    final form =  _formKey.currentState;
    if(form.validate()) {
      form.save();
      return true;
    }else {
      return false;
    }
  }

   void validateAndSubmit() async {
    //     setState(() {
    //   _errorMessage = "";
    //   _isLoading = true;
    // });
    // if (validateAndSave()) {
    //   String userId = "";
    //   try {
    //     userId = await widget.aut
    //     print('Signed in: $userId');
    //     setState(() {
    //       _isLoading = false;
    //     });

    //     if (userId.length > 0 && userId != null) {
    //       widget.loginCallback();
    //     }
    //   } catch (e) {
    //     print('Error: $e');
    //     setState(() {
    //       _isLoading = false;
    //       _errorMessage = e.message;
    //       _formKey.currentState.reset();
    //     });
    //   }
    // }
   }




  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar:AppBar(
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () {
              MyNavigator.goToHelp(context);
            },
          ),
        ],
        title: Text(
          "Register",
          style: GoogleFonts.pacifico(),
        ),
      ),
      drawer: CommonDrawer(), 
        body: new Container(
          child: ListView(
          children: 
          <Widget>[
          Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                      ),
                      Image.asset(
                        "assets/logo.JPG",
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,                
                        
                      )
                      ,
                    ],
                  ),
                ),
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Form(
                key: _formKey,
                  child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter a name' : null,

                      decoration: InputDecoration(
                          labelText: 'FULL NAME',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          // hintText: 'EMAIL',
                          // hintStyle: ,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                               onChanged: (val){
                              setState(() => name = val);
                          },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          // hintText: 'EMAIL',
                          // hintStyle: ,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                               onChanged: (val){
                              setState(() => email = val);
                          },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter a password' : null,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                               onChanged: (val){
                              setState(() => password = val);
                          },
                      obscureText: true,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter an username' : null,
                      decoration: InputDecoration(
                          labelText: 'USERNAME ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                               onChanged: (val){
                              setState(() => username = val);
                          },
                    ),
                    SizedBox(height: 50.0),
                    Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.redAccent,
                          color: Colors.red,
                          elevation: 7.0,
                          child: InkWell(
                            onTap: ()async{
                            validateAndSubmit();
                            _formKey.currentState.reset();
                            },
                            child: Center(
                              child: Text(
                                'SIGNUP',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(height: 20.0),
                    Container(
                      height: 40.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: 
                          
                              Center(
                                child: Text('Go Back',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat')),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ])));
  }
}