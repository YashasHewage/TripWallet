import 'package:flutter/material.dart';
import 'package:app/widgets/settingsWidgets/profile_header.dart';
import 'package:app/widgets/settingsWidgets/ProfileMenuOptions.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: SingleChildScrollView( // Added SingleChildScrollView
        child: Column(
          children: [
            const ProfileHeader(),
            const ProfileMenuOptions(),
            const SizedBox(height: 20), 
            Container(
              margin: const EdgeInsets.only(left: 20, right:20, bottom: 20), 
              child: ElevatedButton(
                onPressed: () {
                },
                child: Text(
                  'Logout',
                  style: const TextStyle(fontSize: 20,color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:const Color.fromRGBO(249, 73, 73, 1), 
                  textStyle: const TextStyle(
                      color: Colors.white), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10),
                  ),
                  minimumSize: const Size(385, 60),
                  alignment: Alignment.center, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
