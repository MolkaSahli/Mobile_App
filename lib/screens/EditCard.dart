import 'package:flutter/material.dart';

class Editcard extends StatefulWidget {
  const Editcard({super.key});

  @override
  State<Editcard> createState() => _EditcardState();
}

class _EditcardState extends State<Editcard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        insetPadding: EdgeInsets.symmetric(vertical: 125),
        title: Center(child: Text("Edit your profile")),
        content: Form(
            child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Full Name',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color.fromRGBO(232, 34, 59, 1)),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color.fromRGBO(232, 34, 59, 1)),
                  borderRadius: BorderRadius.circular(12)),
              labelText: 'Update Your Name',
              labelStyle: const TextStyle(
                  fontSize: 14, color: Color.fromRGBO(0, 0, 0, 0.8)),
            )),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Email',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color.fromRGBO(232, 34, 59, 1)),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color.fromRGBO(232, 34, 59, 1)),
                  borderRadius: BorderRadius.circular(12)),
              labelText: 'Update Your Email',
              labelStyle: const TextStyle(
                  fontSize: 14, color: Color.fromRGBO(0, 0, 0, 0.8)),
            )),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Phone Number',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color.fromRGBO(232, 34, 59, 1)),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color.fromRGBO(232, 34, 59, 1)),
                  borderRadius: BorderRadius.circular(12)),
              labelText: 'Update Your Phone Number',
              labelStyle: const TextStyle(
                  fontSize: 14, color: Color.fromRGBO(0, 0, 0, 0.8)),
            )),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Birth Date',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color.fromRGBO(232, 34, 59, 1)),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color.fromRGBO(232, 34, 59, 1)),
                  borderRadius: BorderRadius.circular(12)),
              labelText: 'Update Your Birth Date',
              labelStyle: const TextStyle(
                  fontSize: 14, color: Color.fromRGBO(0, 0, 0, 0.8)),
            )),
          ],
        )),
        actions: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color(0xFFA20E20), // Button color when not pressed
                    foregroundColor: Colors.white,
      
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                    onPressed: () {},
                    child: Text('Submit')),
                    ElevatedButton(onPressed :() => Navigator.pop(context), child: Text('Cancel'),
                    style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color.fromARGB(255, 97, 97, 97), // Button color when not pressed
                    foregroundColor: Colors.white,
      
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                    )
              ],
            ),
          )
        ],
      ),
    );
  }
}
