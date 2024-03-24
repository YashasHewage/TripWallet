import 'package:flutter/material.dart';
import 'package:app/widgets/settingsWidgets/defult.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Background
        Image.asset(
          'assets/settingsbackground.png',
          fit: BoxFit.cover,
          height: 300,
          width: double.infinity,
        ),

        /// Content
        Column(
          children: [
            Center(
              child: AppBar(
                leading: Transform.scale(
                  scale: 0.8, 
                  child: const BackButton(
                    color: Color.fromARGB(255, 255, 255, 255), // Change this to your desired color
                  ),
                ),
                title:  Text(
                  'Profile',
                  style: GoogleFonts.poppins(), 
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
                titleTextStyle:
                    GoogleFonts.poppins( 
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
              ),
            ),
            const _UserData(),
            Container(
              height: 100,
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: AppDefaults.borderRadius,
                boxShadow: AppDefaults.boxShadow,
              ),
              child: GestureDetector(
                onTap: () {
                  print("Row tapped!");
                  // Add your onTap functionality here
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Image.asset(
                            'assets/Group2.png',
                            width: 60,
                            height: 60,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                      Navigator.pushNamed(context, '/addtrip');
                      },
                      child: Text(
                        'View all',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //const ProfileHeaderOptions()
          ],
        ),
      ],
    );
  }
}

class _UserData extends StatelessWidget {
  const _UserData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const SizedBox(width: AppDefaults.padding),
          SizedBox(
            width: 100,
            height: 100,
            child: ClipOval(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset('assets/profile_pic.png'),
              ),
            ),
          ),
          const SizedBox(width: AppDefaults.padding),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Navishka Malage',
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'User ID: 22224',
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
