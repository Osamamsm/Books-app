import 'package:final_project/views/about_app_view.dart';
import 'package:final_project/views/about_developer_view.dart';
import 'package:final_project/views/login_view.dart';
import 'package:final_project/widgets/books_categories_listview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.indigo,
          child: Column(
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Icon(
                      Icons.category,
                      size: 40,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Categories',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    icon: const Icon(Icons.arrow_drop_down),
                  )
                ],
              ),
              (isExpanded) ? const BooksCategoriesListview() : const SizedBox(),
            ],
          ),
        ),
        Container(
            height: 60,
            width: double.infinity,
            color: Colors.indigo[400],
            child: MaterialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AboutAppView();
                }));
              },
              child: const Text(
                'About App',
                style: TextStyle(fontSize: 20),
              ),
            )),
        Container(
            height: 60,
            width: double.infinity,
            color: Colors.indigo[300],
            child: MaterialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AboutDeveloperView();
                }));
              },
              child: const Text(
                'About Developer',
                style: TextStyle(fontSize: 20),
              ),
            )),
        Container(
            height: 60,
            color: Colors.indigo[100],
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return const LoginView();
                }), (route) => false);
              },
              child: const Text(
                'Log Out',
                style: TextStyle(fontSize: 20),
              ),
            ))
      ],
    );
  }
}
