@import <AppKit/CPCollectionView.j>
 
@implementation LocationListView : CPCollectionView
{
    CPCollectionViewItem itemPrototype;
}
 
- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
        [self setBackgroundColor:[CPColor colorWithHexString:@"F2F2F2"]];
        [self setMinItemSize:CGSizeMake(226.0, 50.0)];
        [self setMaxItemSize:CGSizeMake(226.0, 50.0)];
        [self setAllowsMultipleSelection:NO];

        itemPrototype = [[CPCollectionViewItem alloc] init];
        [itemPrototype setView:[[LocationItemView alloc] initWithFrame:CGRectMakeZero()]];
        
        [self setItemPrototype:itemPrototype];
    }
 
    return self;
}
 
- (id)getCurrentObject
{
    return [[self content] objectAtIndex:[self getSelectedIndex]] ;
}
 
- (int)getSelectedIndex
{
    return [[self selectionIndexes] firstIndex] ;
}
 
@end

/* -------- the item view (the view the represents a single location) ---------- */
@implementation LocationItemView : CPView
{
    CPImageView imageView;
    CPTextField descriptionField;
    CPTextField locationField;
    id representedObject;
}

- (void)setRepresentedObject:(id)anObject
{
    //KVO: remove observer on the old object, because these views are being reused
    if (representedObject) {
        [representedObject removeObserver:self
                               forKeyPath:@"description"];
        [representedObject removeObserver:self
                               forKeyPath:@"latitude"];
        [representedObject removeObserver:self
                               forKeyPath:@"longitude"];
        [representedObject removeObserver:self
                               forKeyPath:@"unsavedChanges"];                                              
    }
    
    if (!imageView)
    {
        imageView = [[CPImageView alloc] initWithFrame:CGRectMake(205.0, 5.0, 14.0, 14.0)];
        
        [imageView setImageScaling:CPScaleNone];
        [imageView setImage:[[CPImage alloc] initWithContentsOfFile:@"Resources/reddot.png" size:CGSizeMake(14.0, 14.0)]];
        [self addSubview:imageView];
    }
    
    if (!descriptionField)
    {
        descriptionField = [[CPTextField alloc] initWithFrame:CGRectMake(10.0, 25.0, 195.0, 20.0)];
        
        [descriptionField setFont:[CPFont boldSystemFontOfSize:12.0]];
        [descriptionField setTextColor:[CPColor blackColor]];
        [self addSubview:descriptionField];
    }
    
    if (!locationField)
    {
        locationField = [[CPTextField alloc] initWithFrame:CGRectMake(10.0, 8.0, 195.0, 20.0)];
        
        [locationField setFont:[CPFont systemFontOfSize:10.0]];
        [self addSubview:locationField];
    }
    
    representedObject = anObject;
    
    //add KVO observers
    if (representedObject) {
        [representedObject addObserver:self
                            forKeyPath:@"description"
                               options:(CPKeyValueObservingOptionNew)
                               context:NULL];
        [representedObject addObserver:self
                            forKeyPath:@"latitude"
                               options:(CPKeyValueObservingOptionNew)
                               context:NULL];
        [representedObject addObserver:self
                            forKeyPath:@"longitude"
                               options:(CPKeyValueObservingOptionNew)
                               context:NULL];  
        [representedObject addObserver:self
                            forKeyPath:@"unsavedChanges"
                               options:(CPKeyValueObservingOptionNew)
                               context:NULL];                                            
    }
    
    [descriptionField setStringValue:[anObject description]];
    
    [self setTextColor:representedObject isSelected:NO];
    
    [locationField setStringValue:[anObject latitude] + ' / ' + [anObject longitude]];
    
    if ([anObject hasUnsavedChanges]) {
        [imageView setHidden:NO];
    } else {
        [imageView setHidden:YES];
    }
}

// KVO change notification
- (void)observeValueForKeyPath:(CPString)keyPath
                      ofObject:(id)object
                        change:(CPDictionary)change
                       context:(void)context
{
    if ([keyPath isEqual:@"description"]) {
        [descriptionField setStringValue:[representedObject description]];
    } else if ([keyPath isEqual:@"latitude"] || [keyPath isEqual:@"longitude"]) {
        [locationField setStringValue:[representedObject latitude] + ' / ' + [representedObject longitude]];
    } else if ([keyPath isEqual:@"unsavedChanges"]) {
        if ([representedObject hasUnsavedChanges]) {
            [imageView setHidden:NO];
        } else {
            [imageView setHidden:YES];
        }
    }
    
    // calling the super implementation doesn't seem to work with cappuccino yet
}

- (void)setSelected:(BOOL)isSelected
{
    [self setBackgroundColor:isSelected ? [CPColor colorWithHexString:@"045FB4"] : nil];
    [self setTextColor:representedObject isSelected:isSelected];
}

- (void)setTextColor:(id)anObject isSelected:(BOOL)isSelected {
    if ([anObject hasCoordinates]) {
        [descriptionField setTextColor:isSelected ? [CPColor colorWithHexString:@"99FF99"] : [CPColor colorWithHexString:@"009900"]];
    } else {
        [descriptionField setTextColor:isSelected ? [CPColor whiteColor] : [CPColor blackColor]];
    }
    [locationField setTextColor:isSelected ? [CPColor whiteColor] : [CPColor blackColor]];
}

@end