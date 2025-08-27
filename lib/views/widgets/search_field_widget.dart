import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Color accentColor;
  final Color primaryColor;
  final VoidCallback onSearch;
  final VoidCallback onLocationPressed;
  final VoidCallback onSubmitted;

  const SearchFieldWidget({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.accentColor,
    required this.primaryColor,
    required this.onSearch,
    required this.onLocationPressed,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.25),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: accentColor.withOpacity(0.4), width: 2),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          textAlign: TextAlign.left,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          decoration: InputDecoration(
            hintText: 'Search for a city',
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14,
            ),
            prefixIcon: _buildActionIcon(Icons.search, accentColor, onSearch),
            suffixIcon: _buildActionIcon(Icons.my_location, accentColor, onLocationPressed),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
          onSubmitted: (value) => onSubmitted(),
        ),
      ),
    );
  }

  Widget _buildActionIcon(IconData icon, Color color, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}
