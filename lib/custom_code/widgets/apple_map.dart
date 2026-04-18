// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart';

import 'package:apple_maps_flutter/apple_maps_flutter.dart' as am;
import 'package:geocoding/geocoding.dart' as geo;

class AppleMap extends StatefulWidget {
  const AppleMap({
    super.key,
    this.width,
    this.height,
    required this.address,
  });

  final double? width;
  final double? height;
  final String address;

  @override
  State<AppleMap> createState() => _AppleMapState();
}

class _AppleMapState extends State<AppleMap> {
  am.AppleMapController? _controller;

  static const am.LatLng _marburgDefault = am.LatLng(50.8067, 8.7705);

  bool _isLoading = true;
  bool _showError = false;

  am.LatLng _pin = _marburgDefault;
  double _zoom = 15.1;

  @override
  void initState() {
    super.initState();
    // ✅ KEIN _preparePinIcon();
    _geocodeAddress();
  }

  @override
  void didUpdateWidget(covariant AppleMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.address != widget.address) {
      _geocodeAddress();
    }
  }

  // ✅ Standard Apple Maps Marker: KEIN icon setzen
  Set<am.Annotation> get _annotations => {
        am.Annotation(
          annotationId: am.AnnotationId('event_pin'), // ✅ NICHT const
          position: _pin,
        ),
      };

  Future<void> _geocodeAddress() async {
    final addr = widget.address.trim();

    setState(() {
      _isLoading = true;
      _showError = false;
      _pin = _marburgDefault;
      _zoom = 15.1;
    });

    if (addr.isEmpty) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _showError = true;
      });
      return;
    }

    String searchAddress = addr;
    if (!searchAddress.toLowerCase().contains('marburg')) {
      searchAddress = '$searchAddress, Marburg';
    }

    try {
      final results = await geo.locationFromAddress(searchAddress);
      if (!mounted) return;

      if (results.isEmpty) {
        setState(() {
          _isLoading = false;
          _showError = true;
        });
        return;
      }

      final loc = results.first;
      final target = am.LatLng(loc.latitude, loc.longitude);

      setState(() {
        _isLoading = false;
        _showError = false;
        _pin = target;
        _zoom = 15.1;
      });

      _controller?.moveCamera(
        am.CameraUpdate.newCameraPosition(
          am.CameraPosition(target: target, zoom: _zoom),
        ),
      );
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _showError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double h = widget.height ?? 200;

    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.map_outlined, color: Color(0xFFD12717), size: 22),
              SizedBox(width: 8),
              Text(
                'Standort',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (_isLoading)
            _loadingBox(h)
          else if (_showError)
            _errorBox(h)
          else
            _mapBox(h),
          const SizedBox(height: 12),
          Text(
            widget.address,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _loadingBox(double h) {
    return Container(
      height: h,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(strokeWidth: 2.5),
            ),
            SizedBox(height: 8),
            Text('Lade Karte...',
                style: TextStyle(fontSize: 12, color: Colors.black54)),
          ],
        ),
      ),
    );
  }

  Widget _errorBox(double h) {
    return Container(
      height: h,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.map, size: 28, color: Colors.black45),
              const SizedBox(height: 8),
              const Text(
                'Karte konnte nicht geladen werden',
                style: TextStyle(fontSize: 12, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                widget.address,
                style: const TextStyle(fontSize: 11, color: Colors.black45),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mapBox(double h) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: h,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFBDBDBD), width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: am.AppleMap(
          onMapCreated: (c) => _controller = c,
          initialCameraPosition: am.CameraPosition(target: _pin, zoom: _zoom),
          annotations: _annotations,
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
            Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer()),
          },
          compassEnabled: false,
          rotateGesturesEnabled: false,
          pitchGesturesEnabled: false,
        ),
      ),
    );
  }
}
