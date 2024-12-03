import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu, color: Colors.black),
        actions: const [
          Icon(Icons.search, color: Colors.black),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // "I AM GOING TO:" Section
              const Text(
                "I AM GOING TO:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, 
                ),
              ),
              const SizedBox(height: 10),
              // Event List
              Column(
                children: List.generate(2, (index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/event_image.png', // Replace with your image path
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: const Text(
                        'Annual Forum',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: const Text('13/11/2024 07:30 -- 16:00'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.more_vert),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Navigate to all events page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Text("See All Events"),
                ),
              ),
              const SizedBox(height: 20),
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
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios),
                            onPressed: () {},
                          ),
                          const Text(
                            "January 2023",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward_ios),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                        ),
                        itemCount: 31,
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: index == 6
                                  ? Colors.redAccent
                                  : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                color: index == 6 ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
