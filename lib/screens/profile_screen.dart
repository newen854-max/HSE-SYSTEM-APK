import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: AppTheme.primaryColor.withOpacity(0.2),
                  child: const Icon(Icons.person,
                      size: 40, color: AppTheme.primaryColor),
                ),
                const SizedBox(height: 12),
                const Text('Demo User',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                const Text('HSE Officer',
                    style: TextStyle(color: Colors.white54)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Card(
            child: Column(
              children: [
                _tile(Icons.email_outlined, 'Email', 'demo@hse-system.com'),
                _tile(Icons.business_outlined, 'Department', 'Health & Safety'),
                _tile(Icons.location_on_outlined, 'Site', 'Main Facility'),
                _tile(Icons.badge_outlined, 'Employee ID', 'HSE-00142'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.settings_outlined),
                  title: const Text('Settings'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.logout,
                      color: AppTheme.dangerColor),
                  title: const Text('Logout',
                      style: TextStyle(color: AppTheme.dangerColor)),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tile(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.primaryColor),
      title: Text(label, style: const TextStyle(color: Colors.white54, fontSize: 12)),
      subtitle: Text(value,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
    );
  }
}
