import 'package:flutter/material.dart';
import 'package:kilo_client_app/theme/resource/colors.dart';
import 'package:kilo_client_app/views/WhereToGo/where_to_go.dart';

class ClientHomepage extends StatefulWidget {
  const ClientHomepage({super.key});

  @override
  State<ClientHomepage> createState() => _ClientHomepageState();
}

class _ClientHomepageState extends State<ClientHomepage> {
  bool isRecently = false;
  final List<Map<String, dynamic>> locations = [
    {"icon": Icons.refresh_outlined, "label": "Office"},
    {"icon": Icons.refresh_outlined, "label": "Home"},
    {"icon": Icons.refresh_outlined, "label": "Bogoke Market"},
    {"icon": Icons.refresh_outlined, "label": "City Mart"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/title_logo.png',
                        height: 40,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.help_outline),
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Greeting Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Morning!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Need a taxi John Doe?",
                    style: TextStyle(
                        // fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                splashColor: PRIMARY_COLOR.withOpacity(0.1),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WhereToGoPage()));
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10)),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child:
                                  Icon(Icons.map_outlined, color: Colors.grey),
                            ),
                            Expanded(
                                child: Text(
                              'Where to go ?',
                              style: TextStyle(
                                  // fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: PRIMARY_COLOR,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                      child: const Icon(Icons.search, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
                child: !isRecently
                    ? const Column()
                    : Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 26, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Recently",
                                  style: TextStyle(
                                      // fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'View All',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.blue),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child:
                                ListView.builder(itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  const ListTile(
                                    leading: Icon(Icons.location_on_outlined),
                                    title: Text(
                                      'Junction Square',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                    subtitle: Text(
                                      'No(200), Pyay Road, Kamayut Tsp',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    trailing: Icon(Icons.arrow_forward),
                                  ),
                                  Divider(
                                    thickness: 0.8,
                                    height: 5,
                                    color: Colors.grey[200],
                                    indent: 30,
                                    endIndent: 30,
                                  )
                                ],
                              );
                            }),
                          )
                        ],
                      )),
            // Illustration Section
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/car_bg.png',
                  // height: 180,
                ),
              ),
            ),
            // Recently Locations Section
            Container(
              width: double.infinity,
              height: 110,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(1, 1),
                        color: Colors.grey.shade300,
                        blurRadius: 10)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recently locations :",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isRecently = !isRecently;
                      });
                    },
                    child: !isRecently
                        ? const Text(
                            "You don’t have recently going.",
                            style: TextStyle(color: Colors.grey),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: locations
                                  .map((location) => _buildChip(location))
                                  .toList(),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(Map<String, dynamic> location) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(location["icon"], size: 18),
          const SizedBox(width: 5),
          Text(location["label"]),
        ],
      ),
    );
  }
}
