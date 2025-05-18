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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFF121212),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontSize: 36, fontWeight: FontWeight.bold, letterSpacing: 1.2),
          headlineMedium: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.tealAccent),
          bodyMedium: TextStyle(fontSize: 16, height: 1.5, color: Colors.white70),
          bodyLarge:
              TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          headlineSmall: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.tealAccent),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.tealAccent.withOpacity(0.4),
                        blurRadius: 16,
                        spreadRadius: 1,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                ),
                const SizedBox(height: 20),

                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Colors.tealAccent, Colors.cyanAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: Text(
                    'Mohammed Mohammed Ali',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8),

                Text(
                  'Software Engineer | Flutter Developer',
                  style: theme.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                Text(
                  'I am a passionate mobile app developer specializing in Flutter. Experienced with Clean Architecture, Firebase, and building user-centric, performant apps.',
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 40),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '🎓 Education',
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                const SizedBox(height: 20),

                Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  children: const [
                    StudyCard(
                      title: 'Information Engineering',
                      description:
                          'Modern Technical University\nSpecialized in Information Systems and IT Engineering.\nDuration: 4 years',
                    ),
                    StudyCard(
                      title: 'Fullstack Mobile Diploma',
                      description:
                          'Advanced course in mobile app development using Flutter and Firebase.\nCourse Duration: 6 months',
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '📬 Contact Me',
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                const SizedBox(height: 12),

                ContactLink(
                  label: 'Email',
                  link: 'mailto:mohammedaliabomhde@example.com',
                  displayText: 'mohammedaliabomhde@example.com',
                  onTap: () => _openUrl('mailto:mohammedaliabomhde@example.com'),
                ),
                ContactLink(
                  label: 'GitHub',
                  link: 'https://github.com/engmohammedali',
                  displayText: 'github.com/engmohammedali',
                  onTap: () => _openUrl('https://github.com/engmohammedali'),
                ),
                ContactLink(
                  label: 'LinkedIn',
                  link: 'https://www.linkedin.com/in/mohammed-ali-5a04b82ba/',
                  displayText: 'linkedin.com/in/mohammed-ali-5a04b82ba',
                  onTap: () =>
                      _openUrl('https://www.linkedin.com/in/mohammed-ali-5a04b82ba/'),
                ),
                ContactLink(
                  label: 'WhatsApp',
                  link: 'https://wa.me/37060683712',
                  displayText: '+370 60683712',
                  onTap: () => _openUrl('https://wa.me/37060683712'),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StudyCard extends StatelessWidget {
  final String title;
  final String description;

  const StudyCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Card(
        color: const Color(0xFF1E1E1E),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: 320,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.tealAccent),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 14),
              Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactLink extends StatelessWidget {
  final String label;
  final String link;
  final String displayText;
  final VoidCallback onTap;

  const ContactLink({
    super.key,
    required this.label,
    required this.link,
    required this.displayText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.teal.withOpacity(0.15),
          border: Border.all(color: Colors.tealAccent.withOpacity(0.4)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(_iconForLabel(label), color: Colors.tealAccent),
            const SizedBox(width: 12),
            Text(
              '$label: ',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.tealAccent),
            ),
            Flexible(
              child: Text(
                displayText,
                style: const TextStyle(
                    decoration: TextDecoration.underline, color: Colors.blueAccent),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _iconForLabel(String label) {
    switch (label.toLowerCase()) {
      case 'email':
        return Icons.email_outlined;
      case 'github':
        return Icons.code;
      case 'linkedin':
        return Icons.business;
      case 'whatsapp':
        return Icons.chat_bubble_outline;
      default:
        return Icons.link;
    }
  }
}
