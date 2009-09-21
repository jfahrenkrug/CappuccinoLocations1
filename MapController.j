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

- (void)updateLocationLabel:(MKLocation)aLocation {
    [coordinatesLabel setStringValue:[aLocation latitude] + "/" + [aLocation longitude]];
}

- (void)moveMapToAddress:(CPString)address {
    var gm = [MKMapView gmNamespace];
    var geocoder = new gm.ClientGeocoder();

    geocoder.getLatLng(
        address,
        function(point) {
          if (!point) {
            alert(address + " could not be found.");
          } else {
            [self moveMapToLocation:[[MKLocation alloc] initWithLatLng:point]];
          }
        }
    );
}

- (void)moveMapToLocation:(MKLocation)aLocation {    
    //always clear all map overlays...
    [mapView clearOverlays];
    [mapView setCenter:aLocation];
    [mapView setZoom:7];
    
    var marker = [[MKMarker alloc] initAtLocation:aLocation];
    [marker addToMapView:mapView];
    [self updateLocationLabel:aLocation];
    latitude = [aLocation latitude];
    longitude = [aLocation longitude];
    
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
    [self moveMapToLocation:[MKLocation locationWithLatitude:aLat andLongitude:aLng]];
}


@end