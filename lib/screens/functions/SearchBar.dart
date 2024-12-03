import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String>? onSearch;
  final VoidCallback? onFilterPressed;

  const CustomSearchBar({
    super.key,
    this.onSearch,
    this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Search Bar
        Expanded(
          child: TextField(
            cursorColor: Colors.grey,
            onChanged: onSearch,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 0.5,
                  color: Colors.grey.shade400,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xFFA20E20),
                  width: 2.0,
                ),
              ),
              hintText: 'Search',
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        // Filter Button
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.filter_alt,
              color: Color(0xFFA20E20),
              size: 25,
            ),
            onPressed: onFilterPressed,
          ),
        ),
      ],
    );
  }
}
