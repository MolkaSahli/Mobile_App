import 'package:eventify/screens/EditCard.dart';
import 'package:flutter/material.dart';
import 'package:eventify/screens/MapEvents.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Container(
          width: 300,
          // height: 800,
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // CircleAvatar(
              //   radius: 150,
              //   backgroundImage: NetworkImage(
              //     'https://storage.googleapis.com/a1aa/image/vV8lIToUw4rOPpJvkDfzmfTngZsnrdShYbyjhtFoQWhAy05TA.jpg',
              //   ),
              // ),
              SizedBox(height: 25),
              _buildInfoRow("Full Name:", "Users"),
              _buildInfoRow("Email:", "User@gmail.tn"),
              _buildInfoRow("Phone number:", "+216 98 570 038"),
              _buildInfoRow("Birth Day:", "08/12/2002"),
              SizedBox(height: 70),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context, 
                    builder: (context) => Editcard(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color(0xFFA20E20), // Button color when not pressed
                  foregroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Edit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildInfoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            color: const Color.fromARGB(255, 121, 17, 17),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 17,
          ),
        ),
      ],
    ),
  );
}
