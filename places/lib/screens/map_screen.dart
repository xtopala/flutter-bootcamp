import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/gestures.dart';
import 'package:here_sdk/mapview.dart';
import 'package:places/model/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;

  MapScreen(
      {this.initialLocation = const PlaceLocation(
        latitude: 37.422,
        longitude: -122.084,
      ),
      this.isSelecting});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  HereMapController _hereMapController;
  GeoCoordinates _pickedLocation;
  MapImage _markerMapImg;
  MapMarker _currentMarker;

  void _mapCreatedHanlder(HereMapController mapCtrl) {
    final double distanceToEarthInMeters = 8000;
    _hereMapController = mapCtrl;
    _hereMapController.mapScene.loadSceneForMapScheme(MapScheme.normalDay,
        (MapError err) {
      if (err != null) {
        print("Map scene not loaded. MapError: " + err.toString());
        return;
      }

      _hereMapController.camera.lookAtPointWithDistance(
        GeoCoordinates(
          widget.initialLocation.latitude,
          widget.initialLocation.longitude,
        ),
        distanceToEarthInMeters,
      );
      // setting a tap handler ...
      _setTapGestureHandler();
    });
  }

  void _setTapGestureHandler() {
    _hereMapController.gestures.tapListener = widget.isSelecting
        ? TapListener.fromLambdas(
            lambda_onTap: (Point2D touchPoint) {
              final geoCordinates =
                  _hereMapController.viewToGeoCoordinates(touchPoint);
              setState(() {
                _pickedLocation = geoCordinates;
              });

              _addMapMarker(geoCordinates);
            },
          )
        : null;
  }

  void _addMapMarker(GeoCoordinates coordinates) async {
    if (_markerMapImg == null) {
      Uint8List imgPixelData = await _loadAssetImgAsUint8List('marker.png');
      _markerMapImg =
          MapImage.withPixelDataAndImageFormat(imgPixelData, ImageFormat.png);
    }

    final mapMarker = MapMarker.withAnchor(
      coordinates,
      _markerMapImg,
      Anchor2D.withHorizontalAndVertical(0.5, 1),
    );
    // remove old map marker
    if (_currentMarker != null) {
      _hereMapController.mapScene.removeMapMarker(_currentMarker);
    }
    // add new map marker
    _currentMarker = mapMarker;
    _hereMapController.mapScene.addMapMarker(_currentMarker);
  }

  Future<Uint8List> _loadAssetImgAsUint8List(String filename) async {
    // the path refers to the assets directory as specified in pubspec.yaml
    ByteData fileData = await rootBundle.load('images/' + filename);
    return Uint8List.view(fileData.buffer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Map'),
        actions: [
          if (widget.isSelecting)
            IconButton(
              icon: Icon(Icons.check),
              onPressed: _pickedLocation == null
                  ? null
                  : () => Navigator.of(context).pop(_pickedLocation),
            ),
        ],
      ),
      body: HereMap(
        onMapCreated: _mapCreatedHanlder,
      ),
    );
  }
}
