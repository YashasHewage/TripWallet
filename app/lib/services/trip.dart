import 'package:cloud_firestore/cloud_firestore.dart';

class TripService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createTrip(Trip trip) {
    return _db.collection('trips').doc(trip.id).set(trip.toFirestore());
  }

  Future<Trip> getTrip(String id) async {
    var doc = await _db.collection('trips').doc(id).get();
    return Trip.fromFirestore(doc);
  }

  Future<List<Trip>> getTrips() async {
    var snapshot = await _db.collection('trips').get();
    return snapshot.docs.map((doc) => Trip.fromFirestore(doc)).toList();
  }

  Future<void> updateTrip(Trip trip) {
    return _db.collection('trips').doc(trip.id).update(trip.toFirestore());
  }

  Future<void> deleteTrip(String id) {
    return _db.collection('trips').doc(id).delete();
  }
}

class Trip {
  final String id;
  final String country;
  final DateTime startDate;
  final DateTime endDate;
  final double budget;

  Trip({
    required this.id,
    required this.country,
    required this.startDate,
    required this.endDate,
    required this.budget,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'country': country,
      'startDate': startDate,
      'endDate': endDate,
      'budget': budget,
    };
  }

  factory Trip.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Trip(
      id: doc.id,
      country: data['country'],
      startDate: (data['startDate'] as Timestamp).toDate(),
      endDate: (data['endDate'] as Timestamp).toDate(),
      budget: data['budget'],
    );
  }
}