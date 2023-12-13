import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _locationTrackingEnabled = true;
  int _mapType = 1; // 1: Standard, 2: Satellite, etc.
  String _navigationVoice = 'Female';

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _locationTrackingEnabled = prefs.getBool('locationTracking') ?? true;
      _mapType = prefs.getInt('mapType') ?? 1;
      _navigationVoice = prefs.getString('navigationVoice') ?? 'Female';
    });
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('locationTracking', _locationTrackingEnabled);
    prefs.setInt('mapType', _mapType);
    prefs.setString('navigationVoice', _navigationVoice);
  }

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Enable Location Tracking'),
            value: _locationTrackingEnabled,
            onChanged: (value) => setState(() {
              _locationTrackingEnabled = value;
            }),
          ),
          DropdownButtonFormField(
            value: _mapType,
            items: const [
              DropdownMenuItem(value: 1, child: Text('Standard')),
              DropdownMenuItem(value: 2, child: Text('Satellite')),
              // ... other options
            ],
            onChanged: (value) => setState(() {
              _mapType = value as int;
            }),
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
            onChanged: (value) => setState(() {
              _navigationVoice = value as String;
            }),
            decoration: InputDecoration(
              labelText: 'Navigation Voice',
            ),
          ),
          ElevatedButton(
            onPressed: _saveSettings,
            child: Text('Save Settings'),
          ),
        ],
      ),
    );
  }
}
