/*
 * AppController.j
 * Locations
 *
 * Created by Johannes Fahrenkrug on September 8, 2009.
 * Copyright 2009, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>
@import "Location.j"
@import "LocationsController.j"
@import "LocationListView.j"
@import "MapController.j"
@import "LocationsToolbar.j"
@import "LocationDetailView.j"
@import "LocationDetailController.j"

@implementation AppController : CPObject
{
    LocationsController locationsController;
    LocationListView    locationListView;
    MapController       mapController;
    MKMapView           mapView;
    CPTextField         coordinatesLabel;
    LocationsToolbar    locationsToolbar;
    LocationDetailView  locationDetailView;
    LocationDetailController locationDetailController;
    CPTextField         searchField;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        mainContentView = [theWindow contentView],
        bounds = [contentView bounds];
        
    // Make the background blue-ish.
    [mainContentView setBackgroundColor:[CPColor colorWithRed:212.0 / 255.0 green:221.0 / 255.0 blue:230.0 / 255.0 alpha:1.0]];

    // Create and Center our Container View
    var contentView = [[CPView alloc] initWithFrame:CGRectMake(0, 0, 920.0, 590.0)];
    [contentView setCenter:[mainContentView center]];
    [contentView setBackgroundColor:[CPColor whiteColor]];
    [contentView setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    
    // Add shadow
    var shadow = [[CPShadowView alloc] initWithFrame:CGRectMakeZero()];
    [shadow setFrameForContentFrame:[contentView frame]];
    [shadow setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [mainContentView addSubview:shadow];
    [mainContentView addSubview:contentView];
    
    //Create the LocationsController
    locationsController = [[LocationsController alloc] init];
    //Load example data
    [locationsController loadExampleLocations];
    
    /* ------------ Locations --------------- */
    locationListView = [[LocationListView alloc] initWithFrame:CGRectMake(0.0, 0.0, 226.0, 400.0)];
    [locationListView setContent:[locationsController locations]];
    [locationListView setDelegate:locationsController];
    [locationsController setLocationListView:locationListView];

    /* --------- Locations ScrollView ---------- */
    var locationScrollView = [[CPScrollView alloc] initWithFrame:CGRectMake(10.0, 65.0, 243.0, 400.0)];
    [locationScrollView setDocumentView:locationListView];
    [locationScrollView setAutohidesScrollers:YES];
    [[locationScrollView contentView] setBackgroundColor:[CPColor whiteColor]];
    [contentView addSubview:locationScrollView];
    
    /* ----- Map Controller --------------- */
    mapController = [[MapController alloc] init];  

    /* ------------- Map View ----------------- */
    mapView = [[MKMapView alloc] initWithFrame:CGRectMake(510, 65, 400, 400) apiKey:''];
    [mapView setDelegate:self];
    mapController.mapView = mapView;
    [contentView addSubview:mapView];

    /* ---------- Coordinates Label -------------- */
    coordinatesLabel = [[CPTextField alloc] initWithFrame:CGRectMake(510, 465, 200, 35)];
    [coordinatesLabel setTextColor:[CPColor colorWithHexString:@"009900"]];
    [coordinatesLabel setFont:[CPFont systemFontOfSize:14.0]];
    [coordinatesLabel setEditable:NO];
    [coordinatesLabel setStringValue:@"-/-"];
    [mapController setCoordinatesLabel:coordinatesLabel];
    [contentView addSubview:coordinatesLabel];
    
    /* ---- Locations Toolbar ----- */
    locationsToolbar = [[LocationsToolbar alloc] initWithFrame:CGRectMake(10.0, 467.0, 226.0, 25.0)];
    [locationsToolbar setDelegate:locationsController];
    [contentView addSubview:locationsToolbar];
    
    /* ------- Location Detail Controller ----- */
    locationDetailController = [[LocationDetailController alloc] init];
    locationDetailController.mapController = mapController;
    locationsController.locationDetailController = locationDetailController;
    [mapController setDelegate:locationDetailController];

    /* ------- Location Detail View ---------- */
    locationDetailView = [[LocationDetailView alloc] initWithFrame:CGRectMake(510, 490, 400, 90)];
    [locationDetailView setDelegate:locationDetailController];
    [locationDetailController setLocationDetailView:locationDetailView];
    [contentView addSubview:locationDetailView];
    
    /* ------------ Search Field ------------- */
    searchField = [CPTextField roundedTextFieldWithStringValue:@"" placeholder:@"Location" width:200.0];
    [searchField setFrameOrigin:CGPointMake(510.0, 35.0)];
    [searchField setDelegate:self];
    [contentView addSubview:searchField];

    /* ----------- Search Button ------------------- */
    var searchButton = [[CPButton alloc] initWithFrame:CGRectMake(710.0, 37.0, 60.0, 24.0)];
    [searchButton setTitle:"Search"];
    [searchButton setTarget:self];
    [searchButton setAction:@selector(searchLocation)];
    [contentView addSubview:searchButton];

    [theWindow orderFront:self];
}

- (void)controlTextDidEndEditing:(id)sender {
    if ([sender object] == searchField) {
        [self searchLocation];
    } 
}

- (void)searchLocation {
    if ([searchField stringValue]) {
        [mapController moveMapToAddress:[searchField stringValue]];
        [locationDetailController setNameIfEmpty:[searchField stringValue]];
    }
}

@end
