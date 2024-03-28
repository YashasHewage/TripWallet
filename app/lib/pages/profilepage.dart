import 'package:flutter/material.dart';
import 'package:app/widgets/settingsWidgets/profile_header.dart';
import 'package:app/widgets/settingsWidgets/ProfileMenuOptions.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoding = false;

  void logout() async {
    setState(() {
      isLoding = true;
    });

    await Future.delayed(const Duration(seconds: 2));
    print('logout');


    setState(() {
      isLoding = false;
    }); 
    Navigator.of(context).pushReplacementNamed('/loginpage');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: isLoding
          ? const Center(
              child: SizedBox(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.purple), // or another color
                  backgroundColor: Colors.grey,
                ),
              ),
            )
          : SingleChildScrollView(
              // Added SingleChildScrollView
              child: Column(
                children: [
                  const ProfileHeader(),
                  const ProfileMenuOptions(),
                  const SizedBox(height: 20),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        logout();
                       
                      },
                      child: Text(
                        'Logout',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(249, 73, 73, 1),
                        textStyle: const TextStyle(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
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
