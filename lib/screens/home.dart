import 'package:eventify/screens/EventInfo.dart';
import 'package:eventify/screens/MyEvents.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
// import 'functions/SearchBar.dart';

class Home extends StatefulWidget {
  static const routeName = '/Home_page';
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  // void _onSearch(String query) {
  //   print("Search query: $query");
  //   // Add your search logic here
  // }

  // void _onFilterPressed() {
  //   print("Filter icon pressed");
  //   // Add your filter logic here
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   title: Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 8.0),
      //     child: CustomSearchBar(
      //       onSearch: _onSearch,
      //       onFilterPressed: _onFilterPressed,
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //SearchBar Section
              Container(
                margin: EdgeInsets.only(bottom: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              // "I AM GOING TO:" Section
              const Text(
                "My Events",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              // Event List
              Column(
                      children: List.generate(4, (index) {
                        return EventItems(
                          eventName: 'Event $index',
                          eventDetails: '13/11/2024 07:30 -- 16:00',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventInfo(
                                    // eventName: 'Event $index',
                                    // eventDetails: 'Details about Event $index',
                                    ),
                              ),
                            );
                          },
                        );
                      }),
                    ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  //i will add an expanded card that will show the next 5 events
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA20E20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "See All Events",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              // Event Calendar Section
              const Text(
                "Event Calendar",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              content()
            ],
          ),
        ),
      ),
    );
  }

  Widget content() {
    return TableCalendar(
      headerStyle:
          const HeaderStyle(formatButtonVisible: true, titleCentered: true),
      availableGestures: AvailableGestures.all,
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
      selectedDayPredicate: (day) => isSameDay(day, today),
      onDaySelected: _onDaySelected,
      calendarStyle: const CalendarStyle(
        // Customizing the selected day circle
        selectedDecoration: BoxDecoration(
          color: Color(0xFFA20E20), // Change to your preferred color
          shape: BoxShape.circle,
        ),
        // Customizing the current day circle
        todayDecoration: BoxDecoration(
          color: Color.fromARGB(
              255, 27, 109, 30), // Change to your preferred color
          shape: BoxShape.circle,
        ),
        // Optionally, customize the text style
        selectedTextStyle: TextStyle(
          color: Colors.white, // Text color for the selected day
        ),
        todayTextStyle: TextStyle(
          color: Colors.white, // Text color for the current day
        ),
      ),
      calendarBuilders: CalendarBuilders(
        dowBuilder: (context, day) {
          if (day.weekday == DateTime.sunday) {
            final text = DateFormat.E().format(day);

            return Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}
