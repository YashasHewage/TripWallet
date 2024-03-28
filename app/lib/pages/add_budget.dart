import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BudgetPage extends StatefulWidget {
  final String totalBudget;

  const BudgetPage({Key? key, required this.totalBudget}) : super(key: key);

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  String? _selectedCurrency = 'LKR';
  final TextEditingController _budgetController = TextEditingController();
  List<String> budgets = []; // Maintain a list of budget values

  // Function to calculate the total budget sumf
  String calculateTotalBudget() {
    double total = 0;
    for (String budget in budgets) {
      total += double.tryParse(budget.substring(3)) ??
          0; // Parse and sum the numeric part of each budget
    }
    return total.toStringAsFixed(2); // Format total with 2 decimal places
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 20.0),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Add Budget',
          style: GoogleFonts.poppins(
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              margin:
                  const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: DropdownButton<String>(
                      value: _selectedCurrency,
                      iconSize: 24,
                      elevation: 16,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.grey,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCurrency = newValue!;
                        });
                      },
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
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: _selectedCurrency == value
                                  ? Colors.black
                                  : Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Text(
                    calculateTotalBudget(), // Display total budget
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 92, 92, 92),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40.0,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 204, 204, 204),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                controller: _budgetController,
                keyboardType: TextInputType.number,
                cursorHeight: 20.0,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your budget',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color.fromARGB(255, 87, 87, 87),
                  ),
                  contentPadding: const EdgeInsets.only(bottom: 12, left: 15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 48, 48, 48), width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.only(top: 40.0, bottom: 40.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      budgets.add(_selectedCurrency! +
                          _budgetController.text); // Add new budget to the list
                      _budgetController
                          .clear(); // Clear the text field after adding
                    });
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(
                      const Size(35, 30),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFF213660),
                    ),
                    padding: MaterialStateProperty.all(const EdgeInsets.only(
                        left: 50, right: 50, top: 10, bottom: 10)),
                  ),
                  child: Text(
                    "Add Budget",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: budgets.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Card(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Record ',
                              style: GoogleFonts.poppins(fontSize: 10.0),
                            ),
                            Text(
                              'Budget amount added',
                              style: GoogleFonts.poppins(
                                fontSize: 10.0,
                                color: const Color.fromARGB(255, 163, 163, 163),
                              ),
                            ),
                            Text(
                              budgets[
                                  index], // Display the budget from the list
                              style: GoogleFonts.poppins(fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
