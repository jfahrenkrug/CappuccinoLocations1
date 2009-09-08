@import <Foundation/CPObject.j>
 
@implementation Location : CPObject
{
    // the id (I don't call it "id" because that's a type in Objective-J)
    int identifier @accessors;
    CPString description @accessors;
    CPString latitude @accessors;
    CPString longitude @accessors;
    CPString transportationKind @accessors;
    int position @accessors;
    BOOL unsavedChanges @accessors;
}
 
- (id)init
{
    self = [super init];
    
    if (self)
    {
        unsavedChanges = YES;
        description   = @"";
        latitude    =  @"";
        position = 1;
        longitude = @"";
        identifier = 0;
        transportationKind = @"";
        tripDayId = @"";
    }
    
    return self;
}

/*!
    Initializes it with the data from a JSON Object
*/
- (id)initFromJSONObject:(id)aJSONObject
{
    self = [self init];
    
    if (self)
    {  
        unsavedChanges = NO;
        identifier  = aJSONObject.id;
        description   = aJSONObject.description;
        latitude = aJSONObject.latitude;
        longitude = aJSONObject.longitude;
        transportationKind = aJSONObject.transportation_kind;
    }
    
    return self;
}

/*!
    Returns true if this location already has geo coordinates
*/
- (BOOL)hasCoordinates {
    return latitude != nil && longitude != nil && [latitude length] > 1 && [longitude length] > 1;
}

/*!
    Returns true if this location already unsaved changes
*/
- (BOOL)hasUnsavedChanges {
    return unsavedChanges;
}

/*!
    Returns true if this location is a new record, meaning that it did not come from the database
*/
- (BOOL)isNewRecord {
    return identifier == nil || identifier == 0;
}

/*!
    Returns a JSON string the represents this location
*/
- (CPString)toJSON {
    var JSONDict = {'trip_day_location':{'id': identifier, 'description':description, 'latitude':latitude, 'longitude':longitude, 'transportation_kind':transportationKind, 'trip_day_id':tripDayId, 'position':position}};
    return CPJSObjectCreateJSON(JSONDict);
}

/*!
    Returns an array of locations built from an array of JSON objects
*/
+ (CPArray)locationsFromJSONObjects:(id)someJSONObjects
{
    var locations = [[CPArray alloc] init];
    
    if (someJSONObjects) {
        for (var i=0; i < someJSONObjects.length; i++) {
            var location    = [[Location alloc] initFromJSONObject:someJSONObjects[i]];
            [locations addObject:location];
        };
    }
    
    return locations;
}

+ (CPString)typeNone {
    return @"";
}

+ (CPString)typeBus {
    return @"B";
}

+ (CPString)typeShip {
    return @"S";
}

+ (CPString)typePlane {
    return @"P";
}

@end
