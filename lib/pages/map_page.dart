import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _mapController;
  LatLng _center = const LatLng(39.9042, 116.4074); // 北京天安门
  MapType _mapType = MapType.normal;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
    _addInitialMarkers();
  }

  Future<void> _requestLocationPermission() async {
    final status = await Permission.location.request();
    if (!status.isGranted) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('需要位置权限以显示地图')),
        );
      }
    }
  }

  void _addInitialMarkers() {
    setState(() {
      _markers = {
        Marker(
          markerId: const MarkerId('center'),
          position: _center,
          infoWindow: const InfoWindow(
            title: '天安门广场',
            snippet: '北京市东城区',
          ),
        ),
        Marker(
          markerId: const MarkerId('marker1'),
          position: const LatLng(39.9163, 116.3972),
          infoWindow: const InfoWindow(
            title: '故宫',
            snippet: '紫禁城',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
        Marker(
          markerId: const MarkerId('marker2'),
          position: const LatLng(39.9042, 116.4074),
          infoWindow: const InfoWindow(
            title: '人民大会堂',
            snippet: '国家会议中心',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      };
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _changeMapType() {
    setState(() {
      _mapType = _mapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _addMarkerAtCenter() {
    final newMarker = Marker(
      markerId: MarkerId('marker_${DateTime.now().millisecondsSinceEpoch}'),
      position: _center,
      infoWindow: InfoWindow(
        title: '新标记',
        snippet: '点击地图添加的标记',
      ),
    );
    setState(() {
      _markers.add(newMarker);
    });
  }

  void _clearMarkers() {
    setState(() {
      _markers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14.0,
            ),
            mapType: _mapType,
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onTap: (LatLng position) {
              setState(() {
                _center = position;
              });
            },
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Column(
              children: [
                FloatingActionButton(
                  mini: true,
                  onPressed: _changeMapType,
                  child: Icon(
                    _mapType == MapType.normal
                        ? Icons.satellite
                        : Icons.map,
                  ),
                  tooltip: '切换地图类型',
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  mini: true,
                  onPressed: _addMarkerAtCenter,
                  child: const Icon(Icons.add_location),
                  tooltip: '添加标记',
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  mini: true,
                  onPressed: _clearMarkers,
                  child: const Icon(Icons.clear_all),
                  tooltip: '清除标记',
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '地图功能',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('中心位置: ${_center.latitude.toStringAsFixed(4)}, ${_center.longitude.toStringAsFixed(4)}'),
                    Text('标记数量: ${_markers.length}'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}


