@import <Foundation/CPObject.j>
@import <MapKit/MKMapView.j>
@import "Location.j"

@implementation MapController : CPObject
{
    MKMapView mapView @accessors;
    CPTextField coordinatesLabel @accessors;
    CPString latitude;
    CPString longitude;
    id delegate @accessors;
}

- (id)init
{
    self = [super init] ;
    
    if (self)
    {
        latitude = @"";
        longitude = @"";
    }
    
    return self ;
}

- (void)updateLocationLabel:(id)aLatLng {
    [coordinatesLabel setStringValue:aLatLng.lat() + "/" + aLatLng.lng()];
}

- (void)moveMapToAddress:(CPString)address {
    var geocoder = new GClientGeocoder();

    geocoder.getLatLng(
        address,
        function(point) {
          if (!point) {
            alert(address + " could not be found.");
          } else {
            [self moveMapToLocation:point];
          }
        }
    );
}

- (void)moveMapToLocation:(id)aLatLng {
    var map = [mapView gMap];
    
    //always clear all map overlays...
    map.clearOverlays();
    
    map.setCenter(aLatLng, 7);
    var marker = new GMarker(aLatLng);
    map.addOverlay(marker);
    [self updateLocationLabel:aLatLng];
    latitude = aLatLng.lat();
    longitude = aLatLng.lng();
    
    if (delegate && [delegate respondsToSelector:@selector(locationDidChangeWithLat:andLng:)]) {
        [delegate locationDidChangeWithLat:latitude andLng:longitude];
    }
}

- (CPString)latitude {
    return latitude;
}

- (CPString)longitude {
    return longitude;
}

- (void)moveMapToLat:(CPString)aLat andLng:(CPString)aLng {
    [self moveMapToLocation:GLatLng.fromUrlValue(aLat + "," + aLng)];
}


@end