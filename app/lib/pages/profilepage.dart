import 'package:flutter/material.dart';
import 'package:app/widgets/settingsWidgets/profile_header.dart';
import 'package:app/widgets/settingsWidgets/ProfileMenuOptions.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          const ProfileHeader(),
          const ProfileMenuOptions(),
          const SizedBox(
              height:
                  20), // Add space between the ProfileMenuOptions and the Login button
          ElevatedButton(
            onPressed: () {
              // Add your login function here
            },
            child: Text(
              'Logout',
              style: const TextStyle(fontSize: 20,color: Colors.white),
              
              ),
            style: ElevatedButton.styleFrom(
              backgroundColor:const Color.fromRGBO(249, 73, 73, 1), // Set the button color as needed
              textStyle: const TextStyle(
                  color: Colors.white), // Set the text color as needed
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    10), // Set the border radius as needed
              ),
              minimumSize: const Size(385,
                  60), // Make the button full width and 50 pixels high
              alignment: Alignment.center, // Center the text in the button
            ),
          ),
        ],
      ),
    );
  }
}
