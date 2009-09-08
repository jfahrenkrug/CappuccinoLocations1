@import <AppKit/CPView.j>
 
@implementation LocationDetailView : CPView
{
    CPTextField locationNameField;
    id delegate @accessors;
}
 
- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
        [self setBackgroundColor:[CPColor colorWithHexString:@"FFF"]];
        

        /* ------- Location Name Label --------- */
        var locationNameLabel = [[CPTextField alloc] initWithFrame:CGRectMake(28.0, 5.0, 70, 17)];
        [locationNameLabel setFont:[CPFont systemFontOfSize:12.0]];
        [locationNameLabel setEditable:NO];
        [locationNameLabel setStringValue:@"Name: "];
        [self addSubview:locationNameLabel];

        /* ------- Location Name Text Field ------- */
        locationNameField = [CPTextField roundedTextFieldWithStringValue:@"" placeholder:@"Name" width:338.0];
        [locationNameField setFrameOrigin:CGPointMake(65.0, 0.0)];
        [locationNameField setDelegate:self];
        [self addSubview:locationNameField];

        /* ------- Location Save Button ---------- */
        var saveButton = [[CPButton alloc] initWithFrame:CGRectMake(308.0, 35.0, 90.0, 24.0)];
        [saveButton setTitle:"Speichern"];
        [saveButton setTarget:self];
        [saveButton setAction:@selector(forwardSaveAction)];
        [self addSubview:saveButton];
    }
 
    return self;
}


- (CPString)name {
    return [locationNameField stringValue];
}

- (void)setName:(CPString)aName {
    [locationNameField setStringValue:aName];
}

- (void)forwardSaveAction {
    if (delegate && [delegate respondsToSelector:@selector(saveLocation)]) {
        [delegate saveLocation];
    }
}

- (void)controlTextDidChange:(CPNotification)aNote {
    if (delegate && [delegate respondsToSelector:@selector(descriptionDidChange:)]) {
        [delegate descriptionDidChange:[self name]];
    }
}


@end