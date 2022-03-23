import 'package:flutter/material.dart';

class ExpansionList<T> extends StatefulWidget {
  final List<T> items;
  final String title;
  final Function(dynamic) onItemSelected;
  final bool smallVersion;
  ExpansionList({
    Key key,
    this.items,
    this.title,
    @required this.onItemSelected,
    this.smallVersion = false,
  }) : super(key: key);

  _ExpansionListState createState() => _ExpansionListState();
}

class _ExpansionListState extends State<ExpansionList> {
  final double startingHeight = 40.0;
  double expandedHeight;
  bool expanded = false;
  String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.title;
    _calculateExpandedHeight();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      duration: const Duration(milliseconds: 180),
      height: expanded
          ? expandedHeight
          : widget.smallVersion
          ? 40
          : startingHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white).copyWith(
        boxShadow: expanded
            ? [BoxShadow(blurRadius: 10, color: Colors.grey[300])]
            : null,
      ),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          ExpansionListItem(
            title: selectedValue,
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
            showArrow: true,
            smallVersion: widget.smallVersion,
          ),
          Container(
            height: 2,
            color: Colors.grey[300],
          ),
          ..._getDropdownListItems()
        ],
      ),
    );
  }

  List<Widget> _getDropdownListItems() {
    return widget.items
        .map((item) => ExpansionListItem(
        smallVersion: widget.smallVersion,
        title: item.toString(),
        onTap: () {
          setState(() {
            expanded = !expanded;
            selectedValue = item.toString();
          });

          widget.onItemSelected(item);
        }))
        .toList();
  }

  void _calculateExpandedHeight() {
    expandedHeight = (2 +
        (widget.smallVersion
            ? 40
            : 55 +
        (widget.items.length *
            (widget.smallVersion
                ? 40
                : 55.0))));
  }
}

class ExpansionListItem extends StatelessWidget {
  final Function onTap;
  final String title;
  final bool showArrow;
  final bool smallVersion;
  const ExpansionListItem({
    Key key,
    this.onTap,
    this.title,
    this.showArrow = false,
    this.smallVersion = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: smallVersion
            ? 40
            : 55,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                title ?? '',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontSize: smallVersion ? 12 : 15 , color: Colors.black54),
              ),
            ),
            showArrow
                ? Icon(
              Icons.arrow_drop_down,
              color: Colors.grey[700],
              size: 20,
            )
                : Container()
          ],
        ),
      ),
    );
  }
}