import 'package:flutter/material.dart';
import 'package:sfbtech/ui/widgets/search/search.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFFAFAFA),
          borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            onSubmitted: (String str) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Search(
                            searchQuery: searchController.text,
                          )));
            },
            textInputAction: TextInputAction.go,
            controller: searchController,
            decoration: const InputDecoration(
                hintText: "Поиск", border: InputBorder.none),
          )),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Search(
                              searchQuery: searchController.text,
                            )));
              },
              child: const Icon(Icons.search))
        ],
      ),
    );
  }
}
