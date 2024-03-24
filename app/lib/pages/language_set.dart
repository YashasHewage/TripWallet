import 'package:flutter/material.dart';

class LanguageSettingsPage extends StatelessWidget {
  const LanguageSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('language Settings'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Column(
            children:  [
              _SearchField(),
              
              _AllCountries(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AllCountries extends StatelessWidget {
  const _AllCountries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.0),
        
        Text('All Countries/Regions'),
        SizedBox(height: 16.0),
        ListTile(title: Text('English (United States)')),
        Divider(
          height: 1.0,
          thickness: 1.0,
        ),
        ListTile(title: Text('English (United Kingdom)')),
         Divider(
          height: 2.0,
          thickness: 1.0,
        ),
        ListTile(title: Text('Sinhala')),
         Divider(
          height: 2.0,
          thickness: 1.0,
        ),
        ListTile(title: Text('Spanish')),
          Divider(
          height: 2.0,
          thickness: 1.0,
        ),
        ListTile(title: Text('French')),
         Divider(
          height: 2.0,
          thickness: 1.0,
        ),
        ListTile(title: Text('German')),
        Divider(
          height: 2,
          thickness: 1.0,
        ),
        ListTile(title: Text('Hindi')),
      ],
    );
  }
}
class _SearchField extends StatelessWidget {
  const _SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0, // Adjust the height as needed
      width: double.infinity, // This will make the TextField take up all available horizontal space
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          labelText: 'search',
          hintText: 'Type a word',
          suffixIcon: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}