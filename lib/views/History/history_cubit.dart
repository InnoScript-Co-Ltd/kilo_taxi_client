import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryModel {
  final String code;
  final String time;
  final String startLocation;
  final String endLocation;
  final String fare;

  HistoryModel({
    required this.code,
    required this.time,
    required this.startLocation,
    required this.endLocation,
    required this.fare,
  });
}

class HistoryCubit extends Cubit<List<HistoryModel>> {
  HistoryCubit()
      : super([
          HistoryModel(
            code: "CC 5045",
            time: "1 Feb 2024 8:00 AM",
            startLocation: "Hledan",
            endLocation: "North Okkalapa",
            fare: "8,000 MMK",
          ),
          HistoryModel(
            code: 'BB 2222',
            time: "20 Jan 2024 9:00 AM",
            startLocation: "North Okkalapa",
            endLocation: "Botahtaung Pagoda",
            fare: "10,000 MMK",
          ),
        ]);

  void filterTrips(String filter) {
    // Simulate filtering logic if needed
    emit(state);
  }
}
