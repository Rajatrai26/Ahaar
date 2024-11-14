import 'package:ahaar/pages/bottomnav.dart';
import 'package:ahaar/pages/forgotpassword.dart';
import 'package:ahaar/pages/home.dart';
import 'package:ahaar/pages/signup.dart';
import 'package:ahaar/widget/widget_support.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email = "", password = "";
  final _formkey = GlobalKey<FormState>();
  TextEditingController useremailcontroller = new TextEditingController();
  TextEditingController userpasswordcontroller = new TextEditingController();
  userLogin() async {
    try {
      print("Attempting to log in...");
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("Login successful");
      Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => BottomNav()));
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) => Home()), // Replace with your logged-in screen
      // );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "No User Found for that Email",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Wrong Password Provided by User",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Color.fromARGB(255, 128, 7, 235),
                    Color.fromARGB(255, 107, 0, 200),
                  ])),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Text(""),
            ),
            Container(
              margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Center(
                      child: Image.asset(
                    "images/logo1.png",
                    width: MediaQuery.of(context).size.width / 2,
                    fit: BoxFit.cover,
                  )),
                  SizedBox(
                    height: 50.0,
                  ),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.5,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30.0,
                            ),
                            Text(
                              "Login",
                              style: AppWidget.HeadLineTextFeildStyle(),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              controller: useremailcontroller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: AppWidget.semiBoldTextFeildStyle(),
                                  prefixIcon: Icon(Icons.email_outlined)),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              controller: userpasswordcontroller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: AppWidget.semiBoldTextFeildStyle(),
                                  prefixIcon: Icon(Icons.password_outlined)),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPassword()));
                              },
                              child: Container(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "Forget Password?",
                                  style: AppWidget.semiBoldTextFeildStyle(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_formkey.currentState!.validate()) {
                                  setState(() {
                                    email = useremailcontroller.text;
                                    password = userpasswordcontroller.text;
                                  });
                                }
                                userLogin();
                              },
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 128, 7, 235),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "LOGIN",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontFamily: "Pppins1",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      "Don't have an account? Sign up",
                      style: AppWidget.semiBoldTextFeildStyle(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
// import 'package:ahaar/pages/signup.dart';
// import 'package:ahaar/widget/widget_support.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class LogIn extends StatefulWidget {
//   const LogIn({super.key});

//   @override
//   State<LogIn> createState() => _LogInState();
// }

// class _LogInState extends State<LogIn> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController useremailController = TextEditingController();
//   final TextEditingController userpasswordController = TextEditingController();

//   Future<void> userLogin() async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: useremailController.text.trim(),
//         password: userpasswordController.text.trim(),
//       );
//       // On successful login, navigate to the next screen or display a success message.
//     } on FirebaseAuthException catch (e) {
//       String errorMessage;
//       if (e.code == 'user-not-found') {
//         errorMessage = "No user found for that email.";
//       } else if (e.code == 'wrong-password') {
//         errorMessage = "Wrong password provided.";
//       } else {
//         errorMessage = "An error occurred. Please try again.";
//       }
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(errorMessage, style: TextStyle(fontSize: 18.0))),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//             content: Text("An unexpected error occurred.",
//                 style: TextStyle(fontSize: 18.0))),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     useremailController.dispose();
//     userpasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height / 2.5,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   Color.fromARGB(255, 128, 7, 235),
//                   Color.fromARGB(255, 107, 0, 200)
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             margin:
//                 EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
//             height: MediaQuery.of(context).size.height / 2,
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(40),
//                 topRight: Radius.circular(40),
//               ),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
//             child: Column(
//               children: [
//                 Center(
//                   child: Image.asset(
//                     "images/logo1.png",
//                     width: MediaQuery.of(context).size.width / 2,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 SizedBox(height: 50.0),
//                 Material(
//                   elevation: 5.0,
//                   borderRadius: BorderRadius.circular(20),
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height / 2.5,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         children: [
//                           SizedBox(height: 30.0),
//                           Text("Login",
//                               style: AppWidget.HeadLineTextFeildStyle()),
//                           SizedBox(height: 30.0),
//                           TextFormField(
//                             controller: useremailController,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter an email';
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                               hintText: "Email",
//                               hintStyle: AppWidget.semiBoldTextFeildStyle(),
//                               prefixIcon: Icon(Icons.email_outlined),
//                             ),
//                           ),
//                           SizedBox(height: 30.0),
//                           TextFormField(
//                             controller: userpasswordController,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter a password';
//                               }
//                               return null;
//                             },
//                             obscureText: true,
//                             decoration: InputDecoration(
//                               hintText: "Password",
//                               hintStyle: AppWidget.semiBoldTextFeildStyle(),
//                               prefixIcon: Icon(Icons.password_outlined),
//                             ),
//                           ),
//                           SizedBox(height: 20.0),
//                           Align(
//                             alignment: Alignment.topRight,
//                             child: Text("Forget Password?",
//                                 style: AppWidget.semiBoldTextFeildStyle()),
//                           ),
//                           SizedBox(height: 40.0),
//                           GestureDetector(
//                             onTap: () {
//                               if (_formKey.currentState!.validate()) {
//                                 userLogin();
//                               }
//                             },
//                             child: Material(
//                               elevation: 5.0,
//                               borderRadius: BorderRadius.circular(20),
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(vertical: 8.0),
//                                 width: 200,
//                                 decoration: BoxDecoration(
//                                   color: Color.fromARGB(255, 128, 7, 235),
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     "LOGIN",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 18.0,
//                                       fontFamily: "Poppins",
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 40.0),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SignUp()),
//                     );
//                   },
//                   child: Text(
//                     "Don't have an account? Sign up",
//                     style: AppWidget.semiBoldTextFeildStyle(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
