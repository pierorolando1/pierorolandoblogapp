import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pierorolandoblog/bloc/modal/modal_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pierorolandoblog/helpers.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  TextEditingController _emailcontroller = new TextEditingController();
  TextEditingController _passwordcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 33, 47, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Text("Login",style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white70)),
              SizedBox(height: 25),
              CupertinoTextField(
                controller: _emailcontroller,
                keyboardType: TextInputType.emailAddress,
                placeholder: "Email",
                padding: EdgeInsets.symmetric(horizontal: 17, vertical: 13),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Color.fromRGBO(255, 255, 255, 0.3),
                  ),
                  borderRadius: BorderRadius.circular(100)
                )
              ),
              SizedBox(height: 15),
              CupertinoTextField(
                obscureText: obscureText,
                controller: _passwordcontroller,
                keyboardType: TextInputType.visiblePassword,
                placeholder: "Password",
                padding: EdgeInsets.symmetric(horizontal: 17, vertical: 13),
                suffix:  IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: Icon(Icons.visibility, color: obscureText ? Colors.white38 : Color.fromRGBO(35, 95, 245, 1),),
                  focusColor: Colors.transparent,
                  iconSize: 19,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Color.fromRGBO(255, 255, 255, 0.3),
                  ),
                  borderRadius: BorderRadius.circular(100)
                )
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(35, 95, 245, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(100.0),
                    ),
                  ), 
                  onPressed: () async {
                    try {
                      context.read<ModalBloc>().add(OpenModal());
                      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailcontroller.text,
                        password: _passwordcontroller.text
                      );
                      context.read<ModalBloc>().add(CloseModal());
                      Navigator.pushReplacementNamed(context, '/home');
                      print(userCredential.user);

                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showCupeDialog(context, "Usuario no encontrado");
                      } else if (e.code == 'wrong-password') {
                        showCupeDialog(context, "Contraseña equivocada");
                      }
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100)
                    ),
                    width: double.infinity,
                    height: 50,
                    child: Center(
                      child: Text( "Log In" , style: TextStyle( color: Colors.white, fontSize: 18 )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}