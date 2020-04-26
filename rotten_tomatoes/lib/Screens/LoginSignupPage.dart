import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotten_tomatoes/Services/auth.dart';
import 'package:rotten_tomatoes/navigation.dart';

class LoginSignupPage extends StatefulWidget {
  LoginSignupPage({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;
  @override
  State<StatefulWidget> createState() => new _LoginSignupPageState();
}
enum FormMode { LOGIN, SIGNUP }

class _LoginSignupPageState extends State<LoginSignupPage> {
  final _formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  String _name;
  String _username;


  String _errorMessage = "";
  // this will be used to identify the form to show
  FormMode _formMode = FormMode.LOGIN;
  bool _isIos = false;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () {
              //navigate to help page
              MyNavigator.goToHelp(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              //navigate to app information page
              MyNavigator.goToAboutUs(context);
            },
          ),
        ],
        title: _formMode == FormMode.LOGIN
            ? new Text('Login', style: GoogleFonts.pacifico())
            : new Text('Create Account', style: GoogleFonts.pacifico()),
      ),
      body: new Container(
        child: ListView(
        children: <Widget>[     
          Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                      ),
                      Image.asset(
                        "assets/logo.JPG",
                        height: 150,
                        width: 150,
                        fit: BoxFit.fill,                
                        
                      )
                      ,
                    ],
                  ),
                ),
          SizedBox(
                height: 50.0,
              ),     
          formWidget(),
          SizedBox(
                height: 30.0,
              ),  
          loginButtonWidget(),
          secondaryButton(),
          errorWidget(),
          progressWidget()
        ],
      ),
      ),
    );
  }
  Widget progressWidget() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }
  Widget formWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _emailWidget(),
          _passwordWidget(),
        ],
      ),
    );
  }

  Widget _emailWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            labelText: 'EMAIL',
            labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.grey),
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email cannot be empty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }
  Widget _passwordWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            labelText: 'PASSWORD',
            labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.grey),
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Password cannot be empty' : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }
  Widget loginButtonWidget() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(75.0, 15.0, 75.0, 0.0),
        child: new MaterialButton(
          elevation: 5.0,
          minWidth: 150.0,
          height: 42.0,
          color: Colors.red,
          child: _formMode == FormMode.LOGIN
              ? new Text('Login',
                  style: new TextStyle(fontSize: 15.0, color: Colors.white))
              : new Text('Create account',
                  style: new TextStyle(fontSize: 15.0, color: Colors.white)),
          onPressed: _validateAndSubmit,
        ));
  }
  Widget secondaryButton() {
    return new FlatButton(
      child: _formMode == FormMode.LOGIN
          ? new RichText(text: TextSpan(children: <TextSpan> [
              TextSpan(text: 'New to Pyxy? ',style: TextStyle(color: Colors.black)),
              TextSpan(text: 'Create an account', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
          ],),)
          : new RichText(text: TextSpan(children: <TextSpan> [
              TextSpan(text: 'Have an account? ',style: TextStyle(color: Colors.black)),
              TextSpan(text: 'Sign in', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
          ],),),
      onPressed: _formMode == FormMode.LOGIN ? showSignupForm : showLoginForm,
    );
  }
  void showSignupForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }
  void showLoginForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.LOGIN;
    });
  }
  Widget errorWidget() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }
  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
  _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (_validateAndSave()) {
      String userId = "";
      try {
        if (_formMode == FormMode.LOGIN) {
          userId = await widget.auth.signIn(_email, _password);
        } else {
          userId = await widget.auth.signUp(_email, _password);
        }
        setState(() {
          _isLoading = false;
        });
        if (userId.length > 0 && userId != null) {
          widget.onSignedIn();
        }
      } catch (e) {
        setState(() {
          _isLoading = false;
          if (_isIos) {
            _errorMessage = e.details;
          } else
            _errorMessage = e.message;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }
}