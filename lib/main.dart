import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/pages/home/home_page.dart';
import 'package:todo_app/provider/task_group_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://wvzossutukrwdduwnpmj.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind2em9zc3V0dWtyd2RkdXducG1qIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjgzOTU2MTUsImV4cCI6MjA0Mzk3MTYxNX0.vpQK9cf-DQGGC0bGMva1U6g8D_V7A81YvHUePRyM3qg',
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context) => TaskGroupProvider()..listTaskGroups())
    ],
    child: const MyApp(),
  )); // Multiprovider
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task APP',
      themeMode: ThemeMode.light,
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
