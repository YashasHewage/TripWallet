import 'package:flutter/material.dart';
import 'package:app/widgets/settingsWidgets/defult.dart';

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
                title: const Text('Profile'),
                elevation: 0,
                backgroundColor: Colors.transparent,
                titleTextStyle:
                    Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
              ),
            ),
            const _UserData(),
            Container(
              
              height: 120,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: AppDefaults.borderRadius,
                boxShadow: AppDefaults.boxShadow,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                      
                        'assets/Group2.png', // Replace with the path to your icon
                        width: 80, // Adjust as needed
                        height: 80, // Adjust as needed
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to a different page
                    },
                    child: const Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 16, // Adjust as needed
                        color: Colors.black54, // Adjust as needed
                      ),
                    ),
                  ),
                ],
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
      padding: const EdgeInsets.all(AppDefaults.padding),
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
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                'User ID: 22224',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
