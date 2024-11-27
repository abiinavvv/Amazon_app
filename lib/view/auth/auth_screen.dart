import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLoginEnabled = false;
  var signupKey = GlobalKey<FormState>();
  var signInKey = GlobalKey<FormState>();

  void _signUpSubmit() {
    final isValid = signupKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    signupKey.currentState!.save();
  }

  void _signInSubmit() {
    final isValid = signInKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    signInKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Amazon"),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: isLoginEnabled
                ? Form(
                    key: signInKey,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Sign in with your Email and Password",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Sign In",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Forgot Password",
                                  style: TextStyle(fontSize: 15),
                                ))
                          ],
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                    .hasMatch(value)) {
                              return " enter a valid email";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              hintText: "Email or Phone number",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            RegExp regex = RegExp(
                                r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$");
                            if (value!.isEmpty) {
                              return "Enter Password";
                            } else {
                              if (!regex.hasMatch(value)) {
                                return "Enter Valid Password";
                              } else {
                                return null;
                              }
                            }
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                              hintText: "Password",
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                        CheckboxListTile(
                          value: true,
                          onChanged: (value) {},
                          title: const Text("Show Password"),
                        ),
                        CheckboxListTile(
                          value: true,
                          onChanged: (value) {},
                          title: const Text("Keep me Signed In"),
                        ),
                        InkWell(
                          onTap: () {
                            _signInSubmit();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 2 - 40,
                                vertical: 20),
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: const Text("Sign In"),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 20)),
                        const Divider(),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20, top: 10),
                          child: Text("New to Amazon?"),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isLoginEnabled = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 2 - 90,
                                vertical: 20),
                            decoration: const BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: const Text("Create an new Account"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 89),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                                "Conditions and User privacy policy"),
                          ),
                        )
                      ],
                    ),
                  )

                // SIGN UP SCREEN

                : Form(
                    key: signupKey,
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Create Account",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter your name";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              hintText: "Your Name",
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                    .hasMatch(value)) {
                              return " enter a valid email";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              hintText: " Email",
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            RegExp regex = RegExp(
                                r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$");
                            if (value!.isEmpty) {
                              return "Enter Password";
                            } else {
                              if (!regex.hasMatch(value)) {
                                return "Enter Valid Password";
                              } else {
                                return null;
                              }
                            }
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                              hintText: "Password",
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Password must be Atleast 6 characters"),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            RegExp regex = RegExp(
                                r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$");
                            if (value!.isEmpty) {
                              return "Enter Password";
                            } else {
                              if (!regex.hasMatch(value)) {
                                return "Enter Valid Password";
                              } else {
                                return null;
                              }
                            }
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                              hintText: "Confirm Password",
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            _signUpSubmit();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 2 - 100,
                                vertical: 20),
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: const Text("Create a New Account"),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 20)),
                        const Divider(),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20, top: 10),
                          child: Text("Already a Customer?"),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isLoginEnabled = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 2 - 40,
                                vertical: 20),
                            decoration: const BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: const Text("Sign in"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 89),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                                "By creating an account, You Agree to Amazon's Conditions"),
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        )));
  }
}
