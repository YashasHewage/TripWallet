import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(
              top: 4.0), // Add margin top to the leading icon
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios,
                color: Colors.black), // Arrowhead icon
            onPressed: () {
              Navigator.of(context)
                  .pop(); // Navigate back when the button is pressed
            },
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(
              top: 4.0), // Add margin top to the title text
          child: Text(
            "About Us",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400, // Set font weight to 400
            ),
          ),
        ),
        centerTitle: true, // Center align the title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/aboutus.png', // Replace with your image asset path
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: 16), // Add some space between image and text
            Text(
              'TRIPWALLET 1.0',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, // Make the text bold
                fontSize: 16,
              ),
              textAlign: TextAlign.center, // Center align the text
            ),
            SizedBox(height: 16), // Add some space between text and next text
            Align(
              alignment: Alignment.centerLeft, // Align left
              child: Text(
                'Crafted with passion and precision, our travel expense money managing app is more than just a tool – it\'s your companion on every financial adventure. At Travel Wallet, we believe in simplifying the complexities of travel expenses, empowering you to focus on the moments that matter. Our dedicated team is committed to delivering a seamless experience, ensuring your financial journey is as memorable as the destinations you explore. Join us as we redefine travel finance. Welcome to a world where managing money meets the joy of travel!',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AboutUsPage(),
  ));
}
