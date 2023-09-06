class ExpandableListItem {
  ExpandableListItem({
    required this.headerValue,
    required this.subItems,
    this.isExpanded = false,
    this.selectedItemIndex = -1,
  });

  String headerValue;
  List<String> subItems;
  bool isExpanded;
  int selectedItemIndex;
}
