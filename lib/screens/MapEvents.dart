import 'package:flutter/material.dart';

class Mapevents extends StatefulWidget {
  const Mapevents({super.key});

  @override
  State<Mapevents> createState() => _MapeventsState();
}

class _MapeventsState extends State<Mapevents> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              // Search Bar
              Expanded(
                child: TextField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xFFA20E20),
                        width: 2.0,
                      ),
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Filter Button
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.filter_alt,
                    color: Color(0xFFA20E20),
                    size: 25,
                  ),
                  onPressed: () {
                    print("Filter icon pressed");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          // Collapse card on tapping outside
          if (isExpanded) {
            setState(() {
              isExpanded = false;
            });
          }
        },
        child: Stack(
          children: [
            // Map Placeholder
            Container(
              height: double.infinity,
              color: Colors.grey.shade300,
              child: Center(
                child: Text(
                  'Map Placeholder',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ),
            ),
            // Event Details Overlay
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  // Prevent collapsing when tapping inside
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: isExpanded
                      ? MediaQuery.of(context).size.height * 0.7
                      : 270,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and Address
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SUP\'COM',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Technological City of Communications, Raoued Road, Km 3.5 - 2083, Ariana, Tunisia',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Events List
                      Expanded(
                        child: ListView.builder(
                          itemCount: isExpanded ? 15 : 2,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/event_icon.png'),
                              ),
                              title: Text(
                                'Annual Forum',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text('13/11/2024 07:30 - 16:00'),
                              trailing: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  // Add to calendar or favorites
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      // "See All Events" Button
                      if (!isExpanded)
                        Center(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isExpanded = true;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Color(0xFFA20E20),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'See All Events',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
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
