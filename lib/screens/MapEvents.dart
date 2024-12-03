import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'functions/SearchBar.dart';

class Mapevents extends StatefulWidget {
  const Mapevents({super.key});

  @override
  State<Mapevents> createState() => _MapeventsState();
}

class _MapeventsState extends State<Mapevents> {
  bool isExpanded = false;

  void _onSearch(String query) {
    print("Search query: $query");
    // Add your search logic here
  }

  void _onFilterPressed() {
    print("Filter icon pressed");
    // Add your filter logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomSearchBar(
            onSearch: _onSearch,
            onFilterPressed: _onFilterPressed,
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
            content(),
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
                    borderRadius: const BorderRadius.only(
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
                  child: Stack(
                    children: [
                      // Content inside the card
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title and Address
                          const Padding(
                            padding: EdgeInsets.all(16.0),
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
                                SizedBox(height: 5),
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
                                  leading: const CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/event_icon.png'),
                                  ),
                                  title: const Text(
                                    'Annual Forum',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle:
                                      const Text('13/11/2024 07:30 - 16:00'),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.add),
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
                                    color: const Color(0xFFA20E20),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
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
                      // Close Button
                      Positioned(
                        top: 10,
                        right: 10,
                        child: IconButton(
                          icon: const Icon(Icons.close, color: Colors.black54),
                          onPressed: () {
                            setState(() {
                              isExpanded = false;
                            });
                          },
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

Widget content() {
  return FlutterMap(
    options: const MapOptions(
      initialCenter: LatLng(36.89199956170213, 10.187730981774003),
      initialZoom: 11,
      interactionOptions:
          InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom),
    ),
    children: [
      openStreetMapTileLater,
      MarkerLayer(markers: [
        Marker(
          point: const LatLng(36.89199956170213, 10.187730981774003),
          width: 60,
          height: 60,
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.location_pin,
              size: 60,
              color: Color(0xFFA20E20),
            ),
          ),
        ),
      ]),
    ],
  );
}

TileLayer get openStreetMapTileLater => TileLayer(
      urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
      subdomains: const ['a', 'b', 'c'], // OpenStreetMap's subdomains
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
