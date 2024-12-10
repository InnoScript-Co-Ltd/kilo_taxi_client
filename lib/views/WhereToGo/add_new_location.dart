import 'package:flutter/material.dart';
import 'package:kilo_client_app/theme/resource/colors.dart';
import 'package:kilo_client_app/views/WhereToGo/select_map.dart';

class AddNewLocation extends StatefulWidget {
  const AddNewLocation({super.key});

  @override
  State<AddNewLocation> createState() => _AddNewLocationState();
}

class _AddNewLocationState extends State<AddNewLocation> {
  TextEditingController placeNameController = TextEditingController();
  TextEditingController locationController =
      TextEditingController(text: 'Near Main Street, North Okkalapa, Yangon');

  bool _isPlaceNameNotEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New to save'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: placeNameController,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _isPlaceNameNotEmpty = value.isNotEmpty;
                      });
                    },
                    decoration: InputDecoration(
                      label: const Text('Place Name'),
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      suffixIcon: _isPlaceNameNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.cancel_outlined,
                                  color: Colors.grey[700]),
                              onPressed: () {
                                setState(() {
                                  placeNameController.clear();
                                  _isPlaceNameNotEmpty = false;
                                });
                              },
                            )
                          : null,
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
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: locationController,
                    readOnly: true,
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SelectMapPage()));
                      });
                    },
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _isPlaceNameNotEmpty = value.isNotEmpty;
                      });
                    },
                    decoration: InputDecoration(
                      label: const Text('Location'),
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      suffixIcon: IconButton(
                        icon:
                            Icon(Icons.arrow_forward, color: Colors.grey[700]),
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SelectMapPage()));
                          });
                        },
                      ),
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
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: placeNameController.text.isNotEmpty
                    ? PRIMARY_COLOR
                    : const Color.fromARGB(255, 255, 244, 183),
                minimumSize:
                    const Size(double.infinity, 50), // Full-width button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text(
                "Submit",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
