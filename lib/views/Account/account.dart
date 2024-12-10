import 'package:flutter/material.dart';
import 'package:kilo_client_app/views/Account/logout.dart';
import 'package:kilo_client_app/views/Account/profile_information.dart';
import 'package:kilo_client_app/views/Account/rate_us.dart';

class ClientAccountPage extends StatelessWidget {
  const ClientAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> accountOptions = [
      {
        "icon": Icons.person_2_outlined,
        "title": "Profile information",
        "subtitle": "Change your account information",
        "page": const ProfileInformation(),
      },
      {
        "icon": Icons.star_half,
        "title": "Rate us",
        "subtitle": "Rate our app on Play Store",
        "page": const RateUsPage(),
      },
      {
        "icon": Icons.logout_outlined,
        "title": "Logout",
        "subtitle": "Logout of your account",
        "page": const LogoutPage(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/human.png',
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Bryan Li',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '+959123456789',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Account Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),
            ...accountOptions.map((option) => _buildListTile(context, option)),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, Map<String, dynamic> option) {
    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => option["page"]),
      ),
      leading: Icon(
        option["icon"],
        size: 30,
        color: Colors.grey.shade600,
      ),
      title: Text(
        option["title"],
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        option["subtitle"],
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey,
      ),
    );
  }
}
