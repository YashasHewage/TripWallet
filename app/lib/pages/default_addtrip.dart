// ignore_for_file: use_super_parameters
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // Import the 'intl' package

class Addtrip extends StatefulWidget {
  const Addtrip({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddtripState createState() => _AddtripState();
}

class _AddtripState extends State<Addtrip> {
  DateTime? _selectedDate;

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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 40),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/logo.png'),
                      )),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0, bottom: 40),
                    child: CircleAvatar(
                      radius: 20, // adjust the size as needed
                      backgroundImage: AssetImage('assets/profile_pic.png'),
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
                      height: 1, // height should be greater than 0
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
                      height: 1.5, // height should be greater than 0
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
              Container(
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
                          height: 65,
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
                                        const EdgeInsets.only(left: 10, top: 4),
                                    child: Text(
                                      'Add Trip',
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
                                child: Row(children: <Widget>[
                                  
                                  Container(
                                    margin:
                                        const EdgeInsets.only(top: 1),
                                    child: Text(
                                      'Set date',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          )),
                    ),
                  ],
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
              bottom: 10, // Increase this value to move the icon up
              child: IconButton(
                icon: const Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ),
            Positioned(
              right: 20,
              bottom: 10, // Increase this value to move the icon up
              child: IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
