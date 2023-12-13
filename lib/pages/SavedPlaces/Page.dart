import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedPlacesPage extends StatefulWidget {
  @override
  _SavedPlacesPageState createState() => _SavedPlacesPageState();
}

class _SavedPlacesPageState extends State<SavedPlacesPage> {
  final _savedPlacesKey = 'savedPlaces';
  List<String> _savedPlaceNames = [];

  @override
  void initState() {
    super.initState();
    _loadSavedPlaces();
  }

  Future<void> _loadSavedPlaces() async {
    final prefs = await SharedPreferences.getInstance();
    final savedPlacesList = prefs.getStringList(_savedPlacesKey);
    if (savedPlacesList != null) {
      setState(() {
        _savedPlaceNames = savedPlacesList!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Places'),
      ),
      body: _savedPlaceNames.isEmpty
          ? Center(child: Text('No places saved yet'))
          : ListView.builder(
              itemCount: _savedPlaceNames.length,
              itemBuilder: (context, index) {
                final placeName = _savedPlaceNames[index];
                return Card(
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/map',
                      arguments: placeName, // Pass place name to map page
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(placeName),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
