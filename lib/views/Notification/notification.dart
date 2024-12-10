import 'package:flutter/material.dart';
import 'package:kilo_client_app/views/Notification/notification_detail.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
          bottom: TabBar(
            tabAlignment: TabAlignment.start,
            dividerColor: Colors.grey[200],
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            tabs: const [
              Tab(text: "New"),
              Tab(text: "Ride Updates"),
              Tab(text: "Promotional Alerts"),
              Tab(text: "Payment"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            newTabBar(),
            const Center(child: Text("Ride Updates")),
            const Center(child: Text("Promotional Alerts")),
            const Center(child: Text("Payment")),
          ],
        ),
      ),
    );
  }

  Widget newTabBar() {
    final List<Map<String, dynamic>> items = [
      {
        "icon": "assets/images/car_icon.png",
        "title": "Cancel by Driver",
        "subtitle": "Driver has requested a ride cancellation.",
        "time": "8:39 AM",
        "page": const NotificationDetail()
      },
      {
        "icon": "assets/images/car_icon.png",
        "title": "Ride is on the way",
        "subtitle": "Your ride will arrive in 5 minutes",
        "time": "9:15 AM",
        "page": const NotificationDetail()
      },
      {
        "icon": "assets/images/promotion.png",
        "title": "Promotion",
        "subtitle": "50% off your next ride",
        "time": "Yesterday",
        "page": const NotificationDetail()
      },
      {
        "icon": "assets/images/payment.png",
        "title": "Payment Notification",
        "subtitle": "Your payment method was charged for \$45",
        "time": "3 days ago",
        "page": const NotificationDetail()
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            decoration: BoxDecoration(
              color: Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => item["page"]),
              ),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFF5EDE6),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.asset(item["icon"], width: 30, height: 30),
              ),
              title: Text(
                item["title"],
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              subtitle: Text(
                item["subtitle"],
                maxLines: 1,
                overflow: TextOverflow.visible,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.brown,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                item["time"],
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.brown,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
