// // ignore_for_file: unnecessary_string_interpolations

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class AddTripPopup extends StatefulWidget {
//   const AddTripPopup({Key? key}) : super(key: key);

//   @override
//   State<AddTripPopup> createState() => _AddTripPageState();
// }

// class _AddTripPageState extends State<AddTripPopup> {
//   late DateTime _startDate;
//   late DateTime _endDate;

//   @override
//   void initState() {
//     super.initState();
//     _startDate = DateTime.now();
//     _endDate = DateTime.now();
//   }

//   Future<void> _selectStartDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _startDate,
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null && picked != _startDate) {
//       setState(() {
//         _startDate = picked;
//       });
//     }
//   }

//   Future<void> _selectEndDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _endDate,
//       firstDate: _startDate,
//       lastDate: DateTime(2100),
//     );
//     if (picked != null && picked != _endDate) {
//       setState(() {
//         _endDate = picked;
//       });
//     }
//   }

//   TextEditingController _textEditingController = TextEditingController();

//   double currencyValue = 0.0;

//   void editCurrencyValue() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Edit Currency'),
//           content: TextFormField(
//             controller: _textEditingController,
//             keyboardType: TextInputType.numberWithOptions(decimal: true),
//             decoration: InputDecoration(labelText: 'Enter new value'),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 // Close the dialog
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 // Update the currency value
//                 setState(() {
//                   currencyValue =
//                       double.tryParse(_textEditingController.text) ?? 0.0;
//                 });
//                 // Close the dialog
//                 Navigator.of(context).pop();
//               },
//               child: Text('Save'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   //list of countries
//   String? _selectedCountry;

//   List<String> countries = [
//     // List of countries
//     'Afghanistan',
//     'Albania',
//     'Algeria',
//     'Andorra',
//     'Angola',
//     'Antigua and Barbuda',
//     'Argentina',
//     'Armenia',
//     'Australia',
//     'Austria',
//     'Azerbaijan',
//     'Bahamas',
//     'Bahrain',
//     'Bangladesh',
//     'Barbados',
//     'Belarus',
//     'Belgium',
//     'Belize',
//     'Benin',
//     'Bhutan',
//     'Bolivia',
//     'Bosnia and Herzegovina',
//     'Botswana',
//     'Brazil',
//     'Brunei',
//     'Bulgaria',
//     'Burkina Faso',
//     'Burundi',
//     'Cabo Verde',
//     'Cambodia',
//     'Cameroon',
//     'Canada',
//     'Central African Republic',
//     'Chad',
//     'Chile',
//     'China',
//     'Colombia',
//     'Comoros',
//     'Congo, Democratic Republic of the',
//     'Congo, Republic of the',
//     'Costa Rica',
//     'Croatia',
//     'Cuba',
//     'Cyprus',
//     'Czech Republic',
//     'Denmark',
//     'Djibouti',
//     'Dominica',
//     'Dominican Republic',
//     'Ecuador',
//     'Egypt',
//     'El Salvador',
//     'Equatorial Guinea',
//     'Eritrea',
//     'Estonia',
//     'Eswatini',
//     'Ethiopia',
//     'Fiji',
//     'Finland',
//     'France',
//     'Gabon',
//     'Gambia',
//     'Georgia',
//     'Germany',
//     'Ghana',
//     'Greece',
//     'Grenada',
//     'Guatemala',
//     'Guinea',
//     'Guinea-Bissau',
//     'Guyana',
//     'Haiti',
//     'Honduras',
//     'Hungary',
//     'Iceland',
//     'India',
//     'Indonesia',
//     'Iran',
//     'Iraq',
//     'Ireland',
//     'Israel',
//     'Italy',
//     'Jamaica',
//     'Japan',
//     'Jordan',
//     'Kazakhstan',
//     'Kenya',
//     'Kiribati',
//     'Korea, North',
//     'Korea, South',
//     'Kosovo',
//     'Kuwait',
//     'Kyrgyzstan',
//     'Laos',
//     'Latvia',
//     'Lebanon',
//     'Lesotho',
//     'Liberia',
//     'Libya',
//     'Liechtenstein',
//     'Lithuania',
//     'Luxembourg',
//     'Madagascar',
//     'Malawi',
//     'Malaysia',
//     'Maldives',
//     'Mali',
//     'Malta',
//     'Marshall Islands',
//     'Mauritania',
//     'Mauritius',
//     'Mexico',
//     'Micronesia',
//     'Moldova',
//     'Monaco',
//     'Mongolia',
//     'Montenegro',
//     'Morocco',
//     'Mozambique',
//     'Myanmar',
//     'Namibia',
//     'Nauru',
//     'Nepal',
//     'Netherlands',
//     'New Zealand',
//     'Nicaragua',
//     'Niger',
//     'Nigeria',
//     'North Macedonia',
//     'Norway',
//     'Oman',
//     'Pakistan',
//     'Palau',
//     'Palestine',
//     'Panama',
//     'Papua New Guinea',
//     'Paraguay',
//     'Peru',
//     'Philippines',
//     'Poland',
//     'Portugal',
//     'Qatar',
//     'Romania',
//     'Russia',
//     'Rwanda',
//     'Saint Kitts and Nevis',
//     'Saint Lucia',
//     'Saint Vincent and the Grenadines',
//     'Samoa',
//     'San Marino',
//     'Sao Tome and Principe',
//     'Saudi Arabia',
//     'Senegal',
//     'Serbia',
//     'Seychelles',
//     'Sierra Leone',
//     'Singapore',
//     'Slovakia',
//     'Slovenia',
//     'Solomon Islands',
//     'Somalia',
//     'South Africa',
//     'South Sudan',
//     'Spain',
//     'Sri Lanka',
//     'Sudan',
//     'Suriname',
//     'Sweden',
//     'Switzerland',
//     'Syria',
//     'Taiwan',
//     'Tajikistan',
//     'Tanzania',
//     'Thailand',
//     'Timor-Leste',
//     'Togo',
//     'Tonga',
//     'Trinidad and Tobago',
//     'Tunisia',
//     'Turkey',
//     'Turkmenistan',
//     'Tuvalu',
//     'Uganda',
//     'Ukraine',
//     'United Arab Emirates',
//     'United Kingdom',
//     'United States',
//     'Uruguay',
//     'Uzbekistan',
//     'Vanuatu',
//     'Vatican City',
//     'Venezuela',
//     'Vietnam',
//     'Yemen',
//     'Zambia',
//     'Zimbabwe'
//   ];

//   String? _selectedCurrency;

//   List<String> currency = [
//     // List of currencies
//     'USD',
//     'EUR',
//     'JPY',
//     'GBP',
//     'AUD',
//     'CAD',
//     'CHF',
//     'CNY',
//     'SEK',
//     'NZD',
//     'MXN',
//     'SGD',
//     'HKD',
//     'NOK',
//     'KRW',
//     'TRY',
//     'RUB',
//     'INR',
//     'BRL',
//     'ZAR',
//     'SAR',
//     'AED',
//     'CZK',
//     'IDR',
//     'MYR',
//     'CLP',
//     'PHP',
//     'COP',
//     'DKK',
//     'ILS',
//     'PLN',
//     'THB',
//     'TWD',
//     'ARS',
//     'IRR',
//     'VND',
//     'ISK',
//     'EGP',
//     'NGN',
//     'KES',
//     'UAH',
//     'PEN',
//     'LKR',
//     'KWD',
//     'QAR',
//     'BDT',
//     'TWD',
//     'ZAR',
//     'HUF',
//     'BHD',
//     'OMR',
//     'RON',
//     'GTQ',
//     'HRK',
//     'CRC',
//     'UYU',
//     'PAB',
//     'BOB',
//     'DOP',
//     'PYG',
//     'NIO',
//     'HNL',
//     'ISK',
//     'GEL',
//     'UZS',
//     'BAM',
//     'MKD',
//     'BWP',
//     'NAD',
//     'JMD',
//     'AMD',
//     'ALL',
//     'TND',
//     'GHS',
//     'AZN',
//     'FJD',
//     'BZD',
//     'BND',
//     'JOD',
//     'ZMW',
//     'LBP',
//     'SCR',
//     'MUR',
//     'AWG',
//     'BBD',
//     'BMD',
//     'BSD',
//     'TTD',
//     'XCD',
//     'FKP',
//     'SBD',
//     'AUD',
//     'TVD',
//     'KID',
//     'NPR',
//     'XCD',
//     'CVE',
//     'MVR',
//     'SZL',
//     'UZS',
//     'MRU',
//     'LYD',
//     'SYP',
//     'LAK',
//     'PAB',
//     'CUP',
//     'XCD',
//     'GYD',
//     'FJD',
//     'XCD',
//     'XCD',
//     'XCD',
//     'GBP',
//     'PRB',
//     'RUB',
//     'WST',
//     'LSL',
//     'MWK',
//     'MRO',
//     'CDF',
//     'SHP',
//     'TJS',
//     'KGS',
//     'MGA',
//     'ERN',
//     'CUP',
//     'SRD',
//     'YER',
//     'KMF',
//     'KPW',
//     'LYD',
//     'SYP',
//     'LAK',
//     'PAB',
//     'CUP',
//     'XCD',
//     'GYD',
//     'FJD',
//     'XCD',
//     'XCD',
//     'XCD',
//     'GBP',
//     'PRB',
//     'RUB',
//     'WST',
//     'LSL',
//     'MWK',
//     'MRO',
//     'CDF',
//     'SHP',
//     'TJS',
//     'KGS',
//     'MGA',
//     'ERN',
//     'KPW',
//     'TWD',
//     'RSD',
//     'SDG',
//     'SSP',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 width: double.infinity,
//                 height: 200,
//                 child: Image.asset('assets/tripcard.png'),
//               ),
//               Align(
//                 alignment: Alignment.topRight,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Add functionality for the button here
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor:
//                           Colors.white, // Set background color to black
//                     ),
//                     child: const Text(
//                       'Edit Cover',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'Country',
//                 style: TextStyle(fontSize: 18.0),
//               ),
//               const SizedBox(height: 8),
//               DropdownButtonFormField<String>(
//                 value: _selectedCountry,
//                 hint: const Text("Select Country"),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _selectedCountry = newValue;
//                   });
//                 },
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//                 ),
//                 items: countries.map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'Currency',
//                 style: TextStyle(fontSize: 18.0),
//               ),
//               const SizedBox(height: 8),
//               DropdownButtonFormField<String>(
//                 value: _selectedCurrency,
//                 hint: const Text("Select Currency"),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _selectedCurrency = newValue;
//                   });
//                 },
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//                 ),
//                 items: currency.map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text('Start Date:', style: TextStyle(fontSize: 16)),
//                   Expanded(
//                     child: Center(
//                       child: Text(
//                         '${DateFormat('yyyy-MM-dd').format(_startDate)}',
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () => _selectStartDate(context),
//                     child: const Text('Select Start Date'),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text('End Date:', style: TextStyle(fontSize: 16)),
//                   Expanded(
//                     child: Center(
//                       child: Text(
//                         '${DateFormat('yyyy-MM-dd').format(_endDate)}',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () => _selectEndDate(context),
//                     child: Text('  Select End Date'),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //   children: [
//               //     Text(
//               //       'Budget : $currencyValue',
//               //       style: TextStyle(fontSize: 20.0),
//               //     ),
//               //     ElevatedButton(
//               //       onPressed: () {
//               //         editCurrencyValue();
//               //       },
//               //       child: Text('Edit'),
//               //     ),
//               //   ],
//               // ),
//               SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//       // Button to save changes
//       floatingActionButton: GestureDetector(
//         onTap: () {
//         },
//         child: FloatingActionButton.extended(
//           onPressed: () {
//                               Navigator.pushNamed(context, '/expencespage');

//           },
//           label: Text('Save Changes', style: TextStyle(color: Colors.white)),
//           backgroundColor: const Color.fromARGB(255, 12, 61, 102),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
