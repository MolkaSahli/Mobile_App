import 'package:eventify/screens/MyEvents.dart';
import 'package:eventify/screens/Profile.dart';
import 'package:eventify/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:eventify/screens/home.dart';
import 'package:eventify/screens/MapEvents.dart';
import 'package:eventify/screens/addEvent.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   if (Firebase.apps.isEmpty) {
//     await Firebase.initializeApp(
//       options: const FirebaseOptions(
//         apiKey: "AIzaSyCSjTBnE8jepNiIiLKikTqUvchHrMPUYQI",
//         appId: "com.example.eventify",
//         messagingSenderId: "987084638923",
//         projectId: "eventify-6e0f4",
//         authDomain: "eventify-6e0f4.firebaseapp.com",
//         storageBucket: "eventify-6e0f4.firebasestorage.app",
//       ),
//     );
//   }
//   else{
//      Firebase.app();
//    }
//   runApp(MyApp());
// }




void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ensure Firebase is initialized only once
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCSjTBnE8jepNiIiLKikTqUvchHrMPUYQI",
        appId: "com.example.eventify",
        messagingSenderId: "987084638923",
        projectId: "eventify-6e0f4",
        authDomain: "eventify-6e0f4.firebaseapp.com",
        storageBucket: "eventify-6e0f4.firebasestorage.app",
      ),
    );
  } catch (e) {
    // Log if Firebase is already initialized
    if (Firebase.apps.isNotEmpty) {
      debugPrint("Firebase already initialized: ${Firebase.app().name}");
    } else {
      debugPrint("Firebase initialization error: $e");
    }
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eventify',
      theme: ThemeData(useMaterial3: true),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Home(),
    const Mapevents(),
    const Addevent(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xFFA20E20), // Selected label color
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Events Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
