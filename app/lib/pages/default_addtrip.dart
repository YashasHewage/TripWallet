import 'package:app/pages/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'addtrip_data.dart'; // Importing the TripForm widget
import '../widgets/trip_card.dart';

class Trip {
  final String name;

  Trip(this.name);
}

class Addtrip extends StatefulWidget {
  final List<dynamic> tripDataList;

  const Addtrip({Key? key, required this.tripDataList}) : super(key: key);

  @override
  _AddtripState createState() => _AddtripState();
}

class _AddtripState extends State<Addtrip> {
  final List<Trip> _trips = [];
  List<Trip> _filteredTrips = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchTripData();
  }

  Future<void> _fetchTripData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('trips').get();

      setState(() {
        _trips.clear();
        _trips.addAll(querySnapshot.docs.map((doc) => Trip(doc['title'])));
        _filteredTrips = List.from(_trips);
      });
    } catch (e) {
      print('Error fetching trip data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/logo.png'),
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const ProfilePage()));
                    },
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/profile_pic.png'),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hello',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome to Trip Wallet!',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF909090),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 40, bottom: 40),
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const TripForm()));
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(
                      Size(350, 60),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFF213660),
                    ),
                  ),
                  child: Text(
                    "Add Trip",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),

            // Display Trip Cards
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.tripDataList.length,
              itemBuilder: (context, index) {
                return TripCard(widget.tripDataList[index]);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        children: <Widget>[
          BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0.0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SizedBox.shrink(),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SizedBox.shrink(),
                label: '',
              ),
            ],
          ),
          Positioned(
            left: 20,
            bottom: 10,
            child: IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
          Positioned(
            right: 20,
            bottom: 10,
            child: GestureDetector(
              child: IconButton(
                icon: const Icon(
                  Icons.settings_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ProfilePage()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
