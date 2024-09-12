import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

var formKey = GlobalKey<FormState>();
bool visible = true;
TextEditingController? emailController;
TextEditingController? passwordController;
TextEditingController? nameController;
TextEditingController? numberController;
TextEditingController? dayController;
TextEditingController? monthController;
TextEditingController? yearController;

class _RegisterViewState extends State<RegisterView> {
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    numberController = TextEditingController();
    dayController = TextEditingController();
    monthController = TextEditingController();
    yearController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController!.dispose();
    passwordController!.dispose();
    nameController!.dispose();
    numberController!.dispose();
    dayController!.dispose();
    monthController!.dispose();
    yearController!.dispose();
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
                'Register',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                textCapitalization: TextCapitalization.sentences,
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Name",
                    prefixIcon: Icon(Icons.person)),
                validator: (value) {
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
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
                  if (value.isEmpty) {
                    return "E-mail can't be empty";
                  }
                  if (!emailValid) {
                    return "E-mail is Invalid";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: numberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Phone Number",
                    prefixIcon: Icon(Icons.phone)),
                validator: (value) {
                  final bool isValid =
                      RegExp(r"^01[0125][0-9]{8}$").hasMatch(value!);
                  if (!isValid) {
                    return "Number Invalid";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: dayController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Day",
                      ),
                      validator: (value) {
                        final int? day = int.tryParse(value!);
                        if (day == null || day < 1 || day > 31) {
                          return "Enter a valid day (1-31)";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: monthController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Month",
                      ),
                      validator: (value) {
                        final int? month = int.tryParse(value!);
                        if (month == null || month < 1 || month > 12) {
                          return "Enter a valid month (1-12)";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: yearController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Year",
                      ),
                      validator: (value) {
                        final int? year = int.tryParse(value!);
                        if (year == null ||
                            year < 1900 ||
                            year > DateTime.now().year) {
                          return "Enter a valid year";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
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
                color: Colors.indigo,
                height: 60,
                minWidth: double.infinity,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    if (formKey.currentState!.validate()) {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                          email: emailController!.text,
                          password: passwordController!.text,
                        );
                        await FirebaseFirestore.instance
                            .collection('Users')
                            .doc(userCredential.user?.uid)
                            .set({
                          'email': emailController!.text,
                          'Name': nameController!.text,
                          'Phone': numberController!.text,
                          'BirthDay':
                              "${yearController!.text}/${monthController!.text}/${dayController!.text}",
                          'Favorite Books': []
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('User registered')),
                        );
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                          return const LoginView();
                        }), (route) => false);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: ${e.toString()}')),
                        );
                      }
                      nameController!.clear();
                      emailController!.clear();
                      numberController!.clear();
                      passwordController!.clear();

                    }
                  }
                },
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('You Have An Account'),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ),
                          (route) => false,
                        );
                      },
                      child: const Text('Login'))
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
