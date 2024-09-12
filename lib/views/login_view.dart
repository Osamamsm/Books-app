import 'package:final_project/views/main_view.dart';
import 'package:final_project/views/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

var formKey = GlobalKey<FormState>();
bool visible = true;

class _LoginViewState extends State<LoginView> {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() async {
    emailController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                'Login',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "E-mail",
                    prefixIcon: Icon(Icons.email)),
                validator: (value) {
                  final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!);
                  if (value!.isEmpty) {
                    return "E-mail can't be empty";
                  }
                  if (!emailValid) {
                    return "Invalid E-mail";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: visible,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    icon: visible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password can't be empty";
                  }
                  if (value.length < 8) {
                    return "Password must be 8 characters at least";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                      email: emailController!.text,
                      password: passwordController!.text,
                    )
                        .then((value) {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return const MainView();
                      }), (route) => false);
                    }).catchError((e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.toString())));
                    });
                    emailController!.clear();
                    passwordController!.clear();
                  }
                },
                color: Colors.indigo,
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('You Don\'t Have Account'),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const RegisterView(),
                          ),
                          (route) => false,
                        );
                      },
                      child: const Text('Register'))
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
