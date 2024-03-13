import 'package:flutter/material.dart';

class SearchPageWidget extends StatelessWidget {
  const SearchPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SearchWidget();
  }
}



class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    final _searchController = TextEditingController();
    return Scaffold(

      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: TextField(

          controller: _searchController,
          style: const TextStyle(color: Colors.black),
          cursorColor: Colors.black,
          decoration:  InputDecoration(
            hintText: 'Search...',
            hintStyle: const TextStyle(color: Colors.black12),
            border: InputBorder.none,
            suffixIcon: IconButton(
              onPressed: _searchController.clear,
              icon: const Icon(Icons.clear),
            ),
          ),
          onChanged: (value) {
            // Perform search functionality here
          },
        ),

      ),
      body: ColoredBox(
        color: Colors.white,
      ),
    );
  }
}

