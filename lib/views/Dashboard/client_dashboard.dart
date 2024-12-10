import 'package:flutter/material.dart';
import 'package:kilo_client_app/theme/resource/colors.dart';
import 'package:kilo_client_app/views/Account/account.dart';
import 'package:kilo_client_app/views/Client%20Home/client_homepage.dart';
import 'package:kilo_client_app/views/History/history.dart';
import 'package:kilo_client_app/views/Notification/notification.dart';
import 'package:url_launcher/url_launcher.dart';

class ClientDashboard extends StatefulWidget {
  const ClientDashboard({super.key});

  @override
  State<ClientDashboard> createState() => _ClientDashboardState();
}

class _ClientDashboardState extends State<ClientDashboard> {
  static final List<Widget> _screen = [
    const ClientHomepage(),
    const NotificationPage(),
    const HistoryPage(),
    const ClientAccountPage()
  ];

  int selectedIndex = 0;

  void _onTapItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildNavBarItem(Icons.home_filled, "Home", 0),
            buildNavBarItem(Icons.message_outlined, "Notification", 1),
            const SizedBox(
              width: 60,
            ),
            buildNavBarItem(Icons.history_outlined, "History", 2),
            buildNavBarItem(Icons.person_2_outlined, "Account", 3),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () => _showDaySelectionBottomSheet(context),
        child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: PRIMARY_COLOR,
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(1, 10), color: Colors.grey, blurRadius: 10)
                ]),
            child: Image.asset(
              'assets/images/car_icon.png',
              width: 30,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildNavBarItem(IconData icon, String label, int index) {
    return Expanded(
      child: InkWell(
        onTap: () => _onTapItem(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: selectedIndex == index ? Colors.black : Colors.grey,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: selectedIndex == index ? Colors.black : Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showDaySelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Select the booking type',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          launch('tel:09123456789');
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/phone_call.png',
                                height: 40,
                              ),
                              const SizedBox(height: 30),
                              const Text(
                                'On Call Booking',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/title_logo.png',
                                height: 40,
                              ),
                              const SizedBox(height: 30),
                              const Text(
                                'In App Booking',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.red),
                      )),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
