I;20;Foundation/CPArray.jI;26;Foundation/CPObjJRuntime.ji;19;CGAffineTransform.ji;12;CGGeometry.ji;9;CPColor.ji;12;CPGeometry.ji;19;CPGraphicsContext.ji;13;CPResponder.ji;9;CPTheme.ji;18;_CPDisplayServer.jc;55746;
CPViewNotSizable=0;
CPViewMinXMargin=1;
CPViewWidthSizable=2;
CPViewMaxXMargin=4;
CPViewMinYMargin=8;
CPViewHeightSizable=16;
CPViewMaxYMargin=32;
CPViewBoundsDidChangeNotification="CPViewBoundsDidChangeNotification";
CPViewFrameDidChangeNotification="CPViewFrameDidChangeNotification";
var _1=nil,_2=nil;
var _3=nil,_4=0,_5=1,_6=2,_7=3;
var _8={},_9=1<<0,_a=1<<1;
var _b=objj_allocateClassPair(CPResponder,"CPView"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_window"),new objj_ivar("_superview"),new objj_ivar("_subviews"),new objj_ivar("_graphicsContext"),new objj_ivar("_tag"),new objj_ivar("_frame"),new objj_ivar("_bounds"),new objj_ivar("_boundsTransform"),new objj_ivar("_inverseBoundsTransform"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_isHidden"),new objj_ivar("_hitTests"),new objj_ivar("_postsFrameChangedNotifications"),new objj_ivar("_postsBoundsChangedNotifications"),new objj_ivar("_inhibitFrameAndBoundsChangedNotifications"),new objj_ivar("_DOMElement"),new objj_ivar("_DOMContentsElement"),new objj_ivar("_DOMImageParts"),new objj_ivar("_DOMImageSizes"),new objj_ivar("_backgroundType"),new objj_ivar("_dirtyRect"),new objj_ivar("_opacity"),new objj_ivar("_backgroundColor"),new objj_ivar("_autoresizesSubviews"),new objj_ivar("_autoresizingMask"),new objj_ivar("_layer"),new objj_ivar("_wantsLayer"),new objj_ivar("_isInFullScreenMode"),new objj_ivar("_fullScreenModeState"),new objj_ivar("_needsLayout"),new objj_ivar("_ephemeralSubviews"),new objj_ivar("_theme"),new objj_ivar("_themeAttributes"),new objj_ivar("_themeState"),new objj_ivar("_ephemeralSubviewsForNames"),new objj_ivar("_ephereralSubviews"),new objj_ivar("_nextKeyView"),new objj_ivar("_previousKeyView"),new objj_ivar("_viewClassFlags")]);
objj_registerClassPair(_b);
objj_addClassForBundle(_b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_b,[new objj_method(sel_getUid("setupViewFlags"),function(_d,_e){
with(_d){
var _f=objj_msgSend(_d,"class"),_10=objj_msgSend(_f,"UID");
if(_8[_10]===undefined){
var _11=0;
if(objj_msgSend(_f,"instanceMethodForSelector:",sel_getUid("drawRect:"))!==objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("drawRect:"))){
_11|=_9;
}
if(objj_msgSend(_f,"instanceMethodForSelector:",sel_getUid("layoutSubviews"))!==objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("layoutSubviews"))){
_11|=_a;
}
_8[_10]=_11;
}
_viewClassFlags=_8[_10];
}
}),new objj_method(sel_getUid("init"),function(_12,_13){
with(_12){
return objj_msgSend(_12,"initWithFrame:",CGRectMakeZero());
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_14,_15,_16){
with(_14){
_14=objj_msgSendSuper({receiver:_14,super_class:objj_getClass("CPResponder")},"init");
if(_14){
var _17=(_16.size.width),_18=(_16.size.height);
_subviews=[];
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_tag=-1;
_frame={origin:{x:_16.origin.x,y:_16.origin.y},size:{width:_16.size.width,height:_16.size.height}};
_bounds={origin:{x:0,y:0},size:{width:_17,height:_18}};
_autoresizingMask=CPViewNotSizable;
_autoresizesSubviews=YES;
_opacity=1;
_isHidden=NO;
_hitTests=YES;
_DOMElement=_3.cloneNode(false);
if(NULL){
var _19={x:CGPointMake((_16.origin.x),(_16.origin.y)).x*NULL.a+CGPointMake((_16.origin.x),(_16.origin.y)).y*NULL.c+NULL.tx,y:CGPointMake((_16.origin.x),(_16.origin.y)).x*NULL.b+CGPointMake((_16.origin.x),(_16.origin.y)).y*NULL.d+NULL.ty};
}else{
var _19={x:(_16.origin.x),y:(_16.origin.y)};
}
_DOMElement.style.left=ROUND(_19.x)+"px";
_DOMElement.style.top=ROUND(_19.y)+"px";
_DOMElement.style.width=MAX(0,ROUND(_17))+"px";
_DOMElement.style.height=MAX(0,ROUND(_18))+"px";
_DOMImageParts=[];
_DOMImageSizes=[];
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeStateNormal;
objj_msgSend(_14,"setupViewFlags");
objj_msgSend(_14,"_loadThemeAttributes");
}
return _14;
}
}),new objj_method(sel_getUid("superview"),function(_1a,_1b){
with(_1a){
return _superview;
}
}),new objj_method(sel_getUid("subviews"),function(_1c,_1d){
with(_1c){
return _subviews;
}
}),new objj_method(sel_getUid("window"),function(_1e,_1f){
with(_1e){
return _window;
}
}),new objj_method(sel_getUid("addSubview:"),function(_20,_21,_22){
with(_20){
objj_msgSend(_20,"_insertSubview:atIndex:",_22,CPNotFound);
}
}),new objj_method(sel_getUid("addSubview:positioned:relativeTo:"),function(_23,_24,_25,_26,_27){
with(_23){
var _28=_27?objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_27):CPNotFound;
if(_28===CPNotFound){
_28=(_26===CPWindowAbove)?objj_msgSend(_subviews,"count"):0;
}else{
if(_26===CPWindowAbove){
++_28;
}
}
objj_msgSend(_23,"_insertSubview:atIndex:",_25,_28);
}
}),new objj_method(sel_getUid("_insertSubview:atIndex:"),function(_29,_2a,_2b,_2c){
with(_29){
var _2d=_subviews.length;
objj_msgSend(objj_msgSend(_29,"window"),"_dirtyKeyViewLoop");
if(_2b._superview==_29){
var _2e=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_2b);
if(_2e===_2c||_2e===_2d-1&&_2c===_2d){
return;
}
objj_msgSend(_subviews,"removeObjectAtIndex:",_2e);
_DOMElement.removeChild(_2b._DOMElement);
if(_2c>_2e){
--_2c;
}
--_2d;
}else{
objj_msgSend(_2b,"removeFromSuperview");
objj_msgSend(_2b,"_setWindow:",_window);
objj_msgSend(_2b,"viewWillMoveToSuperview:",_29);
_2b._superview=_29;
}
if(_2c===CPNotFound||_2c>=_2d){
_subviews.push(_2b);
_DOMElement.appendChild(_2b._DOMElement);
}else{
_subviews.splice(_2c,0,_2b);
_DOMElement.insertBefore(_2b._DOMElement,_subviews[_2c+1]._DOMElement);
}
objj_msgSend(_2b,"setNextResponder:",_29);
objj_msgSend(_2b,"viewDidMoveToSuperview");
objj_msgSend(_29,"didAddSubview:",_2b);
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_2f,_30,_31){
with(_2f){
}
}),new objj_method(sel_getUid("removeFromSuperview"),function(_32,_33){
with(_32){
if(!_superview){
return;
}
objj_msgSend(objj_msgSend(_32,"window"),"_dirtyKeyViewLoop");
objj_msgSend(_superview,"willRemoveSubview:",_32);
objj_msgSend(objj_msgSend(_superview,"subviews"),"removeObject:",_32);
_superview._DOMElement.removeChild(_DOMElement);
_superview=nil;
objj_msgSend(_32,"_setWindow:",nil);
}
}),new objj_method(sel_getUid("replaceSubview:with:"),function(_34,_35,_36,_37){
with(_34){
if(_36._superview!=_34){
return;
}
var _38=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_36);
objj_msgSend(_36,"removeFromSuperview");
objj_msgSend(_34,"_insertSubview:atIndex:",_37,_38);
}
}),new objj_method(sel_getUid("_setWindow:"),function(_39,_3a,_3b){
with(_39){
if(_window===_3b){
return;
}
objj_msgSend(objj_msgSend(_39,"window"),"_dirtyKeyViewLoop");
if(objj_msgSend(_window,"firstResponder")===_39){
objj_msgSend(_window,"makeFirstResponder:",nil);
}
objj_msgSend(_39,"viewWillMoveToWindow:",_3b);
if(_registeredDraggedTypes){
objj_msgSend(_window,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_3b,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
}
_window=_3b;
var _3c=objj_msgSend(_subviews,"count");
while(_3c--){
objj_msgSend(_subviews[_3c],"_setWindow:",_3b);
}
objj_msgSend(_39,"viewDidMoveToWindow");
objj_msgSend(objj_msgSend(_39,"window"),"_dirtyKeyViewLoop");
}
}),new objj_method(sel_getUid("isDescendantOf:"),function(_3d,_3e,_3f){
with(_3d){
var _40=_3d;
do{
if(_40==_3f){
return YES;
}
}while(_40=objj_msgSend(_40,"superview"));
return NO;
}
}),new objj_method(sel_getUid("viewDidMoveToSuperview"),function(_41,_42){
with(_41){
objj_msgSend(_41,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_43,_44){
with(_43){
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(_45,_46,_47){
with(_45){
}
}),new objj_method(sel_getUid("viewWillMoveToWindow:"),function(_48,_49,_4a){
with(_48){
}
}),new objj_method(sel_getUid("willRemoveSubview:"),function(_4b,_4c,_4d){
with(_4b){
}
}),new objj_method(sel_getUid("enclosingMenuItem"),function(_4e,_4f){
with(_4e){
var _50=_4e;
while(_50&&!objj_msgSend(_50,"isKindOfClass:",objj_msgSend(_CPMenuItemView,"class"))){
_50=objj_msgSend(_50,"superview");
}
if(_50){
return _50._menuItem;
}
return nil;
}
}),new objj_method(sel_getUid("setTag:"),function(_51,_52,_53){
with(_51){
_tag=_53;
}
}),new objj_method(sel_getUid("tag"),function(_54,_55){
with(_54){
return _tag;
}
}),new objj_method(sel_getUid("viewWithTag:"),function(_56,_57,_58){
with(_56){
if(objj_msgSend(_56,"tag")===_58){
return _56;
}
var _59=0,_5a=_subviews.length;
for(;_59<_5a;++_59){
var _5b=objj_msgSend(_subviews[_59],"viewWithTag:",_58);
if(_5b){
return _5b;
}
}
return nil;
}
}),new objj_method(sel_getUid("isFlipped"),function(_5c,_5d){
with(_5c){
return YES;
}
}),new objj_method(sel_getUid("setFrame:"),function(_5e,_5f,_60){
with(_5e){
if(((_frame.origin.x==_60.origin.x&&_frame.origin.y==_60.origin.y)&&(_frame.size.width==_60.size.width&&_frame.size.height==_60.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_5e,"setFrameOrigin:",_60.origin);
objj_msgSend(_5e,"setFrameSize:",_60.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_5e);
}
}
}),new objj_method(sel_getUid("frame"),function(_61,_62){
with(_61){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("frameOrigin"),function(_63,_64){
with(_63){
return {x:_frame.origin.x,y:_frame.origin.y};
}
}),new objj_method(sel_getUid("frameSize"),function(_65,_66){
with(_65){
return {width:_frame.size.width,height:_frame.size.height};
}
}),new objj_method(sel_getUid("setCenter:"),function(_67,_68,_69){
with(_67){
objj_msgSend(_67,"setFrameOrigin:",CGPointMake(_69.x-_frame.size.width/2,_69.y-_frame.size.height/2));
}
}),new objj_method(sel_getUid("center"),function(_6a,_6b){
with(_6a){
return CGPointMake(_frame.size.width/2+_frame.origin.x,_frame.size.height/2+_frame.origin.y);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_6c,_6d,_6e){
with(_6c){
var _6f=_frame.origin;
if(!_6e||(_6f.x==_6e.x&&_6f.y==_6e.y)){
return;
}
_6f.x=_6e.x;
_6f.y=_6e.y;
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_6c);
}
if(_superview?_superview._boundsTransform:NULL){
var _70={x:CGPointMake(_6f.x,_6f.y).x*_superview?_superview._boundsTransform:NULL.a+CGPointMake(_6f.x,_6f.y).y*_superview?_superview._boundsTransform:NULL.c+_superview?_superview._boundsTransform:NULL.tx,y:CGPointMake(_6f.x,_6f.y).x*_superview?_superview._boundsTransform:NULL.b+CGPointMake(_6f.x,_6f.y).y*_superview?_superview._boundsTransform:NULL.d+_superview?_superview._boundsTransform:NULL.ty};
}else{
var _70={x:_6f.x,y:_6f.y};
}
_DOMElement.style.left=ROUND(_70.x)+"px";
_DOMElement.style.top=ROUND(_70.y)+"px";
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_71,_72,_73){
with(_71){
var _74=_frame.size;
if(!_73||(_74.width==_73.width&&_74.height==_73.height)){
return;
}
var _75={width:_74.width,height:_74.height};
_74.width=_73.width;
_74.height=_73.height;
if(YES){
_bounds.size.width=_73.width;
_bounds.size.height=_73.height;
}
if(_layer){
objj_msgSend(_layer,"_owningViewBoundsChanged");
}
if(_autoresizesSubviews){
objj_msgSend(_71,"resizeSubviewsWithOldSize:",_75);
}
objj_msgSend(_71,"setNeedsLayout");
objj_msgSend(_71,"setNeedsDisplay:",YES);
_DOMElement.style.width=MAX(0,ROUND(_74.width))+"px";
_DOMElement.style.height=MAX(0,ROUND(_74.height))+"px";
if(_DOMContentsElement){
_DOMContentsElement.width=MAX(0,ROUND(_74.width));
_DOMContentsElement.height=MAX(0,ROUND(_74.height));
_DOMContentsElement.style.width=MAX(0,ROUND(_74.width))+"px";
_DOMContentsElement.style.height=MAX(0,ROUND(_74.height))+"px";
}
if(_backgroundType!==_4){
var _76=objj_msgSend(objj_msgSend(_backgroundColor,"patternImage"),"imageSlices");
if(_backgroundType===_5){
_DOMImageParts[1].style.width=MAX(0,ROUND(_74.width))+"px";
_DOMImageParts[1].style.height=MAX(0,ROUND(_74.height-_DOMImageSizes[0].height-_DOMImageSizes[2].height))+"px";
}else{
if(_backgroundType===_6){
_DOMImageParts[1].style.width=MAX(0,ROUND(_74.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width))+"px";
_DOMImageParts[1].style.height=MAX(0,ROUND(_74.height))+"px";
}else{
if(_backgroundType===_7){
var _77=_74.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width,_78=_74.height-_DOMImageSizes[0].height-_DOMImageSizes[6].height;
_DOMImageParts[1].style.width=MAX(0,ROUND(_77))+"px";
_DOMImageParts[1].style.height=MAX(0,ROUND(_DOMImageSizes[0].height))+"px";
_DOMImageParts[3].style.width=MAX(0,ROUND(_DOMImageSizes[3].width))+"px";
_DOMImageParts[3].style.height=MAX(0,ROUND(_78))+"px";
_DOMImageParts[4].style.width=MAX(0,ROUND(_77))+"px";
_DOMImageParts[4].style.height=MAX(0,ROUND(_78))+"px";
_DOMImageParts[5].style.width=MAX(0,ROUND(_DOMImageSizes[5].width))+"px";
_DOMImageParts[5].style.height=MAX(0,ROUND(_78))+"px";
_DOMImageParts[7].style.width=MAX(0,ROUND(_77))+"px";
_DOMImageParts[7].style.height=MAX(0,ROUND(_DOMImageSizes[7].height))+"px";
}
}
}
}
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_71);
}
}
}),new objj_method(sel_getUid("setBounds:"),function(_79,_7a,_7b){
with(_79){
if(((_bounds.origin.x==_7b.origin.x&&_bounds.origin.y==_7b.origin.y)&&(_bounds.size.width==_7b.size.width&&_bounds.size.height==_7b.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_79,"setBoundsOrigin:",_7b.origin);
objj_msgSend(_79,"setBoundsSize:",_7b.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_79);
}
}
}),new objj_method(sel_getUid("bounds"),function(_7c,_7d){
with(_7c){
return {origin:{x:_bounds.origin.x,y:_bounds.origin.y},size:{width:_bounds.size.width,height:_bounds.size.height}};
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(_7e,_7f,_80){
with(_7e){
var _81=_bounds.origin;
if((_81.x==_80.x&&_81.y==_80.y)){
return;
}
_81.x=_80.x;
_81.y=_80.y;
if(_81.x!=0||_81.y!=0){
_boundsTransform={a:1,b:0,c:0,d:1,tx:-_81.x,ty:-_81.y};
_inverseBoundsTransform=CGAffineTransformInvert(_boundsTransform);
}else{
_boundsTransform=nil;
_inverseBoundsTransform=nil;
}
var _82=_subviews.length;
while(_82--){
var _83=_subviews[_82],_81=_83._frame.origin;
if(_boundsTransform){
var _84={x:CGPointMake(_81.x,_81.y).x*_boundsTransform.a+CGPointMake(_81.x,_81.y).y*_boundsTransform.c+_boundsTransform.tx,y:CGPointMake(_81.x,_81.y).x*_boundsTransform.b+CGPointMake(_81.x,_81.y).y*_boundsTransform.d+_boundsTransform.ty};
}else{
var _84={x:_81.x,y:_81.y};
}
_83._DOMElement.style.left=ROUND(_84.x)+"px";
_83._DOMElement.style.top=ROUND(_84.y)+"px";
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_7e);
}
}
}),new objj_method(sel_getUid("setBoundsSize:"),function(_85,_86,_87){
with(_85){
var _88=_bounds.size;
if((_88.width==_87.width&&_88.height==_87.height)){
return;
}
var _89=_frame.size;
if(!(_88.width==_89.width&&_88.height==_89.height)){
var _8a=_bounds.origin;
_8a.x/=_88.width/_89.width;
_8a.y/=_88.height/_89.height;
}
_88.width=_87.width;
_88.height=_87.height;
if(!(_88.width==_89.width&&_88.height==_89.height)){
var _8a=_bounds.origin;
_8a.x*=_88.width/_89.width;
_8a.y*=_88.height/_89.height;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_85);
}
}
}),new objj_method(sel_getUid("resizeWithOldSuperviewSize:"),function(_8b,_8c,_8d){
with(_8b){
var _8e=objj_msgSend(_8b,"autoresizingMask");
if(_8e==CPViewNotSizable){
return;
}
var _8f=_superview._frame,_90={origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}},dX=((_8f.size.width)-_8d.width)/(((_8e&CPViewMinXMargin)?1:0)+(_8e&CPViewWidthSizable?1:0)+(_8e&CPViewMaxXMargin?1:0)),dY=((_8f.size.height)-_8d.height)/((_8e&CPViewMinYMargin?1:0)+(_8e&CPViewHeightSizable?1:0)+(_8e&CPViewMaxYMargin?1:0));
if(_8e&CPViewMinXMargin){
_90.origin.x+=dX;
}
if(_8e&CPViewWidthSizable){
_90.size.width+=dX;
}
if(_8e&CPViewMinYMargin){
_90.origin.y+=dY;
}
if(_8e&CPViewHeightSizable){
_90.size.height+=dY;
}
objj_msgSend(_8b,"setFrame:",_90);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_93,_94,_95){
with(_93){
var _96=_subviews.length;
while(_96--){
objj_msgSend(_subviews[_96],"resizeWithOldSuperviewSize:",_95);
}
}
}),new objj_method(sel_getUid("setAutoresizesSubviews:"),function(_97,_98,_99){
with(_97){
_autoresizesSubviews=!!_99;
}
}),new objj_method(sel_getUid("autoresizesSubviews"),function(_9a,_9b){
with(_9a){
return _autoresizesSubviews;
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(_9c,_9d,_9e){
with(_9c){
_autoresizingMask=_9e;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(_9f,_a0){
with(_9f){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("enterFullScreenMode"),function(_a1,_a2){
with(_a1){
return objj_msgSend(_a1,"enterFullScreenMode:withOptions:",nil,nil);
}
}),new objj_method(sel_getUid("enterFullScreenMode:withOptions:"),function(_a3,_a4,_a5,_a6){
with(_a3){
_fullScreenModeState=_a7(_a3);
var _a8=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"contentBounds"),CPBorderlessWindowMask);
objj_msgSend(_a8,"setLevel:",CPScreenSaverWindowLevel);
objj_msgSend(_a8,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _a9=objj_msgSend(_a8,"contentView");
objj_msgSend(_a9,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_a9,"addSubview:",_a3);
objj_msgSend(_a3,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_a3,"setFrame:",CGRectMakeCopy(objj_msgSend(_a9,"bounds")));
objj_msgSend(_a8,"makeKeyAndOrderFront:",_a3);
objj_msgSend(_a8,"makeFirstResponder:",_a3);
_isInFullScreenMode=YES;
return YES;
}
}),new objj_method(sel_getUid("exitFullScreenMode"),function(_aa,_ab){
with(_aa){
objj_msgSend(_aa,"exitFullScreenModeWithOptions:",nil);
}
}),new objj_method(sel_getUid("exitFullScreenModeWithOptions:"),function(_ac,_ad,_ae){
with(_ac){
if(!_isInFullScreenMode){
return;
}
_isInFullScreenMode=NO;
objj_msgSend(_ac,"setFrame:",_fullScreenModeState.frame);
objj_msgSend(_ac,"setAutoresizingMask:",_fullScreenModeState.autoresizingMask);
objj_msgSend(_fullScreenModeState.superview,"_insertSubview:atIndex:",_ac,_fullScreenModeState.index);
objj_msgSend(objj_msgSend(_ac,"window"),"orderOut:",_ac);
}
}),new objj_method(sel_getUid("isInFullScreenMode"),function(_af,_b0){
with(_af){
return _isInFullScreenMode;
}
}),new objj_method(sel_getUid("setHidden:"),function(_b1,_b2,_b3){
with(_b1){
_b3=!!_b3;
if(_isHidden===_b3){
return;
}
_isHidden=_b3;
_DOMElement.style.display=_isHidden?"none":"block";
if(_b3){
var _b4=objj_msgSend(_window,"firstResponder");
if(objj_msgSend(_b4,"isKindOfClass:",objj_msgSend(CPView,"class"))){
do{
if(_b1==_b4){
objj_msgSend(_window,"makeFirstResponder:",objj_msgSend(_b1,"nextValidKeyView"));
break;
}
}while(_b4=objj_msgSend(_b4,"superview"));
}
}
}
}),new objj_method(sel_getUid("isHidden"),function(_b5,_b6){
with(_b5){
return _isHidden;
}
}),new objj_method(sel_getUid("setAlphaValue:"),function(_b7,_b8,_b9){
with(_b7){
if(_opacity==_b9){
return;
}
_opacity=_b9;
if(CPFeatureIsCompatible(CPOpacityRequiresFilterFeature)){
if(_b9==1){
try{
_DOMElement.style.removeAttribute("filter");
}
catch(anException){
}
}else{
_DOMElement.style.filter="alpha(opacity="+_b9*100+")";
}
}else{
_DOMElement.style.opacity=_b9;
}
}
}),new objj_method(sel_getUid("alphaValue"),function(_ba,_bb){
with(_ba){
return _opacity;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_bc,_bd){
with(_bc){
var _be=_bc;
while(_be&&!objj_msgSend(_be,"isHidden")){
_be=objj_msgSend(_be,"superview");
}
return _be!==nil;
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_bf,_c0,_c1){
with(_bf){
return YES;
}
}),new objj_method(sel_getUid("hitTests"),function(_c2,_c3){
with(_c2){
return _hitTests;
}
}),new objj_method(sel_getUid("setHitTests:"),function(_c4,_c5,_c6){
with(_c4){
_hitTests=!!_c6;
}
}),new objj_method(sel_getUid("hitTest:"),function(_c7,_c8,_c9){
with(_c7){
if(_isHidden||!_hitTests||!CPRectContainsPoint(_frame,_c9)){
return nil;
}
var _ca=nil,i=_subviews.length,_cc={x:_c9.x-(_frame.origin.x),y:_c9.y-(_frame.origin.y)};
if(_inverseBoundsTransform){
_cc={x:_cc.x*_inverseBoundsTransform.a+_cc.y*_inverseBoundsTransform.c+_inverseBoundsTransform.tx,y:_cc.x*_inverseBoundsTransform.b+_cc.y*_inverseBoundsTransform.d+_inverseBoundsTransform.ty};
}
while(i--){
if(_ca=objj_msgSend(_subviews[i],"hitTest:",_cc)){
return _ca;
}
}
return _c7;
}
}),new objj_method(sel_getUid("mouseDownCanMoveWindow"),function(_cd,_ce){
with(_cd){
return !objj_msgSend(_cd,"isOpaque");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_cf,_d0,_d1){
with(_cf){
if(objj_msgSend(_cf,"mouseDownCanMoveWindow")){
objj_msgSendSuper({receiver:_cf,super_class:objj_getClass("CPResponder")},"mouseDown:",_d1);
}
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_d2,_d3,_d4){
with(_d2){
if(_backgroundColor==_d4){
return;
}
_backgroundColor=_d4;
var _d5=objj_msgSend(_backgroundColor,"patternImage"),_d6=0;
if(objj_msgSend(_d5,"isThreePartImage")){
_backgroundType=objj_msgSend(_d5,"isVertical")?_5:_6;
_d6=3-_DOMImageParts.length;
}else{
if(objj_msgSend(_d5,"isNinePartImage")){
_backgroundType=_7;
_d6=9-_DOMImageParts.length;
}else{
_backgroundType=_4;
_d6=0-_DOMImageParts.length;
}
}
if(_d6>0){
while(_d6--){
var _d7=_3.cloneNode(false);
_d7.style.zIndex=-1000;
_DOMImageParts.push(_d7);
_DOMElement.appendChild(_d7);
}
}else{
_d6=-_d6;
while(_d6--){
_DOMElement.removeChild(_DOMImageParts.pop());
}
}
if(_backgroundType==_4){
_DOMElement.style.background=_backgroundColor?objj_msgSend(_backgroundColor,"cssString"):"";
}else{
var _d8=objj_msgSend(_d5,"imageSlices"),_d9=MIN(_DOMImageParts.length,_d8.length),_da=_frame.size;
while(_d9--){
var _db=_d8[_d9],_dc=_DOMImageSizes[_d9]=_db?objj_msgSend(_db,"size"):{width:0,height:0};
_DOMImageParts[_d9].style.width=MAX(0,ROUND(_dc.width))+"px";
_DOMImageParts[_d9].style.height=MAX(0,ROUND(_dc.height))+"px";
_DOMImageParts[_d9].style.background=_db?"url(\""+objj_msgSend(_db,"filename")+"\")":"";
}
if(_backgroundType==_7){
var _dd=_da.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width,_de=_da.height-_DOMImageSizes[0].height-_DOMImageSizes[6].height;
_DOMImageParts[1].style.width=MAX(0,ROUND(_dd))+"px";
_DOMImageParts[1].style.height=MAX(0,ROUND(_DOMImageSizes[0].height))+"px";
_DOMImageParts[3].style.width=MAX(0,ROUND(_DOMImageSizes[3].width))+"px";
_DOMImageParts[3].style.height=MAX(0,ROUND(_de))+"px";
_DOMImageParts[4].style.width=MAX(0,ROUND(_dd))+"px";
_DOMImageParts[4].style.height=MAX(0,ROUND(_de))+"px";
_DOMImageParts[5].style.width=MAX(0,ROUND(_DOMImageSizes[5].width))+"px";
_DOMImageParts[5].style.height=MAX(0,ROUND(_de))+"px";
_DOMImageParts[7].style.width=MAX(0,ROUND(_dd))+"px";
_DOMImageParts[7].style.height=MAX(0,ROUND(_DOMImageSizes[7].height))+"px";
if(NULL){
var _df={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _df={x:0,y:0};
}
_DOMImageParts[0].style.left=ROUND(_df.x)+"px";
_DOMImageParts[0].style.top=ROUND(_df.y)+"px";
if(NULL){
var _df={x:CGPointMake(_DOMImageSizes[0].width,0).x*NULL.a+CGPointMake(_DOMImageSizes[0].width,0).y*NULL.c+NULL.tx,y:CGPointMake(_DOMImageSizes[0].width,0).x*NULL.b+CGPointMake(_DOMImageSizes[0].width,0).y*NULL.d+NULL.ty};
}else{
var _df={x:_DOMImageSizes[0].width,y:0};
}
_DOMImageParts[1].style.left=ROUND(_df.x)+"px";
_DOMImageParts[1].style.top=ROUND(_df.y)+"px";
if(NULL){
var _df={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _df={x:0,y:0};
}
_DOMImageParts[2].style.right=ROUND(_df.x)+"px";
_DOMImageParts[2].style.top=ROUND(_df.y)+"px";
if(NULL){
var _df={x:CGPointMake(0,_DOMImageSizes[1].height).x*NULL.a+CGPointMake(0,_DOMImageSizes[1].height).y*NULL.c+NULL.tx,y:CGPointMake(0,_DOMImageSizes[1].height).x*NULL.b+CGPointMake(0,_DOMImageSizes[1].height).y*NULL.d+NULL.ty};
}else{
var _df={x:0,y:_DOMImageSizes[1].height};
}
_DOMImageParts[3].style.left=ROUND(_df.x)+"px";
_DOMImageParts[3].style.top=ROUND(_df.y)+"px";
if(NULL){
var _df={x:CGPointMake(_DOMImageSizes[0].width,_DOMImageSizes[0].height).x*NULL.a+CGPointMake(_DOMImageSizes[0].width,_DOMImageSizes[0].height).y*NULL.c+NULL.tx,y:CGPointMake(_DOMImageSizes[0].width,_DOMImageSizes[0].height).x*NULL.b+CGPointMake(_DOMImageSizes[0].width,_DOMImageSizes[0].height).y*NULL.d+NULL.ty};
}else{
var _df={x:_DOMImageSizes[0].width,y:_DOMImageSizes[0].height};
}
_DOMImageParts[4].style.left=ROUND(_df.x)+"px";
_DOMImageParts[4].style.top=ROUND(_df.y)+"px";
if(NULL){
var _df={x:CGPointMake(0,_DOMImageSizes[1].height).x*NULL.a+CGPointMake(0,_DOMImageSizes[1].height).y*NULL.c+NULL.tx,y:CGPointMake(0,_DOMImageSizes[1].height).x*NULL.b+CGPointMake(0,_DOMImageSizes[1].height).y*NULL.d+NULL.ty};
}else{
var _df={x:0,y:_DOMImageSizes[1].height};
}
_DOMImageParts[5].style.right=ROUND(_df.x)+"px";
_DOMImageParts[5].style.top=ROUND(_df.y)+"px";
if(NULL){
var _df={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _df={x:0,y:0};
}
_DOMImageParts[6].style.left=ROUND(_df.x)+"px";
_DOMImageParts[6].style.bottom=ROUND(_df.y)+"px";
if(NULL){
var _df={x:CGPointMake(_DOMImageSizes[6].width,0).x*NULL.a+CGPointMake(_DOMImageSizes[6].width,0).y*NULL.c+NULL.tx,y:CGPointMake(_DOMImageSizes[6].width,0).x*NULL.b+CGPointMake(_DOMImageSizes[6].width,0).y*NULL.d+NULL.ty};
}else{
var _df={x:_DOMImageSizes[6].width,y:0};
}
_DOMImageParts[7].style.left=ROUND(_df.x)+"px";
_DOMImageParts[7].style.bottom=ROUND(_df.y)+"px";
if(NULL){
var _df={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _df={x:0,y:0};
}
_DOMImageParts[8].style.right=ROUND(_df.x)+"px";
_DOMImageParts[8].style.bottom=ROUND(_df.y)+"px";
}else{
if(_backgroundType==_5){
_DOMImageParts[1].style.width=MAX(0,ROUND(_da.width))+"px";
_DOMImageParts[1].style.height=MAX(0,ROUND(_da.height-_DOMImageSizes[0].height-_DOMImageSizes[2].height))+"px";
if(NULL){
var _df={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _df={x:0,y:0};
}
_DOMImageParts[0].style.left=ROUND(_df.x)+"px";
_DOMImageParts[0].style.top=ROUND(_df.y)+"px";
if(NULL){
var _df={x:CGPointMake(0,_DOMImageSizes[0].height).x*NULL.a+CGPointMake(0,_DOMImageSizes[0].height).y*NULL.c+NULL.tx,y:CGPointMake(0,_DOMImageSizes[0].height).x*NULL.b+CGPointMake(0,_DOMImageSizes[0].height).y*NULL.d+NULL.ty};
}else{
var _df={x:0,y:_DOMImageSizes[0].height};
}
_DOMImageParts[1].style.left=ROUND(_df.x)+"px";
_DOMImageParts[1].style.top=ROUND(_df.y)+"px";
if(NULL){
var _df={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _df={x:0,y:0};
}
_DOMImageParts[2].style.left=ROUND(_df.x)+"px";
_DOMImageParts[2].style.bottom=ROUND(_df.y)+"px";
}else{
if(_backgroundType==_6){
_DOMImageParts[1].style.width=MAX(0,ROUND(_da.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width))+"px";
_DOMImageParts[1].style.height=MAX(0,ROUND(_da.height))+"px";
if(NULL){
var _df={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _df={x:0,y:0};
}
_DOMImageParts[0].style.left=ROUND(_df.x)+"px";
_DOMImageParts[0].style.top=ROUND(_df.y)+"px";
if(NULL){
var _df={x:CGPointMake(_DOMImageSizes[0].width,0).x*NULL.a+CGPointMake(_DOMImageSizes[0].width,0).y*NULL.c+NULL.tx,y:CGPointMake(_DOMImageSizes[0].width,0).x*NULL.b+CGPointMake(_DOMImageSizes[0].width,0).y*NULL.d+NULL.ty};
}else{
var _df={x:_DOMImageSizes[0].width,y:0};
}
_DOMImageParts[1].style.left=ROUND(_df.x)+"px";
_DOMImageParts[1].style.top=ROUND(_df.y)+"px";
if(NULL){
var _df={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _df={x:0,y:0};
}
_DOMImageParts[2].style.right=ROUND(_df.x)+"px";
_DOMImageParts[2].style.top=ROUND(_df.y)+"px";
}
}
}
}
}
}),new objj_method(sel_getUid("backgroundColor"),function(_e0,_e1){
with(_e0){
return _backgroundColor;
}
}),new objj_method(sel_getUid("convertPoint:fromView:"),function(_e2,_e3,_e4,_e5){
with(_e2){
return CGPointApplyAffineTransform(_e4,_e6(_e5,_e2));
}
}),new objj_method(sel_getUid("convertPoint:toView:"),function(_e7,_e8,_e9,_ea){
with(_e7){
return CGPointApplyAffineTransform(_e9,_e6(_e7,_ea));
}
}),new objj_method(sel_getUid("convertSize:fromView:"),function(_eb,_ec,_ed,_ee){
with(_eb){
return CGSizeApplyAffineTransform(_ed,_e6(_ee,_eb));
}
}),new objj_method(sel_getUid("convertSize:toView:"),function(_ef,_f0,_f1,_f2){
with(_ef){
return CGSizeApplyAffineTransform(_f1,_e6(_ef,_f2));
}
}),new objj_method(sel_getUid("convertRect:fromView:"),function(_f3,_f4,_f5,_f6){
with(_f3){
return CGRectApplyAffineTransform(_f5,_e6(_f6,_f3));
}
}),new objj_method(sel_getUid("convertRect:toView:"),function(_f7,_f8,_f9,_fa){
with(_f7){
return CGRectApplyAffineTransform(_f9,_e6(_f7,_fa));
}
}),new objj_method(sel_getUid("setPostsFrameChangedNotifications:"),function(_fb,_fc,_fd){
with(_fb){
_fd=!!_fd;
if(_postsFrameChangedNotifications===_fd){
return;
}
_postsFrameChangedNotifications=_fd;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_fb);
}
}
}),new objj_method(sel_getUid("postsFrameChangedNotifications"),function(_fe,_ff){
with(_fe){
return _postsFrameChangedNotifications;
}
}),new objj_method(sel_getUid("setPostsBoundsChangedNotifications:"),function(self,_cmd,_102){
with(self){
_102=!!_102;
if(_postsBoundsChangedNotifications===_102){
return;
}
_postsBoundsChangedNotifications=_102;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,self);
}
}
}),new objj_method(sel_getUid("postsBoundsChangedNotifications"),function(self,_cmd){
with(self){
return _postsBoundsChangedNotifications;
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(self,_cmd,_107,_108,_109,_10a,_10b,_10c,_10d){
with(self){
objj_msgSend(_window,"dragImage:at:offset:event:pasteboard:source:slideBack:",_107,objj_msgSend(self,"convertPoint:toView:",_108,nil),_109,_10a,_10b,_10c,_10d);
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(self,_cmd,_110,_111,_112,_113,_114,_115,_116){
with(self){
objj_msgSend(_window,"dragView:at:offset:event:pasteboard:source:slideBack:",_110,objj_msgSend(self,"convertPoint:toView:",_111,nil),_112,_113,_114,_115,_116);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(self,_cmd,_119){
with(self){
if(!_119||!objj_msgSend(_119,"count")){
return;
}
var _11a=objj_msgSend(self,"window");
objj_msgSend(_11a,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_119);
objj_msgSend(_11a,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypesArray=nil;
}
}),new objj_method(sel_getUid("registeredDraggedTypes"),function(self,_cmd){
with(self){
if(!_registeredDraggedTypesArray){
_registeredDraggedTypesArray=objj_msgSend(_registeredDraggedTypes,"allObjects");
}
return _registeredDraggedTypesArray;
}
}),new objj_method(sel_getUid("unregisterDraggedTypes"),function(self,_cmd){
with(self){
objj_msgSend(objj_msgSend(self,"window"),"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
}
}),new objj_method(sel_getUid("drawRect:"),function(self,_cmd,_121){
with(self){
}
}),new objj_method(sel_getUid("setNeedsDisplay:"),function(self,_cmd,_124){
with(self){
if(_124){
objj_msgSend(self,"setNeedsDisplayInRect:",objj_msgSend(self,"bounds"));
}
}
}),new objj_method(sel_getUid("setNeedsDisplayInRect:"),function(self,_cmd,_127){
with(self){
if(!(_viewClassFlags&_9)){
return;
}
if((_127.size.width<=0||_127.size.height<=0)){
return;
}
if(_dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0)){
_dirtyRect=CGRectUnion(_127,_dirtyRect);
}else{
_dirtyRect={origin:{x:_127.origin.x,y:_127.origin.y},size:{width:_127.size.width,height:_127.size.height}};
}
_CPDisplayServerAddDisplayObject(self);
}
}),new objj_method(sel_getUid("needsDisplay"),function(self,_cmd){
with(self){
return _dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0);
}
}),new objj_method(sel_getUid("displayIfNeeded"),function(self,_cmd){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_dirtyRect);
}
}
}),new objj_method(sel_getUid("display"),function(self,_cmd){
with(self){
objj_msgSend(self,"displayRect:",objj_msgSend(self,"visibleRect"));
}
}),new objj_method(sel_getUid("displayIfNeededInRect:"),function(self,_cmd,_130){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_130);
}
}
}),new objj_method(sel_getUid("displayRect:"),function(self,_cmd,_133){
with(self){
objj_msgSend(self,"viewWillDraw");
objj_msgSend(self,"displayRectIgnoringOpacity:inContext:",_133,nil);
_dirtyRect=NULL;
}
}),new objj_method(sel_getUid("displayRectIgnoringOpacity:inContext:"),function(self,_cmd,_136,_137){
with(self){
objj_msgSend(self,"lockFocus");
CGContextClearRect(objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_136);
objj_msgSend(self,"drawRect:",_136);
objj_msgSend(self,"unlockFocus");
}
}),new objj_method(sel_getUid("viewWillDraw"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("lockFocus"),function(self,_cmd){
with(self){
if(!_graphicsContext){
var _13c=CGBitmapGraphicsContextCreate();
_DOMContentsElement=_13c.DOMElement;
_DOMContentsElement.style.zIndex=-100;
_DOMContentsElement.style.overflow="hidden";
_DOMContentsElement.style.position="absolute";
_DOMContentsElement.style.visibility="visible";
_DOMContentsElement.width=ROUND((_frame.size.width));
_DOMContentsElement.height=ROUND((_frame.size.height));
_DOMContentsElement.style.top="0px";
_DOMContentsElement.style.left="0px";
_DOMContentsElement.style.width=ROUND((_frame.size.width))+"px";
_DOMContentsElement.style.height=ROUND((_frame.size.height))+"px";
_DOMElement.appendChild(_DOMContentsElement);
_graphicsContext=objj_msgSend(CPGraphicsContext,"graphicsContextWithGraphicsPort:flipped:",_13c,YES);
}
objj_msgSend(CPGraphicsContext,"setCurrentContext:",_graphicsContext);
CGContextSaveGState(objj_msgSend(_graphicsContext,"graphicsPort"));
}
}),new objj_method(sel_getUid("unlockFocus"),function(self,_cmd){
with(self){
CGContextRestoreGState(objj_msgSend(_graphicsContext,"graphicsPort"));
objj_msgSend(CPGraphicsContext,"setCurrentContext:",nil);
}
}),new objj_method(sel_getUid("setNeedsLayout"),function(self,_cmd){
with(self){
if(!(_viewClassFlags&_a)){
return;
}
_needsLayout=YES;
_CPDisplayServerAddLayoutObject(self);
}
}),new objj_method(sel_getUid("layoutIfNeeded"),function(self,_cmd){
with(self){
if(_needsLayout){
_needsLayout=NO;
objj_msgSend(self,"layoutSubviews");
}
}
}),new objj_method(sel_getUid("layoutSubviews"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("isOpaque"),function(self,_cmd){
with(self){
return NO;
}
}),new objj_method(sel_getUid("visibleRect"),function(self,_cmd){
with(self){
if(!_superview){
return _bounds;
}
return CGRectIntersection(objj_msgSend(self,"convertRect:fromView:",objj_msgSend(_superview,"visibleRect"),_superview),_bounds);
}
}),new objj_method(sel_getUid("_enclosingClipView"),function(self,_cmd){
with(self){
var _14b=_superview,_14c=objj_msgSend(CPClipView,"class");
while(_14b&&!objj_msgSend(_14b,"isKindOfClass:",_14c)){
_14b=_14b._superview;
}
return _14b;
}
}),new objj_method(sel_getUid("scrollPoint:"),function(self,_cmd,_14f){
with(self){
var _150=objj_msgSend(self,"_enclosingClipView");
if(!_150){
return;
}
objj_msgSend(_150,"scrollToPoint:",objj_msgSend(self,"convertPoint:toView:",_14f,_150));
}
}),new objj_method(sel_getUid("scrollRectToVisible:"),function(self,_cmd,_153){
with(self){
var _154=objj_msgSend(self,"visibleRect");
_153=CGRectIntersection(_153,_bounds);
if((_153.size.width<=0||_153.size.height<=0)||CGRectContainsRect(_154,_153)){
return NO;
}
var _155=objj_msgSend(self,"_enclosingClipView");
if(!_155){
return NO;
}
var _156={x:_154.origin.x,y:_154.origin.y};
if((_153.origin.x)<=(_154.origin.x)){
_156.x=(_153.origin.x);
}else{
if((_153.origin.x+_153.size.width)>(_154.origin.x+_154.size.width)){
_156.x+=(_153.origin.x+_153.size.width)-(_154.origin.x+_154.size.width);
}
}
if((_153.origin.y)<=(_154.origin.y)){
_156.y=CGRectGetMinY(_153);
}else{
if((_153.origin.y+_153.size.height)>(_154.origin.y+_154.size.height)){
_156.y+=(_153.origin.y+_153.size.height)-(_154.origin.y+_154.size.height);
}
}
objj_msgSend(_155,"scrollToPoint:",CGPointMake(_156.x,_156.y));
return YES;
}
}),new objj_method(sel_getUid("autoscroll:"),function(self,_cmd,_159){
with(self){
return objj_msgSend(objj_msgSend(self,"superview"),"autoscroll:",_159);
}
}),new objj_method(sel_getUid("adjustScroll:"),function(self,_cmd,_15c){
with(self){
return _15c;
}
}),new objj_method(sel_getUid("scrollRect:by:"),function(self,_cmd,_15f,_160){
with(self){
}
}),new objj_method(sel_getUid("enclosingScrollView"),function(self,_cmd){
with(self){
var _163=_superview,_164=objj_msgSend(CPScrollView,"class");
while(_163&&!objj_msgSend(_163,"isKindOfClass:",_164)){
_163=_163._superview;
}
return _163;
}
}),new objj_method(sel_getUid("scrollClipView:toPoint:"),function(self,_cmd,_167,_168){
with(self){
objj_msgSend(_167,"scrollToPoint:",_168);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(self,_cmd,_16b){
with(self){
}
})]);
class_addMethods(_c,[new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!==objj_msgSend(CPView,"class")){
return;
}
_3=document.createElement("div");
var _16e=_3.style;
_16e.overflow="hidden";
_16e.position="absolute";
_16e.visibility="visible";
_16e.zIndex=0;
_1=objj_msgSend(CPNotificationCenter,"defaultCenter");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingFrame"),function(self,_cmd){
with(self){
return objj_msgSend(CPSet,"setWithObjects:","frameOrigin","frameSize");
}
})]);
var _b=objj_getClass("CPView");
if(!_b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("canBecomeKeyView"),function(self,_cmd){
with(self){
return objj_msgSend(self,"acceptsFirstResponder")&&!objj_msgSend(self,"isHiddenOrHasHiddenAncestor");
}
}),new objj_method(sel_getUid("nextKeyView"),function(self,_cmd){
with(self){
return _nextKeyView;
}
}),new objj_method(sel_getUid("nextValidKeyView"),function(self,_cmd){
with(self){
var _177=objj_msgSend(self,"nextKeyView");
while(_177&&!objj_msgSend(_177,"canBecomeKeyView")){
_177=objj_msgSend(_177,"nextKeyView");
}
return _177;
}
}),new objj_method(sel_getUid("previousKeyView"),function(self,_cmd){
with(self){
return _previousKeyView;
}
}),new objj_method(sel_getUid("previousValidKeyView"),function(self,_cmd){
with(self){
var _17c=objj_msgSend(self,"previousKeyView");
while(_17c&&!objj_msgSend(_17c,"canBecomeKeyView")){
_17c=objj_msgSend(_17c,"previousKeyView");
}
return _17c;
}
}),new objj_method(sel_getUid("_setPreviousKeyView:"),function(self,_cmd,_17f){
with(self){
_previousKeyView=_17f;
}
}),new objj_method(sel_getUid("setNextKeyView:"),function(self,_cmd,next){
with(self){
_nextKeyView=next;
objj_msgSend(_nextKeyView,"_setPreviousKeyView:",self);
}
})]);
var _b=objj_getClass("CPView");
if(!_b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("setLayer:"),function(self,_cmd,_185){
with(self){
if(_layer==_185){
return;
}
if(_layer){
_layer._owningView=nil;
_DOMElement.removeChild(_layer._DOMElement);
}
_layer=_185;
if(_layer){
var _186=CGRectMakeCopy(objj_msgSend(self,"bounds"));
objj_msgSend(_layer,"_setOwningView:",self);
_layer._DOMElement.style.zIndex=100;
_DOMElement.appendChild(_layer._DOMElement);
}
}
}),new objj_method(sel_getUid("layer"),function(self,_cmd){
with(self){
return _layer;
}
}),new objj_method(sel_getUid("setWantsLayer:"),function(self,_cmd,_18b){
with(self){
_wantsLayer=!!_18b;
}
}),new objj_method(sel_getUid("wantsLayer"),function(self,_cmd){
with(self){
return _wantsLayer;
}
})]);
var _b=objj_getClass("CPView");
if(!_b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("themeState"),function(self,_cmd){
with(self){
return _themeState;
}
}),new objj_method(sel_getUid("hasThemeState:"),function(self,_cmd,_192){
with(self){
return !!(_themeState&((typeof _192==="string")?CPThemeState(_192):_192));
}
}),new objj_method(sel_getUid("setThemeState:"),function(self,_cmd,_195){
with(self){
var _196=(typeof _195==="string")?CPThemeState(_195):_195;
if(_themeState&_196){
return NO;
}
_themeState|=_196;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("unsetThemeState:"),function(self,_cmd,_199){
with(self){
var _19a=((typeof _199==="string")?CPThemeState(_199):_199);
if(!(_themeState&_19a)){
return NO;
}
_themeState&=~_19a;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("_loadThemeAttributes"),function(self,_cmd){
with(self){
var _19d=objj_msgSend(self,"class"),_19e=objj_msgSend(_19d,"_themeAttributes"),_19f=_19e.length;
if(!_19f){
return;
}
var _1a0=objj_msgSend(self,"theme"),_1a1=objj_msgSend(_19d,"themeClass");
_themeAttributes={};
while(_19f--){
var _1a2=_19e[_19f--],_1a3=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_1a2,_19e[_19f]);
objj_msgSend(_1a3,"setParentAttribute:",objj_msgSend(_1a0,"_attributeWithName:forClass:",_1a2,_1a1));
_themeAttributes[_1a2]=_1a3;
}
}
}),new objj_method(sel_getUid("setTheme:"),function(self,_cmd,_1a6){
with(self){
if(_theme===_1a6){
return;
}
_theme=_1a6;
objj_msgSend(self,"viewDidChangeTheme");
}
}),new objj_method(sel_getUid("theme"),function(self,_cmd){
with(self){
return _theme;
}
}),new objj_method(sel_getUid("viewDidChangeTheme"),function(self,_cmd){
with(self){
if(!_themeAttributes){
return;
}
var _1ab=objj_msgSend(self,"theme"),_1ac=objj_msgSend(objj_msgSend(self,"class"),"themeClass");
for(var _1ad in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1ad)){
objj_msgSend(_themeAttributes[_1ad],"setParentAttribute:",objj_msgSend(_1ab,"_attributeWithName:forClass:",_1ad,_1ac));
}
}
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("_themeAttributeDictionary"),function(self,_cmd){
with(self){
var _1b0=objj_msgSend(CPDictionary,"dictionary");
if(_themeAttributes){
var _1b1=objj_msgSend(self,"theme");
for(var _1b2 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1b2)){
objj_msgSend(_1b0,"setObject:forKey:",_themeAttributes[_1b2],_1b2);
}
}
}
return _1b0;
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:inState:"),function(self,_cmd,_1b5,_1b6,_1b7){
with(self){
if(!_themeAttributes||!_themeAttributes[_1b6]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1b6+"'");
}
var _1b8=objj_msgSend(self,"currentValueForThemeAttribute:",_1b6);
objj_msgSend(_themeAttributes[_1b6],"setValue:forState:",_1b5,_1b7);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_1b6)===_1b8){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:"),function(self,_cmd,_1bb,_1bc){
with(self){
if(!_themeAttributes||!_themeAttributes[_1bc]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1bc+"'");
}
var _1bd=objj_msgSend(self,"currentValueForThemeAttribute:",_1bc);
objj_msgSend(_themeAttributes[_1bc],"setValue:",_1bb);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_1bc)===_1bd){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("valueForThemeAttribute:inState:"),function(self,_cmd,_1c0,_1c1){
with(self){
if(!_themeAttributes||!_themeAttributes[_1c0]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1c0+"'");
}
return objj_msgSend(_themeAttributes[_1c0],"valueForState:",_1c1);
}
}),new objj_method(sel_getUid("valueForThemeAttribute:"),function(self,_cmd,_1c4){
with(self){
if(!_themeAttributes||!_themeAttributes[_1c4]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1c4+"'");
}
return objj_msgSend(_themeAttributes[_1c4],"value");
}
}),new objj_method(sel_getUid("currentValueForThemeAttribute:"),function(self,_cmd,_1c7){
with(self){
if(!_themeAttributes||!_themeAttributes[_1c7]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1c7+"'");
}
return objj_msgSend(_themeAttributes[_1c7],"valueForState:",_themeState);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(self,_cmd,_1ca){
with(self){
return nil;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(self,_cmd,_1cd){
with(self){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
}),new objj_method(sel_getUid("layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:"),function(self,_cmd,_1d0,_1d1,_1d2){
with(self){
if(!_ephemeralSubviewsForNames){
_ephemeralSubviewsForNames={};
_ephemeralSubviews=objj_msgSend(CPSet,"set");
}
var _1d3=objj_msgSend(self,"rectForEphemeralSubviewNamed:",_1d0);
if(_1d3&&!(_1d3.size.width<=0||_1d3.size.height<=0)){
if(!_ephemeralSubviewsForNames[_1d0]){
_ephemeralSubviewsForNames[_1d0]=objj_msgSend(self,"createEphemeralSubviewNamed:",_1d0);
objj_msgSend(_ephemeralSubviews,"addObject:",_ephemeralSubviewsForNames[_1d0]);
if(_ephemeralSubviewsForNames[_1d0]){
objj_msgSend(self,"addSubview:positioned:relativeTo:",_ephemeralSubviewsForNames[_1d0],_1d1,_ephemeralSubviewsForNames[_1d2]);
}
}
if(_ephemeralSubviewsForNames[_1d0]){
objj_msgSend(_ephemeralSubviewsForNames[_1d0],"setFrame:",_1d3);
}
}else{
if(_ephemeralSubviewsForNames[_1d0]){
objj_msgSend(_ephemeralSubviewsForNames[_1d0],"removeFromSuperview");
objj_msgSend(_ephemeralSubviews,"removeObject:",_ephemeralSubviewsForNames[_1d0]);
delete _ephemeralSubviewsForNames[_1d0];
}
}
return _ephemeralSubviewsForNames[_1d0];
}
})]);
class_addMethods(_c,[new objj_method(sel_getUid("themeClass"),function(self,_cmd){
with(self){
return nil;
}
}),new objj_method(sel_getUid("themeAttributes"),function(self,_cmd){
with(self){
return nil;
}
}),new objj_method(sel_getUid("_themeAttributes"),function(self,_cmd){
with(self){
if(!_2){
_2={};
}
var _1da=objj_msgSend(self,"class"),_1db=objj_msgSend(CPView,"class"),_1dc=[];
for(;_1da&&_1da!==_1db;_1da=objj_msgSend(_1da,"superclass")){
var _1dd=_2[class_getName(_1da)];
if(_1dd){
_1dc=_1dc.length?_1dc.concat(_1dd):_1dc;
_2[objj_msgSend(self,"className")]=_1dc;
break;
}
var _1de=objj_msgSend(_1da,"themeAttributes");
if(!_1de){
continue;
}
var _1df=objj_msgSend(_1de,"allKeys"),_1e0=_1df.length;
while(_1e0--){
var _1e1=_1df[_1e0];
_1dc.push(objj_msgSend(_1de,"objectForKey:",_1e1));
_1dc.push(_1e1);
}
}
return _1dc;
}
})]);
var _1e2="CPViewAutoresizingMask",_1e3="CPViewAutoresizesSubviews",_1e4="CPViewBackgroundColor",_1e5="CPViewBoundsKey",_1e6="CPViewFrameKey",_1e7="CPViewHitTestsKey",_1e8="CPViewIsHiddenKey",_1e9="CPViewOpacityKey",_1ea="CPViewSubviewsKey",_1eb="CPViewSuperviewKey",_1ec="CPViewTagKey",_1ed="CPViewThemeStateKey",_1ee="CPViewWindowKey",_1ef="CPViewNextKeyViewKey",_1f0="CPViewPreviousKeyViewKey";
var _b=objj_getClass("CPView");
if(!_b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_1f3){
with(self){
_DOMElement=_3.cloneNode(false);
_frame=objj_msgSend(_1f3,"decodeRectForKey:",_1e6);
_bounds=objj_msgSend(_1f3,"decodeRectForKey:",_1e5);
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"initWithCoder:",_1f3);
if(self){
_tag=objj_msgSend(_1f3,"containsValueForKey:",_1ec)?objj_msgSend(_1f3,"decodeIntForKey:",_1ec):-1;
_window=objj_msgSend(_1f3,"decodeObjectForKey:",_1ee);
_subviews=objj_msgSend(_1f3,"decodeObjectForKey:",_1ea)||[];
_superview=objj_msgSend(_1f3,"decodeObjectForKey:",_1eb);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_autoresizingMask=objj_msgSend(_1f3,"decodeIntForKey:",_1e2)||CPViewNotSizable;
_autoresizesSubviews=!objj_msgSend(_1f3,"containsValueForKey:",_1e3)||objj_msgSend(_1f3,"decodeBoolForKey:",_1e3);
_hitTests=!objj_msgSend(_1f3,"containsValueForKey:",_1e7)||objj_msgSend(_1f3,"decodeObjectForKey:",_1e7);
_DOMImageParts=[];
_DOMImageSizes=[];
if(NULL){
var _1f4={x:CGPointMake((_frame.origin.x),(_frame.origin.y)).x*NULL.a+CGPointMake((_frame.origin.x),(_frame.origin.y)).y*NULL.c+NULL.tx,y:CGPointMake((_frame.origin.x),(_frame.origin.y)).x*NULL.b+CGPointMake((_frame.origin.x),(_frame.origin.y)).y*NULL.d+NULL.ty};
}else{
var _1f4={x:(_frame.origin.x),y:(_frame.origin.y)};
}
_DOMElement.style.left=ROUND(_1f4.x)+"px";
_DOMElement.style.top=ROUND(_1f4.y)+"px";
_DOMElement.style.width=MAX(0,ROUND((_frame.size.width)))+"px";
_DOMElement.style.height=MAX(0,ROUND((_frame.size.height)))+"px";
var _1f5=0,_1f6=_subviews.length;
for(;_1f5<_1f6;++_1f5){
_DOMElement.appendChild(_subviews[_1f5]._DOMElement);
}
if(objj_msgSend(_1f3,"containsValueForKey:",_1e8)){
objj_msgSend(self,"setHidden:",objj_msgSend(_1f3,"decodeBoolForKey:",_1e8));
}else{
_isHidden=NO;
}
if(objj_msgSend(_1f3,"containsValueForKey:",_1e9)){
objj_msgSend(self,"setAlphaValue:",objj_msgSend(_1f3,"decodeIntForKey:",_1e9));
}else{
_opacity=1;
}
objj_msgSend(self,"setBackgroundColor:",objj_msgSend(_1f3,"decodeObjectForKey:",_1e4));
objj_msgSend(self,"setupViewFlags");
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeState(objj_msgSend(_1f3,"decodeIntForKey:",_1ed));
_themeAttributes={};
var _1f7=objj_msgSend(self,"class"),_1f8=objj_msgSend(_1f7,"themeClass"),_1f9=objj_msgSend(_1f7,"_themeAttributes"),_1f6=_1f9.length;
while(_1f6--){
var _1fa=_1f9[_1f6--];
_themeAttributes[_1fa]=CPThemeAttributeDecode(_1f3,_1fa,_1f9[_1f6],_theme,_1f8);
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_1fd){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"encodeWithCoder:",_1fd);
if(_tag!==-1){
objj_msgSend(_1fd,"encodeInt:forKey:",_tag,_1ec);
}
objj_msgSend(_1fd,"encodeRect:forKey:",_frame,_1e6);
objj_msgSend(_1fd,"encodeRect:forKey:",_bounds,_1e5);
if(_window!==nil){
objj_msgSend(_1fd,"encodeConditionalObject:forKey:",_window,_1ee);
}
var _1fe=objj_msgSend(_subviews,"count"),_1ff=_subviews;
if(_1fe>0&&objj_msgSend(_ephemeralSubviews,"count")>0){
_1ff=objj_msgSend(_1ff,"copy");
while(_1fe--){
if(objj_msgSend(_ephemeralSubviews,"containsObject:",_1ff[_1fe])){
_1ff.splice(_1fe,1);
}
}
}
if(_1ff.length>0){
objj_msgSend(_1fd,"encodeObject:forKey:",_1ff,_1ea);
}
if(_superview!==nil){
objj_msgSend(_1fd,"encodeConditionalObject:forKey:",_superview,_1eb);
}
if(_autoresizingMask!==CPViewNotSizable){
objj_msgSend(_1fd,"encodeInt:forKey:",_autoresizingMask,_1e2);
}
if(!_autoresizesSubviews){
objj_msgSend(_1fd,"encodeBool:forKey:",_autoresizesSubviews,_1e3);
}
if(_backgroundColor!==nil){
objj_msgSend(_1fd,"encodeObject:forKey:",_backgroundColor,_1e4);
}
if(_hitTests!==YES){
objj_msgSend(_1fd,"encodeBool:forKey:",_hitTests,_1e7);
}
if(_opacity!==1){
objj_msgSend(_1fd,"encodeFloat:forKey:",_opacity,_1e9);
}
if(_isHidden){
objj_msgSend(_1fd,"encodeBool:forKey:",_isHidden,_1e8);
}
var _200=objj_msgSend(self,"nextKeyView");
if(_200!==nil){
objj_msgSend(_1fd,"encodeConditionalObject:forKey:",_200,_1ef);
}
var _201=objj_msgSend(self,"previousKeyView");
if(_201!==nil){
objj_msgSend(_1fd,"encodeConditionalObject:forKey:",_201,_1f0);
}
objj_msgSend(_1fd,"encodeInt:forKey:",CPThemeStateName(_themeState),_1ed);
for(var _202 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_202)){
CPThemeAttributeEncode(_1fd,_themeAttributes[_202]);
}
}
}
})]);
var _a7=function(_203){
var _204=_203._superview;
return {autoresizingMask:_203._autoresizingMask,frame:CGRectMakeCopy(_203._frame),index:(_204?objj_msgSend(_204._subviews,"indexOfObjectIdenticalTo:",_203):0),superview:_204};
};
var _e6=function(_205,_206){
var _207=CGAffineTransformMakeIdentity(),_208=YES,_209=nil,_20a=nil;
if(_205){
var view=_205;
while(view&&view!=_206){
var _20c=view._frame;
_207.tx+=(_20c.origin.x);
_207.ty+=(_20c.origin.y);
if(view._boundsTransform){
var tx=_207.tx*view._boundsTransform.a+_207.ty*view._boundsTransform.c+view._boundsTransform.tx;
_207.ty=_207.tx*view._boundsTransform.b+_207.ty*view._boundsTransform.d+view._boundsTransform.ty;
_207.tx=tx;
var a=_207.a*view._boundsTransform.a+_207.b*view._boundsTransform.c,b=_207.a*view._boundsTransform.b+_207.b*view._boundsTransform.d,c=_207.c*view._boundsTransform.a+_207.d*view._boundsTransform.c;
_207.d=_207.c*view._boundsTransform.b+_207.d*view._boundsTransform.d;
_207.a=a;
_207.b=b;
_207.c=c;
}
view=view._superview;
}
if(view===_206){
return _207;
}else{
if(_205&&_206){
_209=objj_msgSend(_205,"window");
_20a=objj_msgSend(_206,"window");
if(_209&&_20a&&_209!==_20a){
_208=NO;
var _20c=objj_msgSend(_209,"frame");
_207.tx+=(_20c.origin.x);
_207.ty+=(_20c.origin.y);
}
}
}
}
var view=_206;
while(view){
var _20c=view._frame;
_207.tx-=(_20c.origin.x);
_207.ty-=(_20c.origin.y);
if(view._boundsTransform){
var tx=_207.tx*view._inverseBoundsTransform.a+_207.ty*view._inverseBoundsTransform.c+view._inverseBoundsTransform.tx;
_207.ty=_207.tx*view._inverseBoundsTransform.b+_207.ty*view._inverseBoundsTransform.d+view._inverseBoundsTransform.ty;
_207.tx=tx;
var a=_207.a*view._inverseBoundsTransform.a+_207.b*view._inverseBoundsTransform.c,b=_207.a*view._inverseBoundsTransform.b+_207.b*view._inverseBoundsTransform.d,c=_207.c*view._inverseBoundsTransform.a+_207.d*view._inverseBoundsTransform.c;
_207.d=_207.c*view._inverseBoundsTransform.b+_207.d*view._inverseBoundsTransform.d;
_207.a=a;
_207.b=b;
_207.c=c;
}
view=view._superview;
}
if(!_208){
var _20c=objj_msgSend(_20a,"frame");
_207.tx-=(_20c.origin.x);
_207.ty-=(_20c.origin.y);
}
return _207;
};
