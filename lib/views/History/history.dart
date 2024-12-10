import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kilo_client_app/views/History/history_cubit.dart';
import 'package:kilo_client_app/views/History/history_detail.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HistoryCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('History'),
        ),
        body: BlocBuilder<HistoryCubit, List<HistoryModel>>(
          builder: (context, trips) {
            if (trips.isEmpty) {
              return const Center(
                child: Text("No trips available"),
              );
            }

            return ListView.builder(
              itemCount: trips.length,
              itemBuilder: (context, index) {
                final trip = trips[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HistoryDetail()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    trip.code,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    trip.time,
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                              Text(
                                trip.fare,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.grey,
                            thickness: 0.3,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    const Icon(Icons.radio_button_checked,
                                        color: Colors.grey, size: 18),
                                    Container(
                                      height: 4,
                                      width: 1.5,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      height: 1.5,
                                    ),
                                    Container(
                                      height: 4,
                                      width: 1.5,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      height: 1.5,
                                    ),
                                    Container(
                                      height: 4,
                                      width: 1.5,
                                      color: Colors.grey,
                                    ),
                                    Icon(Icons.location_pin,
                                        color: Colors.red.shade300, size: 20),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        trip.startLocation,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            trip.endLocation,
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                          const Icon(
                                            Icons.arrow_forward,
                                            size: 20,
                                            color: Colors.black54,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
