import 'package:flutter/material.dart';
import 'package:kilo_client_app/theme/resource/colors.dart';
import 'package:kilo_client_app/views/WhereToGo/select_map.dart';

class WhereToGoPage extends StatefulWidget {
  const WhereToGoPage({super.key});

  @override
  State<WhereToGoPage> createState() => _WhereToGoPageState();
}

class _WhereToGoPageState extends State<WhereToGoPage> {
  final TextEditingController _currentLocationController =
      TextEditingController(text: 'No (200), Pyay Road, Kamayut Tsp');
  bool isRecently = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        titleSpacing: -5,
        title: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: TextField(
            readOnly: true,
            controller: _currentLocationController,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
            decoration: InputDecoration(
              prefixIcon:
                  const Icon(Icons.location_on_outlined, color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Where to go and Add button
          Padding(
            padding:
                const EdgeInsets.only(right: 10, left: 50, top: 8, bottom: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectMapPage()));
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Where to go?',
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 14),
                      prefixIcon:
                          const Icon(Icons.map_outlined, color: Colors.grey),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectMapPage()));
                  },
                  icon: const Icon(
                    Icons.add_box_outlined,
                    color: PRIMARY_COLOR,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // Tab Buttons for Recently and Saved Locations
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isRecently = true;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    decoration: BoxDecoration(
                      color: isRecently ? PRIMARY_COLOR : Colors.white,
                      border: Border.all(
                        color:
                            isRecently ? PRIMARY_COLOR : Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      'Recently',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: isRecently ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isRecently = false;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    decoration: BoxDecoration(
                      color: !isRecently ? PRIMARY_COLOR : Colors.white,
                      border: Border.all(
                        color:
                            !isRecently ? PRIMARY_COLOR : Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      'Saved Locations',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: !isRecently ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content based on tab selection
          Expanded(
            child: isRecently ? _buildRecentlyTab() : _buildSavedLocationsTab(),
          ),
          // Next button
          if (isRecently)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: PRIMARY_COLOR,
                  minimumSize:
                      const Size(double.infinity, 50), // Full-width button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  // Handle Next button click
                },
                child: const Text(
                  "Next",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRecentlyTab() {
    final List<Map<String, String>> locations = [
      {
        "title": "Office",
        "address": "No (200), Pyay Road, Kamaryut Tsp",
      },
      {
        "title": "Home",
        "address": "No (2), Zayarthin Road, North Dagon",
      },
      {
        "title": "Junction City",
        "address": "QSH3+JJP, Corner of & ",
      },
    ];

    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) {
        final location = locations[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ListTile(
                leading:
                    Icon(Icons.location_on_outlined, color: Colors.yellow[700]),
                title: Text(
                  location["title"]!,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  location["address"]!,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                trailing: const Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ),
                onTap: () {
                  // Handle location selection
                },
              ),
              Divider(
                color: Colors.grey[200],
                indent: 30,
                endIndent: 30,
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildSavedLocationsTab() {
    final List<Map<String, dynamic>> locations = [
      {
        "icon": Icons.business_center_outlined,
        "title": "Office",
        "address": "No (200), Pyay Road, Kamaryut Tsp",
      },
      {
        "icon": Icons.home_outlined,
        "title": "Home",
        "address": "No (2), Zayarthin Road, North Dagon",
      },
      {
        "icon": Icons.location_on_outlined,
        "title": "Junction City",
        "address": "QSH3+JJP, Corner of & ",
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              saveLocationBox(Icons.add, 'Add New'),
              saveLocationBox(Icons.home_outlined, 'Add Home'),
              saveLocationBox(Icons.business_center_outlined, 'Add Office'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              final location = locations[index];
              return Column(
                children: [
                  ListTile(
                    leading: Icon(
                      location["icon"],
                      color: Colors.grey.shade600,
                    ),
                    title: Text(
                      location["title"]!,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      location["address"]!,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    trailing: const Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      // Handle location selection
                    },
                  ),
                  Divider(
                    color: Colors.grey[200],
                    indent: 30,
                    endIndent: 30,
                  )
                ],
              );
            },
          ))
        ],
      ),
    );
  }

  Widget saveLocationBox(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.blue,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            text,
            style: const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
