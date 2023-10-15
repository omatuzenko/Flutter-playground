import 'package:flutter/material.dart';

typedef ItemSelectedCallback = void Function(int value);

class ListWidget extends StatefulWidget {
  final int count;
  final ItemSelectedCallback onItemSelected;

  const ListWidget({
    required this.count,
    required this.onItemSelected,
  });

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.count,
      itemBuilder: (context, position) {
        return _ListItemWidget(
          position: position,
          onItemSelected: widget.onItemSelected,
        );
      },
    );
  }
}

class _ListItemWidget extends StatelessWidget {
  final int position;
  final ItemSelectedCallback onItemSelected;

  _ListItemWidget({
    required this.position,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: InkWell(
          onTap: () {
            onItemSelected(position);
          },
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  position.toString(),
                  style: const TextStyle(fontSize: 22.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
