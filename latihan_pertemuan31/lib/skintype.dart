import 'dart:math';
import 'package:flutter/material.dart';


class SkinTypeQuizScreen extends StatefulWidget {
  @override
  _SkinTypeQuizScreenState createState() => _SkinTypeQuizScreenState();
}

class _SkinTypeQuizScreenState extends State<SkinTypeQuizScreen> {
  // menentukan pertanyaan dan opsi terkaitnya
  final List<String> questions = [
    "How often does your skin feel dry or tight?",
    "How often do you experience oiliness or shine on your skin?",
    "Do you have visible pores on your skin?",
    "How often do you experience breakouts or acne?",
    "How often do you experience redness or sensitivity on your skin?",
    // dapat menambahkan lebih banyak pertanyaan sesuai kebutuhan
  ];

  // menentukan opsi yang tersedia untuk setiap pertanyaan
  final List<List<String>> options = [
    ["Never", "Occasionally", "Frequently", "Always"],
    ["Never", "Occasionally", "Frequently", "Always"],
    ["No", "Small pores", "Moderate pores", "Large pores"],
    ["Never", "Occasionally", "Frequently", "Always"],
    ["Never", "Occasionally", "Frequently", "Always"],
    // Tambahkan lebih banyak opsi sesuai kebutuhan
  ];

  // untuk menentukan opsi yang dipilih untuk setiap pertanyaan
  List<String> selectedOptions = List.generate(5, (index) =>"null");

  void _onOptionSelected(int questionIndex, String option) {
    setState(() {
      selectedOptions[questionIndex] = option;
    });
  }

  void _onSubmit() {
    String skinType = _calculateSkinType();
    _showResultDialog(skinType);
  }

  String _calculateSkinType() {
    return ["Dry", "Oily", "Combination", "Sensitive"][Random().nextInt(4)];
  }

  void _showResultDialog(String skinType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Your Skin Type"),
          content: Text("Your skin type is $skinType."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
        ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
        padding: EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Text(
    "Skin Type Quiz",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
      SizedBox(height: 16),
      Expanded(
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${index + 1}. ${questions[index]}",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: options[index]
                      .map((option) => ChoiceChip(
                    label: Text(option),
                    selected: selectedOptions[index] == option,
                    onSelected: (selected) {
                      _onOptionSelected(index, option);
                    },
                  ))
                      .toList(),
                ),
                SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
      ElevatedButton(
        onPressed: _onSubmit,
        child: Text("Submit"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(243, 202, 146, 236), // Use hex code for button color
        ),
      ),
    ],
    ),
        ),
    );
  }
}