import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kilo_client_app/theme/resource/colors.dart';
import 'package:kilo_client_app/views/WhereToGo/add_new_location.dart';
import 'package:latlong2/latlong.dart';

class SelectMapPage extends StatefulWidget {
  const SelectMapPage({super.key});

  @override
  State<SelectMapPage> createState() => _SelectMapPageState();
}

class _SelectMapPageState extends State<SelectMapPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select From the Map'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
              decoration: InputDecoration(
                hintText: 'Enter a location',
                hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                fillColor: Colors.grey.shade100,
                filled: true,
                prefixIcon:
                    const Icon(Icons.location_on_outlined, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
              child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              FlutterMap(
                  options: const MapOptions(
                    initialCenter: LatLng(16.8395368, 95.8518913),
                    initialZoom: 15,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(markers: [
                      Marker(
                        point: const LatLng(16.8395368, 95.8518913),
                        width: 40,
                        height: 40,
                        child: Image.asset('assets/images/location_pin.png'),
                      )
                    ]),
                  ]),
              Positioned(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: _selectedIndex == index
                                      ? const Color(0xFFFFFADD)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = index;
                                  });
                                },
                                selected: _selectedIndex == index,
                                title: const Text(
                                  'Near Main Street, North Okkalapa, Yangon',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                subtitle: const Text(
                                  'Main Street, North Okalapa, Yangon',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                ),
                              ),
                            );
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: PRIMARY_COLOR,
                          minimumSize: const Size(
                              double.infinity, 50), // Full-width button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddNewLocation()));
                        },
                        child: const Text(
                          "Select",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
