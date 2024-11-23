import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(fontSize: 15),
                        ))
                  ],
                ),
                const TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: "Email or Phone number",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: TextField(obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
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
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 2 - 40,
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
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 2 - 90,
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
                  child: TextButton(onPressed: (){}, child: const Text("Conditions and User privacy policy"),),
                )
              ],
            ),
          ),
        )));
  }
}
