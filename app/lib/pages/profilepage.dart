import 'package:app/pages/login_page.dart';
import 'package:app/services/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/settingsWidgets/profile_header.dart';
import 'package:app/widgets/settingsWidgets/ProfileMenuOptions.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = false;
  void logout() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));

    final _authService = UserService();
    _authService.signOut();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: isLoading
          ? const CircularProgressIndicator() // Added parentheses here
          : SingleChildScrollView(
              child: Column(
                children: [
                  const ProfileHeader(),
                  const ProfileMenuOptions(),
                  const SizedBox(height: 20),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
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
