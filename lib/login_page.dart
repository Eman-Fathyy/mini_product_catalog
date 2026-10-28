import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
const LoginPage({super.key});

@override
State<LoginPage> createState() {
return LoginPageState();
}
}

class LoginPageState extends State<LoginPage> {
@override
void initState() {
super.initState();
print("LoginPage: initState");
}

@override
void didChangeDependencies() {
super.didChangeDependencies();
print("LoginPage: didChangeDependencies");
}

@override
Widget build(BuildContext context) {
print("LoginPage: build");

return Scaffold(
appBar: AppBar(
  title: const Text(" Shopping Mall"),
centerTitle: true,
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Text(
  "Welcome to Shopping Mall",
style: TextStyle(
fontSize: 28,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 20),
const Padding(
padding: EdgeInsets.symmetric(horizontal: 30),
child: TextField(
decoration: InputDecoration(
labelText: "Username",
border: OutlineInputBorder(),
),
),
),
const SizedBox(height: 20),
ElevatedButton(
    onPressed: () {
      // Navigator version:
      // Navigator.pushNamed(
      //   context,
      //   '/products',
      //   arguments: 'Guest',
      // );

      // go_router version:
      context.goNamed(
        'products',
        queryParameters: {
          'user': 'Guest',
        },
      );
    },


child: const Text("Login"),
),
],
),
),
);
}

@override
void deactivate() {
print("LoginPage: deactivate");
super.deactivate();
}

@override
void dispose() {
print("LoginPage: dispose");
super.dispose();
}
}
