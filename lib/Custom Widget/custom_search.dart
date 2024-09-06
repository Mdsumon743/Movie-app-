import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final card = Theme.of(context).colorScheme.onPrimary;
    final text = Theme.of(context).colorScheme.onSurface;
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration:
          BoxDecoration(color: card, borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
              suffixIcon: const Icon(
                Icons.search_rounded,
              ),
              contentPadding: const EdgeInsets.all(12),
              hintText: 'Search',
              hintStyle: TextStyle(
                  color: text.withOpacity(0.7),
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
