import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mohammed Mohammed Ali | Software Engineer',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Center(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                  'assets/profile.jpg',
                ), // Put your profile picture here
              ),
              const SizedBox(height: 16),
              const Text(
                'Mohammed Mohammed Ali',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Software Engineer | Flutter Developer',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 32),

              const Text(
                'I am a mobile app developer using Flutter. Experienced in Clean Architecture, Firebase, '
                'and enhancing user experience.\nI strive to build high-quality and user-friendly applications.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 32),
              Text(
                '📱 Projects',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),

              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: const [
                  ProjectCard(
                    title: 'Order App',
                    description:
                        'A restaurant order display system on tablets using Flutter and Firebase.',
                  ),
                  ProjectCard(
                    title: 'Educational Dashboard',
                    description:
                        'Manage institutes, teachers, and students using Flutter Web and Clean Architecture.',
                  ),
                ],
              ),

              const SizedBox(height: 32),
              Column(
                children: [
                  Text(
                    '📬 Contact Me',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap:
                        () => launchUrl(
                          Uri.parse('mailto:mohammedaliabomhde@example.com'),
                        ),
                    child: const Text(
                      'Email: mohammedaliabomhde@example.com',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  GestureDetector(
                    onTap:
                        () => launchUrl(
                          Uri.parse('https://github.com/engmohammedali'),
                        ),
                    child: const Text(
                      'GitHub: github.com/engmohammedali',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  GestureDetector(
                    onTap:
                        () => launchUrl(
                          Uri.parse(
                            'https://www.linkedin.com/in/mohammed-ali-5a04b82ba/',
                          ),
                        ),
                    child: const Text(
                      'LinkedIn: linkedin.com/in/mohammed-ali-5a04b82ba',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  GestureDetector(
                    onTap:
                        () => launchUrl(
                          Uri.parse('https://wa.me/37060683712'),
                          mode: LaunchMode.externalApplication,
                        ),
                    child: const Text(
                      'WhatsApp: +370 60683712',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
