import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../data/models/ads/ads_model.dart';
import '../../utils/app_lat_long.dart';
import '../../utils/localization/locale_keys.g.dart';
import '../../utils/location_service.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final controllerTitle = TextEditingController();
  final controllerDescription = TextEditingController();
  final controllerAddress = TextEditingController();

  AppLatLong? location;


  Future<AppLatLong?> fetchCurrentLocation() async {
    var defLocation = MoscowLocation(lat: 0.0, long: 0.0);
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    } //_moveToCu
    return location;
  }

  final mapControllerCompleter = Completer<YandexMapController>();

  Future<void> _moveToCurrentLocation(double lat, double lon) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: lat,
            longitude: lon,
          ),
          zoom: 15,
        ),
      ),
    );
  }

  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
  }

  @override
  Widget build(BuildContext context) {

    _initPermission();

    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is SendAdState) {
            Navigator.pushReplacementNamed(context, 'home');
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('New ads'),
                centerTitle: true,
                actions: [
                  InkWell(
                      onTap: () {
                        if (controllerTitle.text.isEmpty ||
                            controllerDescription.text.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Fill the blanks!'),
                            duration: Duration(seconds: 3),
                          ));
                        } else {
                          context.read<HomeBloc>().add(SendAdEvent(AdsModel(
                              controllerTitle.text,
                              controllerDescription.text,
                              location!.lat,
                              location!.long)));
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.blue,
                        ),
                      )),
                ],
                elevation: 2,
              ),
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        LocaleKeys.title.tr(),
                        style: GoogleFonts.abel(
                          color: const Color(0xFF232638),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: controllerTitle,
                        decoration: InputDecoration(
                          hintText: LocaleKeys.title_enter.tr(),
                          hintStyle: GoogleFonts.abel(
                            color: const Color(0xFF949CA9),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 0.11,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                            const BorderSide(color: Color(0xFF949CA9)),
                          ),
                          contentPadding: const EdgeInsets.all(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        LocaleKeys.description.tr(),
                        style: GoogleFonts.abel(
                          color: const Color(0xFF232638),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: controllerDescription,
                        decoration: InputDecoration(
                          hintText: LocaleKeys.description_enter.tr(),
                          hintStyle: GoogleFonts.abel(
                            color: const Color(0xFF949CA9),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 0.11,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                            const BorderSide(color: Color(0xFF949CA9)),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: Text(
                              'Change location',
                              style: TextStyle(
                                color: Color(0xFF01001F),
                                fontSize: 12,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w300,
                                height: 0,
                              ),
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        LocaleKeys.address.tr(),
                        style: GoogleFonts.abel(
                          color: const Color(0xFF232638),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: controllerAddress,
                        decoration: InputDecoration(
                          hintText: LocaleKeys.address_enter.tr(),
                          hintStyle: GoogleFonts.abel(
                            color: const Color(0xFF949CA9),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 0.11,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                            const BorderSide(color: Color(0xFF949CA9)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                        child: Stack(children: [
                          YandexMap(
                            onMapCreated: (controller) {
                              mapControllerCompleter.complete(controller);
                            },
                            onMapTap: (point) {
                              setState(() {
                                location?.lat = point.latitude;
                                location?.long = point.longitude;
                              });
                            },
                            zoomGesturesEnabled: true,
                            mapObjects: [
                              PlacemarkMapObject(
                                mapId: const MapObjectId('0'),
                                icon: PlacemarkIcon.single(PlacemarkIconStyle(
                                  scale: 0.1,
                                  image: BitmapDescriptor.fromAssetImage(
                                      'assets/icons/ic_loc.png'),
                                )),
                                point: Point(
                                    latitude: location?.lat ?? 0.0,
                                    longitude: location?.long ?? 0.0),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              print(location?.lat);
                              print(location?.long);

                              setState(() {
                                fetchCurrentLocation();
                                _moveToCurrentLocation(
                                    location!.lat, location!.long);
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Icon(Icons.my_location)),
                            ),
                          )
                        ]))
                  ],
                ),
              ));
        },
      ),
    );
  }
}
