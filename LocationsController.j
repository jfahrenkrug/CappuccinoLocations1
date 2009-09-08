@import <Foundation/CPObject.j>
@import "Location.j"
@import "DemoData.j"
@import "LocationListView.j"
@import "LocationDetailController.j"

@implementation LocationsController : CPObject
{
    CPArray locations;
    LocationListView locationListView @accessors;
    LocationDetailController locationDetailController @accessors;
}

- (void)setLocations:(CPArray)someLocations {
    locations = someLocations;
}

- (TripDay)locations {
    return locations;
}

- (void)loadExampleLocations {
    var json = [[DemoData exampleJSONString] objectFromJSON];
    [self setLocations:[Location locationsFromJSONObjects:json]];
}

- (Location)selectedLocation {
    return [locations objectAtIndex:[[locationListView selectionIndexes] firstIndex]];
}

// Delegate method for the locationListView
- (void)collectionViewDidChangeSelection:(CPCollectionView)aCollectionView
{
    [locationDetailController setLocation:[self selectedLocation]];
}

- (void)addLocation {
    if (!locations) {
        locations = [[CPArray alloc] init];
    }
    
    loc = [[Location alloc] init];
    [loc setDescription:@""];
    [loc setPosition:([locations count] + 1)];
    [locations addObject:loc];
    [locationListView setContent:locations];
    [locationListView reloadContent];
    [locationListView setSelectionIndexes:[CPIndexSet indexSetWithIndex:([locations count] - 1)]];
}

- (void)removeLocation {
    if (![self selectedLocation]) {
        return;
    }
    
    if (confirm('Are you sure?'))
    {
        if ([[self selectedLocation] isNewRecord]) {
            [self removeSelectedLocation];
        } else {
            //we'll implement this later
        }
    }
}

- (void)removeSelectedLocation {
    [locations removeObjectAtIndex:[[locationListView selectionIndexes] firstIndex]];
    [locationListView setContent:locations];
    [locationListView reloadContent];
    [locationListView setSelectionIndexes:[CPIndexSet indexSetWithIndex:([locations count] - 1)]];
}

@end