// ignore_for_file: use_super_parameters, unused_local_variable, unused_field, unused_import, curly_braces_in_flow_control_structures, unused_element, unnecessary_import
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // Import the 'intl' package

class Trip {
  final String name;

  Trip(this.name);
}

class Addtrip extends StatefulWidget {
  const Addtrip({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddtripState createState() => _AddtripState();
}

class _AddtripState extends State<Addtrip> {
  DateTime? _selectedDate;
  String? _tripName;
  DateTime? _startDate;
  DateTime? _endDate;
  final List<Trip> _trips = [
    Trip('Colombo'),
    Trip('Kandy'),
    Trip('USA'),
  ];

  List<Trip> _filteredTrips = [];
  final TextEditingController _controller = TextEditingController();

  get database => null;

  // void fetchTripData() async {
  //   // Fetch the trip data
  //   var tripData =
  //       await database.getTripData(); // Replace with actual database

  //   // Update the state
  //   setState(() {
  //     _tripName = tripData.name;
  //     _startDate = tripData.startDate;
  //     _endDate = tripData.endDate;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   fetchTripData();
  // }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  void _addTrip(String name) {
    setState(() {
      _trips.add(Trip(name));
      _filteredTrips = _trips;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Two images
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 40),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/logo.png'),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, bottom: 40),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/settings');
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/profile_pic.png'),
                      ),
                    ),
                  ),
                ],
              ),

              // Hello Text
              Padding(
                padding: const EdgeInsets.only(left: 20),
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
                    'What are you looking for?',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF909090),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ),
              ),

              // Search bar
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 40),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      //search bar
                      child: Container(
                        width: 350,
                        height: 47,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFEFEFEF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: TextField(
                            controller: _controller,
                            onChanged: (value) {
                              setState(() {
                                // ignore: no_leading_underscores_for_local_identifiers
                                var _filteredTrips = _trips
                                    .where((trip) => trip.name
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                    .toList();
                              });
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search here',
                              contentPadding:
                                  EdgeInsets.only(top: 12, left: 15),
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(Icons.search,
                                    color: Colors.black54, size: 22.0),
                              ),
                            ),
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Add trip card
              GestureDetector(
  onTap: () {
    Navigator.pushNamed(context, '/expencespage');
  },
  child: Container(
    height: 197,
    margin: const EdgeInsets.only(
        left: 20.0, right: 20.0, bottom: 20.0),
    decoration: BoxDecoration(
      image: const DecorationImage(
        image: AssetImage('assets/dashboard_image1.png'),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Stack(
      children: <Widget>[
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              children: <Widget>[
                //add trip
                Row(
                  children: <Widget>[
                    const SizedBox(width: 5),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 10, top: 8),
                      child: Text(
                        _tripName ?? 'Add Trip',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ],
                ),

                //date

                Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 1),
                        child: Row(
                          children: [
                            Text(
                              _startDate != null
                                  ? DateFormat('yyyy-MM-dd')
                                      .format(_startDate!)
                                  : 'Set date',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _endDate != null
                                  ? DateFormat('yyyy-MM-dd')
                                      .format(_endDate!)
                                  : 'Set date',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
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
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
