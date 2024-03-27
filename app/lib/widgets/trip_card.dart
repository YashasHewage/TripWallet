import 'package:app/pages/Expences_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TripCard extends StatelessWidget {
  final Map<String, dynamic> tripData;

  TripCard(this.tripData);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const ExpencesState()));
      },
      child: Container(
        height: 197,
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/tripimage.png.jpg'),
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
                          margin: const EdgeInsets.only(left: 10, top: 8),
                          child: Text(
                            ' ${tripData['title']}',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 22.0, 
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
                            margin: const EdgeInsets.only(top: 2),
                            child: Row(
                              children: [
                                Text(
                                  ' ${tripData['start_date']}',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  ' ${tripData['end_date']}',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 13,
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
    );
  }
}
