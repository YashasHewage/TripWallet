import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              // Name text field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              // Email text field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Change Password',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),

              // Password text field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'current Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),

              // New password field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'new password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'confim password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
               
                onPressed: () {
                  // Add your login function here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.blueGrey[900], // Set the button color as needed
                  textStyle: const TextStyle(
                      color: Colors.white), // Set the text color as needed
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // Set the border radius as needed
                  ),
                  minimumSize: const Size(
                      385, 60), // Make the button full width and 50 pixels high
                  alignment: Alignment.center, // Center the text in the button
                ),
                 child: const Text(
                  'Save Changes',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
