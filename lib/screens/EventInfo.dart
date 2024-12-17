import 'package:eventify/main.dart';
import 'package:eventify/screens/MyEvents.dart';
import 'package:flutter/material.dart';

class EventInfo extends StatefulWidget {
  const EventInfo({super.key});

  @override
  State<EventInfo> createState() => _EventInfoState();
}

class _EventInfoState extends State<EventInfo> {
  bool isFavorited = false;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Header image with logo and title
            Stack(
              children: [
                Container(
                  height: 350,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('Mobile_App/assets/MSI.png'), // Add your image in assets
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 20,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MainPage()),
                      );
                    },
                  ),
                ),
              ],
            ),

            // Main content card
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded; // Toggle card expansion
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'X-Ops Space Forum',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Exploring ML, Development and Security Galaxies',
                          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                        ),
                        const SizedBox(height: 20),

                        // Location, date, and time details
                        const Row(
                          children: [
                            Icon(Icons.location_on, color: Color(0xFFA20E20)),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'SUPCOM, Route Raod, Km 3.5 - 2083, Ariana, Tunisia.',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            Icon(Icons.access_time, color: Color(0xFFA20E20)),
                            SizedBox(width: 10),
                            Text(
                              '13/11/2024 - 07:30 — 16:00',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // About section
                        const Text(
                          'About',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                          style: TextStyle(color: Colors.grey[800]),
                          maxLines: isExpanded ? null : 3, // Show limited lines if not expanded
                          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 20),

                        if (isExpanded) ...[
                          // Organizer and event link (only visible when expanded)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Organizer',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              ),
                              const Text('Team SUPCOM'),
                              const SizedBox(height: 10),
                              Text(
                                'Event Link',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              ),
                              const Text(
                                'forum.supcom.tn',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],

                        // Buttons
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add action for Register Now
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFA20E20),
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  'Register Now',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isFavorited = !isFavorited; // Toggle the state
                                });
                              },
                              icon: Icon(
                                isFavorited ? Icons.favorite : Icons.favorite_border,
                                color: const Color(0xFFA20E20),
                              ),
                              iconSize: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
