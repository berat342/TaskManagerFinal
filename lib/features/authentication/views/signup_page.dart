import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/common/widgets/round_button.dart';
import 'package:todo_app/core/common/widgets/white_space.dart';
import 'package:todo_app/features/authentication/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:todo_app/features/authentication/views/login_page.dart';
import 'package:todo_app/features/authentication/widgets/form_container_widget.dart';
import 'package:todo_app/features/todo/views/home_screen.dart';

class signup_page extends StatefulWidget {
  const signup_page({super.key});

  @override
  State<signup_page> createState() => _signup_pageState();
}

class _signup_pageState extends State<signup_page> {

  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              FormContainerWidget(
controller: _usernameController,
                hintText: "User Name",
                isPasswordField: false,
              ),
              SizedBox(
                height: 10,
              ),
              FormContainerWidget(
controller: _emailController,
                hintText: "Email",
                isPasswordField: false,
              ),
              SizedBox(
                height: 10,
              ),
              FormContainerWidget(
controller: _passwordController,
                hintText: "Password",
                isPasswordField: true,
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: _signUp,
                child:  Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
          ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => login_page()), (Route) => false);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void _signUp() async{
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user =await _auth.signUpWithEmailAndPassword(email, password);

    if(user!= null){
      print("User is successfully created");
      // Navigator.pushNamed(context, "/home");
      Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()));
    }else{
      print("Some error happend");
    }

  }
}
