import 'package:app/pages/default_addtrip.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'trip_card.dart';


class TripForm extends StatefulWidget {
  const TripForm({Key? key}) : super(key: key);

  @override
  _TripFormState createState() => _TripFormState();
}

String? _selectedCurrency;

class _TripFormState extends State<TripForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 198,
              margin: const EdgeInsets.only(bottom: 15),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/tripimage.png.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(23),
                  bottomRight: Radius.circular(23),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 220),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      controller: _titleController,
                      cursorColor: const Color.fromARGB(255, 63, 63, 63),
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        hintText: 'Trip Title',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        errorStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 17, 0)),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                      style: GoogleFonts.poppins(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),

                   // Currency Text
                    Text(
                      'Currency',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // Currency Dropdown
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(10, 3),
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCurrency = null;
                          });
                        },
                        child: _selectedCurrency == null
                            ? Container(
                                height:50,
                                child: DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  // hint: Text(
                                  //   'Select the currency',
                                  //   style: GoogleFonts.poppins(),
                                  // ),
                                  value: _selectedCurrency,
                                  items: <String>[
                                    'USD',
                                    'EUR',
                                    'JPY',
                                    'GBP',
                                    'AUD',
                                    'CAD',
                                    'CHF',
                                    'CNY',
                                    'SEK',
                                    'NZD',
                                    'MXN',
                                    'SGD',
                                    'HKD',
                                    'NOK',
                                    'KRW',
                                    'TRY',
                                    'RUB',
                                    'INR',
                                    'BRL',
                                    'ZAR',
                                    'SAR',
                                    'AED',
                                    'CZK',
                                    'IDR',
                                    'MYR',
                                    'CLP',
                                    'PHP',
                                    'COP',
                                    'DKK',
                                    'ILS',
                                    'PLN',
                                    'THB',
                                    'TWD',
                                    'ARS',
                                    'IRR',
                                    'VND',
                                    'ISK',
                                    'EGP',
                                    'NGN',
                                    'KES',
                                    'UAH',
                                    'PEN',
                                    'LKR',
                                    'KWD',
                                    'QAR',
                                    'BDT',
                                    'TWD',
                                    'ZAR',
                                    'HUF',
                                    'BHD',
                                    'OMR',
                                    'RON',
                                    'GTQ',
                                    'HRK',
                                    'CRC',
                                    'UYU',
                                    'PAB',
                                    'BOB',
                                    'DOP',
                                    'PYG',
                                    'NIO',
                                    'HNL',
                                    'ISK',
                                    'GEL',
                                    'UZS',
                                    'BAM',
                                    'MKD',
                                    'BWP',
                                    'NAD',
                                    'JMD',
                                    'AMD',
                                    'ALL',
                                    'TND',
                                    'GHS',
                                    'AZN',
                                    'FJD',
                                    'BZD',
                                    'BND',
                                    'JOD',
                                    'ZMW',
                                    'LBP',
                                    'SCR',
                                    'MUR',
                                    'AWG',
                                    'BBD',
                                    'BMD',
                                    'BSD',
                                    'TTD',
                                    'XCD',
                                    'FKP',
                                    'SBD',
                                    'AUD',
                                    'TVD',
                                    'KID',
                                    'NPR',
                                    'XCD',
                                    'CVE',
                                    'MVR',
                                    'SZL',
                                    'UZS',
                                    'MRU',
                                    'LYD',
                                    'SYP',
                                    'LAK',
                                    'PAB',
                                    'CUP',
                                    'XCD',
                                    'GYD',
                                    'FJD',
                                    'XCD',
                                    'XCD',
                                    'XCD',
                                    'GBP',
                                    'PRB',
                                    'RUB',
                                    'WST',
                                    'LSL',
                                    'MWK',
                                    'MRO',
                                    'CDF',
                                    'SHP',
                                    'TJS',
                                    'KGS',
                                    'MGA',
                                    'ERN',
                                    'CUP',
                                    'SRD',
                                    'YER',
                                    'KMF',
                                    'KPW',
                                    'LYD',
                                    'SYP',
                                    'LAK',
                                    'PAB',
                                    'CUP',
                                    'XCD',
                                    'GYD',
                                    'FJD',
                                    'XCD',
                                    'XCD',
                                    'XCD',
                                    'GBP',
                                    'PRB',
                                    'RUB',
                                    'WST',
                                    'LSL',
                                    'MWK',
                                    'MRO',
                                    'CDF',
                                    'SHP',
                                    'TJS',
                                    'KGS',
                                    'MGA',
                                    'ERN',
                                    'KPW',
                                    'TWD',
                                    'RSD',
                                    'SDG',
                                    'SSP',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedCurrency = newValue;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select a currency';
                                    }
                                    return null;
                                  },
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  '$_selectedCurrency',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: const Color.fromARGB(
                                        255, 104, 103, 103),
                                  ),
                                ),
                              ),
                      ),
                    ),

                    // Budget Text Field
                    TextFormField(
                      controller: _budgetController,
                      cursorColor: const Color.fromARGB(255, 63, 63, 63),
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        labelText: 'Budget',
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        errorStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 17, 0)),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedErrorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      style: GoogleFonts.poppins(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a budget';
                        }
                        return null;
                      },
                    ),
                    // Start Date Picker
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Start Date',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (pickedDate != null) {
                                setState(() {
                                  _startDateController.text =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Please select a start date')),
                                );
                              }
                            },
                            child: _startDateController.text.isEmpty
                                ? const Icon(Icons.calendar_today,
                                    size: 20,
                                    color: Color.fromARGB(255, 75, 75, 75))
                                : Text(_startDateController.text),
                          ),
                        ],
                      ),
                    ),
                    // End Date Picker
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'End Date',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              setState(() {
                                _endDateController.text =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Please select an end date')),
                              );
                            }
                          },
                          child: _endDateController.text.isEmpty
                              ? const Icon(Icons.calendar_today,
                                  size: 20,
                                  color: Color.fromARGB(255, 75, 75, 75))
                              : Text(_endDateController.text),
                        ),
                      ],
                    ),

                    Container(
                      margin: const EdgeInsets.only(top: 150),
                      child: Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _saveTrip();
                            }
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all(
                              const Size(350, 60),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF213660),
                            ),
                          ),
                          child: Text(
                            "Save",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveTrip() async {
    final title = _titleController.text;
    final budget = _budgetController.text;
    final currency = _selectedCurrency;
    final startDate = _startDateController.text;
    final endDate = _endDateController.text;

    // Save data 
    try {
      await FirebaseFirestore.instance.collection('trips').add({
        'title': title,
        'currency': currency,
        'budget': budget,
        'start_date': startDate,
        'end_date': endDate,
      });


      // Retrieve trip details 
    final tripSnapshot = await FirebaseFirestore.instance.collection('trips').get();
    final tripData = tripSnapshot.docs.last.data();

      //Success message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          children: <Widget>[
            const Icon(Icons.check, color: Colors.green),
            const SizedBox(width: 20),
            Text(
              'Trip saved successfully!',
              style: GoogleFonts.poppins(), 
            ),
          ],
        ),
      ));

      _titleController.clear();
      _selectedCurrency = '';
      _budgetController.clear();
      _startDateController.clear();
      _endDateController.clear();

         // Pass trip data to trip card
   Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => Addtrip(tripDataList: [tripData]), 
  ),
);

    } catch (e) {
      print('Error saving trip: $e');
      // error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          children: <Widget>[
            const Icon(Icons.close, color: Colors.red),
            const SizedBox(width: 20),
            Text(
              'Error saving trip. Please try again later.',
              style: GoogleFonts.poppins(), 
            ),
          ],
        ),
      ));
    }
  }
}
