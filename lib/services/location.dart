
import 'package:geolocator/geolocator.dart';

class Location{

  double latitude;
  double longitude;

  Future<void> getCurrentLocation()async{
    print("Get location called");
    try{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitude = position.longitude;

      print(position);
    }catch(e){
      print(e);
    }
  }

}