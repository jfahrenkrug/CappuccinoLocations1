@import <Foundation/CPObject.j>
@import "Location.j"
@import "MapController.j"
@import "LocationsController.j"
@import "LocationDetailView.j"

@implementation LocationDetailController : CPObject
{
    Location location;
    MapController mapController @accessors;
    LocationDetailView locationDetailView @accessors;
    LocationsController locationsController @accessors;
}

- (id)init
{
    self = [super init] ;
    
    if (self)
    {
        location = nil;
        mapController = nil;
    }
    
    return self ;
}

- (void)setLocation:(Location)aLocation {
    location = aLocation;
    
    if ([location hasCoordinates]) {
        [mapController moveMapToLat:[location latitude] andLng:[location longitude]];
    }
    
    [locationDetailView setName:[location description]];
}

- (void)setNameIfEmpty:(CPString)aName {
    if ([[locationDetailView name] length] == 0) {
        [locationDetailView setName:aName];
    }
}

- (Location)location {
    return location;
}

- (void)saveLocation {
    if (location) {
        alert('Not yet implemented.');
    } else {
        alert("No location selected!");
    }
}

- (void)descriptionDidChange:(CPString)newValue {
    if (![[location description] isEqual:newValue]) {
        [location setDescription:newValue];
        [location setUnsavedChanges:YES];
    }
}

- (void)locationDidChangeWithLat:(CPString)aLat andLng:(CPString)aLng{
    if (![[location latitude] isEqualToString:aLat] || ![[location longitude] isEqualToString:aLng]) {
        if ([aLat isKindOfClass:[CPNumber class]]) {
            aLat = [aLat stringValue];
        }
        
        if ([aLng isKindOfClass:[CPNumber class]]) {
            aLng = [aLng stringValue];
        }
        
        [location setLatitude:aLat];
        [location setLongitude:aLng]
        [location setUnsavedChanges:YES];
    }
}

@end