import 'package:flutter/material.dart';
import 'package:graduated_project/widgets/custom_search.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help Center "),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomSearch(
                  hinitText: "What can we help?",
                  searchController: searchController),
              const SizedBox(
                height: 30,
              ),
              CustomExpansionTile(),
              CustomExpansionTile(),
              CustomExpansionTile(),
              CustomExpansionTile(),
              CustomExpansionTile(),
              CustomExpansionTile(),

              // child: ExpansionPanelList(
              //   // elevation: 10,
              //   materialGapSize: 5,
              //   // expandedHeaderPadding: EdgeInsets.all(0),
              //   children: _data.map(
              //     (Item item) {
              //       return ExpansionPanel(
              //           isExpanded: item.isExpanded,
              //           headerBuilder: (context, isExpanded) {
              //             return ListTile(
              //               title: Text(
              //                 item.header,
              //                 style: TextStyle(
              //                   fontSize: 16,
              //                   fontWeight: FontWeight.w500,
              //                 ),
              //               ),
              //             );
              //           },
              //           body: ListTile(
              //             title: Text(
              //               item.expanded,
              //               style: TextStyle(
              //                 fontSize: 14,
              //                 color: Color(0xff6B7280),
              //               ),
              //               strutStyle: StrutStyle(height: 1.5),
              //             ),
              //           ));
              //     },
              //   ).toList(),
              //   expansionCallback: (int index, bool isExpanded) {
              //     setState(() {
              //       print(isExpanded);

              //       _data[index].isExpanded = isExpanded;
              //       print(isExpanded);
              //     });
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomExpansionTile extends StatefulWidget {
  CustomExpansionTile({super.key, this.isExpansion = false});
  bool isExpansion;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffD1D5DB)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        onExpansionChanged: (value) {
          setState(() {
            widget.isExpansion = !widget.isExpansion;
          });
        },
        trailing: Image.asset(
          widget.isExpansion
              ? "assets/image/icons/arrow-up.png"
              : "assets/image/icons/arrow-down.png",
          color: const Color(0xff9CA3AF),
          height: 20,
        ),
        iconColor: Colors.black,
        title: const Text(
          "The customer is very happy",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(width: 00, color: Color(0xffD1D5DB)),
        ),
        children: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "The customer is very important, the customer will be followed by the customer. Fusce ultricies mi enim, quis vulputate nibh faucibus at Maecenas is in front, whether he accepts or not, he flatters flatters. There is a pillow in front and a trigger porta vulputate. He wants to decorate the classroom and not to the ecological boundaries. The phase of the soft quiver before, in the ullamcorper the mass of the ullamcorper and I chat with Leo and let him be a lot of fun sometimes.",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff6B7280),
              ),
              strutStyle: StrutStyle(height: 1.3),
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  Item({
    required this.header,
    required this.expanded,
    this.isExpanded = false,
  });
  final String header;
  final String expanded;
  bool isExpanded;
}
