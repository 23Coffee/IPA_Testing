import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final bills = [
    {
      'createdDate': DateTime(2024, 7, 15),
      'dueDate': DateTime(2024, 8, 7),
      'amount': 5000,
      'fine': 1000,
      'status': 'Not Paid',
      'details': 'Electricity Bill for July 2024'
    },
    {
      'createdDate': DateTime(2024, 7, 10),
      'dueDate': DateTime(2024, 8, 10),
      'amount': 3000,
      'fine': 0,
      'status': 'On Time',
      'details': 'Water Bill for July 2024'
    },
    {
      'createdDate': DateTime(2024, 6, 20),
      'dueDate': DateTime(2024, 7, 30),
      'amount': 7000,
      'fine': 2000,
      'status': 'Late',
      'details': 'Internet Bill for June 2024'
    },
  ];

  final dateFormatter = DateFormat('yyyy-MM-dd'); // For consistent date formatting
  File? _uploadedSlip;
  int _selectedBillIndex = 0;

  Future<void> _pickSlip() async {
    if (!mounted) return;  // Check if widget is still mounted

    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _uploadedSlip = File(pickedFile.path);
      });
    }
  }

  void _submitPayment() {
    if (_uploadedSlip == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please upload the bank transfer slip.'),
        ),
      );
      return;
    }

    // Perform payment submission logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Payment submitted successfully!'),
      ),
    );

    Navigator.pop(context); // Close the dialog after submission
  }

  void _showSlipUploadSheet() {
    final selectedBill = bills[_selectedBillIndex] as Map<String, dynamic>;

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color.fromARGB(255, 31, 31, 31),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(  // Added SingleChildScrollView here
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Upload Bank Transfer Slip',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _uploadedSlip != null
                    ? Image.file(
                        _uploadedSlip!,
                        fit: BoxFit.cover,
                      )
                    : GestureDetector(
                        onTap: _pickSlip,
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 31, 31, 31),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.white54,
                              width: 1,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Tap to Upload Slip',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 16),
                Text(
                  'Bill Details:',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Created: ${DateFormat.yMd().format(selectedBill['createdDate'])}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Due: ${DateFormat.yMd().format(selectedBill['dueDate'])}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Amount: ${selectedBill['amount']} Baht',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '+${selectedBill['fine']} Baht Fine',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Sample Bank Account Details:',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Bank Name: Example Bank',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Account Number: 123-456-789',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Branch: Main Branch',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submitPayment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 31, 31, 31),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Submit Payment'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Close',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 31, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        elevation: 0,
        title: const Text(
          'Your Bills',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // List of Bills
            Expanded(
              child: ListView.builder(
                itemCount: bills.length,
                itemBuilder: (context, index) {
                  final bill = bills[index];
                  final createdDate = dateFormatter.format(bill['createdDate'] as DateTime);
                  final dueDate = dateFormatter.format(bill['dueDate'] as DateTime);
                  final status = bill['status'] as String;

                  return Card(
                    color: const Color.fromARGB(255, 39, 39, 39),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Created: $createdDate',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Due: $dueDate',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${bill['amount']} Baht',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '+${bill['fine']} Baht',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                status,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: status == 'Late'
                                      ? Colors.red
                                      : Colors.greenAccent,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _selectedBillIndex = index;
                                  _showSlipUploadSheet();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 31, 31, 31),
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text('Bill Details'),
                              ),
                            ],
                          ),
                        ],
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
