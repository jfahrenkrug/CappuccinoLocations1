@import <AppKit/CPView.j>
 
@implementation LocationsToolbar : CPView
{
    CPButton addButton;
    CPButton removeButton;
    id delegate @accessors;
}
 
- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
        [self setBackgroundColor:[CPColor colorWithHexString:@"FFF"]];
        
        addButton = [self imageButtonAtPoint:CPPointMake(0.0, 0.0) withName:@"add"];
        [addButton setTarget:self];
        [addButton setAction:@selector(forwardAddLocation)];
        [self addSubview:addButton];
        
        removeButton = [self imageButtonAtPoint:CPPointMake(33.0, 0.0) withName:@"remove"];
        [removeButton setTarget:self];
        [removeButton setAction:@selector(forwardRemoveLocation)];
        [self addSubview:removeButton];
    }
 
    return self;
}

- (void)forwardAddLocation {
    if (delegate && [delegate respondsToSelector:@selector(addLocation)]) {
        [delegate addLocation];
    } 
}

- (void)forwardRemoveLocation {
    if (delegate && [delegate respondsToSelector:@selector(removeLocation)]) {
        [delegate removeLocation];
    }
}

- (CPButton)imageButtonAtPoint:(CPPoint)point withName:(CPString)aName {
    var someButton = [[CPButton alloc] initWithFrame:CPRectMake(point.x, point.y, 30.0, 25.0)];
    var image = [[CPImage alloc] initWithContentsOfFile:("Resources/" + aName + ".png") size:CPSizeMake(30, 25)],
        highlighted = [[CPImage alloc] initWithContentsOfFile:("Resources/" + aName + "Highlighted.png") size:CPSizeMake(30, 25)];

    [someButton setImage:image];
    [someButton setAlternateImage:highlighted];
    [someButton setBordered:NO];
    
    return someButton;
}

@end