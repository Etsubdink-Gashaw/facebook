import 'package:flutter/material.dart';

class LanguageBar extends StatefulWidget {
  const LanguageBar({super.key});

  @override
  State<LanguageBar> createState() => _LanguageBarState();
}

class _LanguageBarState extends State<LanguageBar> {
  List<bool> _selected = [true, false, false, false, false];
  final List<String> _languages = [
    'English',
    'French',
    'Spanish',
    'Mandarin',
    'Portugese',
  ];
  void _onCheckboxSelected(int index) {
    setState(() {
      // Set all items to false
      _selected = _selected.map((e) => false).toList();
      // Set the selected item to true
      _selected[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Select your language',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _selected.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_languages[index]),
                  leading: Checkbox(
                    value: _selected[index],
                    onChanged: (bool? value) {
                      _onCheckboxSelected(index); // Handle the selection
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
