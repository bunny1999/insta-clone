import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DoubleHolder {
  double value = 0.0;
}

class StatefulScrollView extends StatefulWidget {
  
  final int _itemCount;
  final IndexedWidgetBuilder _indexedWidgetBuilder;
  final DoubleHolder _offset;
  final bool isGrid;
  
  StatefulScrollView(this._offset,this._itemCount,this._indexedWidgetBuilder,{this.isGrid=false});

  double getOffsetMethod() {
    return _offset.value;
  }

  void setOffsetMethod(double val) {
    _offset.value = val;
  }

  @override
  _StatefulScrollViewState createState() => 
    _StatefulScrollViewState(this._itemCount,this._indexedWidgetBuilder,this.isGrid);
}

class _StatefulScrollViewState extends State<StatefulScrollView> {
  ScrollController scrollController;
  final int _itemCount;
  final IndexedWidgetBuilder _itemBuilder;
  final bool _isGrid;
  
  _StatefulScrollViewState(this._itemCount,this._itemBuilder,this._isGrid);

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController(
        initialScrollOffset: widget.getOffsetMethod()
    );
  }

  @override
  Widget build(BuildContext context) {
    return new NotificationListener(
      child:!_isGrid
      ?ListView.builder(
        controller: scrollController,
        itemCount: _itemCount,
        itemBuilder: _itemBuilder
      )
      :StaggeredGridView.countBuilder(
        crossAxisCount: 3,
        controller: scrollController,
        itemCount: _itemCount,
        itemBuilder: _itemBuilder,
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.fit(1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
      onNotification: (notification) {
        if (notification is ScrollNotification) {
          widget.setOffsetMethod(notification.metrics.pixels);
        }
        return true;
      },
    );
  }
}