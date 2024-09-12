import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutDeveloperView extends StatefulWidget {
  const AboutDeveloperView({super.key});

  @override
  State<AboutDeveloperView> createState() => _AboutDeveloperViewState();
}

class _AboutDeveloperViewState extends State<AboutDeveloperView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Developer',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.indigo[100],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Name : Osama Mohamed Selim',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Socials : ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await launchUrl(
                        Uri.parse(
                            'https://www.facebook.com/share/ddWUh7w57TKyzRxn/?mibextid=qi2Omg'),
                      );
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.facebook,
                          size: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text('Osama Selim'),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await launchUrl(
                        Uri.parse('https://github.com/Osamamsm'),
                      );
                    },
                    child: const Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.github,
                          size: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text('Osamamsm'),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await launchUrl(
                        Uri.parse('whatsapp://send?phone=+201010787657'),
                      );
                    },
                    child: const Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.whatsapp,
                          size: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text('Osama Selim'),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
