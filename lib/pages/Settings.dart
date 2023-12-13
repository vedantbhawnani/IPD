import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<Settings> {
  bool _locationTrackingEnabled = true;
  int _mapType = 1; // 1: Standard, 2: Satellite, etc.
  String _navigationVoice = 'Female';
  Color _mapThemeColor = Colors.blue;

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _locationTrackingEnabled = prefs.getBool('locationTracking') ?? true;
      _mapType = prefs.getInt('mapType') ?? 1;
      _navigationVoice = prefs.getString('navigationVoice') ?? 'Female';
      _mapThemeColor =
          Color(prefs.getInt('mapThemeColor') ?? Colors.blue.value);
    });
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('locationTracking', _locationTrackingEnabled);
    prefs.setInt('mapType', _mapType);
    prefs.setString('navigationVoice', _navigationVoice);
    prefs.setInt('mapThemeColor', _mapThemeColor.value);
  }

  void _clearData() async {
    // Implement data clearing logic for search history or saved locations
    // Show confirmation dialog and handle potential errors
    // ...
  }

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Enable Location Tracking'),
            value: _locationTrackingEnabled,
            onChanged: (value) =>
                setState(() => _locationTrackingEnabled = value),
          ),
          DropdownButtonFormField(
            value: _mapType,
            items: const [
              DropdownMenuItem(value: 1, child: Text('Standard')),
              DropdownMenuItem(value: 2, child: Text('Satellite')),
              // ... other options
            ],
            onChanged: (value) => setState(() => _mapType = value as int),
            decoration: InputDecoration(
              labelText: 'Map Type',
            ),
          ),
          DropdownButtonFormField(
            value: _navigationVoice,
            items: const [
              DropdownMenuItem(value: 'Female', child: Text('Female Voice')),
              DropdownMenuItem(value: 'Male', child: Text('Male Voice')),
              // ... other options
            ],
            onChanged: (value) =>
                setState(() => _navigationVoice = value as String),
            decoration: InputDecoration(
              labelText: 'Navigation Voice',
            ),
          ),
          // Map Theme Preview Pane
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Map Theme Preview'),
            ),
          ),
          // Update this pane dynamically based on map type and theme color
          // ...
          ElevatedButton(
            onPressed: _saveSettings,
            child: Text('Save Settings'),
          ),
          // Clear Data Button
          ElevatedButton(
            onPressed: _clearData,
            child: Text('Clear Data'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
            ),
          ),
          // About Section
          ExpansionTile(
            title: Text('About'),
            children: [
              Text('App Version: 1.0.0'),
              Text('Contact: support@yourapp.com'),
              Text('Privacy Policy: https://yourapp.com/privacy'),
            ],
          ),
        ],
      ),
    );
  }
}
