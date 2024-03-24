import 'package:flutter/material.dart';
import 'package:app/widgets/settingsWidgets/defult.dart';
import 'package:flutter/widgets.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final void Function() onTap;
  final String title;

  static const Map<String, IconData> titleToIcon = {
    'Profile': Icons.person,
    'Language settings': Icons.settings,
    'About us': Icons.info_outline,
    'Pirvacy policy': Icons.privacy_tip_outlined,
    'feedback': Icons.feedback,
  };

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppDefaults.borderRadius,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(titleToIcon[title] ?? Icons.error),
              const SizedBox(width: 16),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.black),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuOptions extends StatelessWidget {
  const ProfileMenuOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppDefaults.padding),
      padding: const EdgeInsets.all(AppDefaults.padding),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppDefaults.boxShadow,
        borderRadius: AppDefaults.borderRadius,
      ),
      child: Column(
        children: [
          ProfileListTile(
            title: 'Profile',
            onTap: () {
              Navigator.pushNamed(context, '/profileEdit');
            },
          ),
          const Divider(thickness: 0.1),
          ProfileListTile(
            title: 'Language settings',
            onTap: () {
               Navigator.pushNamed(context, '/languages');
            },
          ),
          const Divider(thickness: 0.1),
          ProfileListTile(
            title: 'About us',
            onTap: () {
                             Navigator.pushNamed(context, '/aboutus');

            },
          ),
          const Divider(thickness: 0.1),
          ProfileListTile(
            title: 'Pirvacy policy',
            onTap: () => {},
          ),
          const Divider(thickness: 0.1),
          ProfileListTile(
            title: 'feedback',
            onTap: () => {},
          ),
          const SizedBox(
              height:
                  20), // Add space between the last item and the logout button
        ],
      ),
    );
  }
}
