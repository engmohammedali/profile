import 'package:flutter/material.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'محمد محم علي| مهندس برمجيات',
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
                backgroundImage: AssetImage('assets/profile.jpg'), // ضع صورتك هنا
              ),
              const SizedBox(height: 16),
              const Text(
                'محمد محمد علي',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const Text(
                'مهندس برمجيات | مطوّر Flutter',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 32),

              const Text(
                'أنا مطور تطبيقات موبايل باستخدام Flutter. أمتلك خبرة في Clean Architecture، Firebase،'
                ' وتحسين تجربة المستخدم.\nأطمح لصناعة تطبيقات ذات جودة عالية وسهلة الاستخدام.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 32),
              Text(
                '📱 المشاريع',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),

              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: const [
                  ProjectCard(
                    title: 'تطبيق الطلبات',
                    description: 'نظام عرض طلبات للمطاعم على التابلت باستخدام Flutter وFirebase.',
                  ),
                  ProjectCard(
                    title: 'لوحة تحكم تعليمية',
                    description: 'إدارة معاهد دراسية ومعلمين وطلاب باستخدام Flutter Web وClean Architecture.',
                  ),
                ],
              ),

              const SizedBox(height: 32),
              Text(
                '📬 تواصل معي',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text('Email: mohammedaliabomhde@example.com'),
              Text('GitHub: github.com/mohamed2003'),
              Text('LinkedIn: linkedin.com/in/mohamed2003'),
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
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(description, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
