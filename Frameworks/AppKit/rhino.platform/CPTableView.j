I;20;Foundation/CPArray.ji;11;CPControl.ji;15;CPTableColumn.ji;15;_CPCornerView.ji;12;CPScroller.jc;41553;
CPTableViewColumnDidMoveNotification="CPTableViewColumnDidMoveNotification";
CPTableViewColumnDidResizeNotification="CPTableViewColumnDidResizeNotification";
CPTableViewSelectionDidChangeNotification="CPTableViewSelectionDidChangeNotification";
CPTableViewSelectionIsChangingNotification="CPTableViewSelectionIsChangingNotification";
var _1=1<<2,_2=1<<3,_3=1<<4,_4=1<<5,_5=1<<6,_6=1<<7;
var _7=1<<0,_8=1<<1,_9=1<<2,_a=1<<3,_b=1<<4,_c=1<<5,_d=1<<6,_e=1<<7,_f=1<<8,_10=1<<9,_11=1<<10,_12=1<<11,_13=1<<12,_14=1<<13,_15=1<<14,_16=1<<15,_17=1<<16,_18=1<<17,_19=1<<18,_1a=1<<19;
CPTableViewSelectionHighlightStyleRegular=0;
CPTableViewSelectionHighlightStyleSourceList=1;
CPTableViewGridNone=0;
CPTableViewSolidVerticalGridLineMask=1<<0;
CPTableViewSolidHorizontalGridLineMask=1<<1;
var _1b=objj_allocateClassPair(CPView,"_CPTableDrawView"),_1c=_1b.isa;
class_addIvars(_1b,[new objj_ivar("_tableView")]);
objj_registerClassPair(_1b);
objj_addClassForBundle(_1b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1b,[new objj_method(sel_getUid("initWithTableView:"),function(_1d,_1e,_1f){
with(_1d){
_1d=objj_msgSendSuper({receiver:_1d,super_class:objj_getClass("CPView")},"init");
if(_1d){
_tableView=_1f;
}
return _1d;
}
}),new objj_method(sel_getUid("drawRect:"),function(_20,_21,_22){
with(_20){
var _23=objj_msgSend(_20,"frame"),_24=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextTranslateCTM(_24,-(_23.origin.x),-(_23.origin.y));
objj_msgSend(_tableView,"_drawRect:",_22);
}
})]);
var _1b=objj_allocateClassPair(CPControl,"CPTableView"),_1c=_1b.isa;
class_addIvars(_1b,[new objj_ivar("_dataSource"),new objj_ivar("_implementedDataSourceMethods"),new objj_ivar("_delegate"),new objj_ivar("_implementedDelegateMethods"),new objj_ivar("_tableColumns"),new objj_ivar("_tableColumnRanges"),new objj_ivar("_dirtyTableColumnRangeIndex"),new objj_ivar("_numberOfHiddenColumns"),new objj_ivar("_reloadAllRows"),new objj_ivar("_objectValues"),new objj_ivar("_exposedRows"),new objj_ivar("_exposedColumns"),new objj_ivar("_dataViewsForTableColumns"),new objj_ivar("_cachedDataViews"),new objj_ivar("_allowsColumnReordering"),new objj_ivar("_allowsColumnResizing"),new objj_ivar("_allowsMultipleSelection"),new objj_ivar("_allowsEmptySelection"),new objj_ivar("_intercellSpacing"),new objj_ivar("_rowHeight"),new objj_ivar("_usesAlternatingRowBackgroundColors"),new objj_ivar("_alternatingRowBackgroundColors"),new objj_ivar("_selectionHighlightMask"),new objj_ivar("_currentHighlightedTableColumn"),new objj_ivar("_gridStyleMask"),new objj_ivar("_gridColor"),new objj_ivar("_numberOfRows"),new objj_ivar("_headerView"),new objj_ivar("_cornerView"),new objj_ivar("_selectedColumnIndexes"),new objj_ivar("_selectedRowIndexes"),new objj_ivar("_selectionAnchorRow"),new objj_ivar("_tableDrawView")]);
objj_registerClassPair(_1b);
objj_addClassForBundle(_1b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1b,[new objj_method(sel_getUid("initWithFrame:"),function(_25,_26,_27){
with(_25){
_25=objj_msgSendSuper({receiver:_25,super_class:objj_getClass("CPControl")},"initWithFrame:",_27);
if(_25){
_allowsColumnReordering=YES;
_allowsColumnResizing=YES;
_allowsMultipleSelection=NO;
_allowsEmptySelection=YES;
_allowsColumnSelection=NO;
_tableViewFlags=0;
_selectionHighlightMask=CPTableViewSelectionHighlightStyleRegular;
objj_msgSend(_25,"setUsesAlternatingRowBackgroundColors:",NO);
objj_msgSend(_25,"setAlternatingRowBackgroundColors:",[objj_msgSend(CPColor,"whiteColor"),objj_msgSend(CPColor,"colorWithHexString:","e4e7ff")]);
_tableColumns=[];
_tableColumnRanges=[];
_dirtyTableColumnRangeIndex=CPNotFound;
_numberOfHiddenColumns=0;
_objectValues={};
_dataViewsForTableColumns={};
_dataViews=[];
_numberOfRows=0;
_exposedRows=objj_msgSend(CPIndexSet,"indexSet");
_exposedColumns=objj_msgSend(CPIndexSet,"indexSet");
_cachedDataViews={};
_intercellSpacing={width:0,height:0};
_rowHeight=19;
objj_msgSend(_25,"setGridColor:",objj_msgSend(CPColor,"grayColor"));
objj_msgSend(_25,"setGridStyleMask:",CPTableViewGridNone);
_headerView=objj_msgSend(objj_msgSend(CPTableHeaderView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(_25,"bounds").size.width,_rowHeight));
objj_msgSend(_headerView,"setTableView:",_25);
_cornerView=objj_msgSend(objj_msgSend(_CPCornerView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(CPScroller,"scrollerWidth"),CGRectGetHeight(objj_msgSend(_headerView,"frame"))));
_selectedColumnIndexes=objj_msgSend(CPIndexSet,"indexSet");
_selectedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
_tableDrawView=objj_msgSend(objj_msgSend(_CPTableDrawView,"alloc"),"initWithTableView:",_25);
objj_msgSend(_tableDrawView,"setBackgroundColor:",objj_msgSend(CPColor,"clearColor"));
objj_msgSend(_25,"addSubview:",_tableDrawView);
}
return _25;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_28,_29,_2a){
with(_28){
if(_dataSource===_2a){
return;
}
_dataSource=_2a;
_implementedDataSourceMethods=0;
if(!_dataSource){
return;
}
if(!objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("numberOfRowsInTableView:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,objj_msgSend(_2a,"description")+" does not implement numberOfRowsInTableView:.");
}
if(!objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:objectValueForTableColumn:row:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,objj_msgSend(_2a,"description")+" does not implement tableView:objectValueForTableColumn:row:");
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:setObjectValue:forTableColumn:row:"))){
_implementedDataSourceMethods|=_1;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:setObjectValue:forTableColumn:row:"))){
_implementedDataSourceMethods|=_2;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:namesOfPromisedFilesDroppedAtDestination:forDraggedRowsWithIndexes:"))){
_implementedDataSourceMethods|=_3;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:validateDrop:proposedRow:proposedDropOperation:"))){
_implementedDataSourceMethods|=_4;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:writeRowsWithIndexes:toPasteboard:"))){
_implementedDataSourceMethods|=_5;
}
objj_msgSend(_28,"reloadData");
}
}),new objj_method(sel_getUid("dataSource"),function(_2b,_2c){
with(_2b){
return _dataSource;
}
}),new objj_method(sel_getUid("reloadData"),function(_2d,_2e){
with(_2d){
if(!_dataSource){
return;
}
_reloadAllRows=YES;
_objectValues={};
objj_msgSend(_2d,"noteNumberOfRowsChanged");
objj_msgSend(_2d,"setNeedsLayout");
objj_msgSend(_2d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setDoubleAction:"),function(_2f,_30,_31){
with(_2f){
_doubleAction=_31;
}
}),new objj_method(sel_getUid("doubleAction"),function(_32,_33){
with(_32){
return _doubleAction;
}
}),new objj_method(sel_getUid("setAllowsColumnReordering:"),function(_34,_35,_36){
with(_34){
_allowsColumnReordering=!!_36;
}
}),new objj_method(sel_getUid("allowsColumnReordering"),function(_37,_38){
with(_37){
return _allowsColumnReordering;
}
}),new objj_method(sel_getUid("setAllowsColumnResizing:"),function(_39,_3a,_3b){
with(_39){
_allowsColumnResizing=!!_3b;
}
}),new objj_method(sel_getUid("allowsColumnResizing"),function(_3c,_3d){
with(_3c){
return _allowsColumnResizing;
}
}),new objj_method(sel_getUid("setAllowsMultipleSelection:"),function(_3e,_3f,_40){
with(_3e){
_allowsMultipleSelection=!!_40;
}
}),new objj_method(sel_getUid("allowsMultipleSelection"),function(_41,_42){
with(_41){
return _allowsMultipleSelection;
}
}),new objj_method(sel_getUid("setAllowsEmptySelection:"),function(_43,_44,_45){
with(_43){
_allowsEmptySelection=!!_45;
}
}),new objj_method(sel_getUid("allowsEmptySelection"),function(_46,_47){
with(_46){
return _allowsEmptySelection;
}
}),new objj_method(sel_getUid("setAllowsColumnSelection:"),function(_48,_49,_4a){
with(_48){
_allowsColumnSelection=!!_4a;
}
}),new objj_method(sel_getUid("allowsColumnSelection"),function(_4b,_4c){
with(_4b){
return _allowsColumnSelection;
}
}),new objj_method(sel_getUid("setIntercellSpacing:"),function(_4d,_4e,_4f){
with(_4d){
if((_intercellSpacing.width==_4f.width&&_intercellSpacing.height==_4f.height)){
return;
}
_intercellSpacing={width:_4f.width,height:_4f.height};
objj_msgSend(_4d,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setThemeState:"),function(_50,_51,_52){
with(_50){
}
}),new objj_method(sel_getUid("intercellSpacing"),function(_53,_54){
with(_53){
return {width:_intercellSpacing.width,height:_intercellSpacing.height};
}
}),new objj_method(sel_getUid("setRowHeight:"),function(_55,_56,_57){
with(_55){
_57=+_57;
if(_rowHeight===_57){
return;
}
_rowHeight=MAX(0,_57);
objj_msgSend(_55,"setNeedsLayout");
}
}),new objj_method(sel_getUid("rowHeight"),function(_58,_59){
with(_58){
return _rowHeight;
}
}),new objj_method(sel_getUid("setUsesAlternatingRowBackgroundColors:"),function(_5a,_5b,_5c){
with(_5a){
_usesAlternatingRowBackgroundColors=_5c;
}
}),new objj_method(sel_getUid("usesAlternatingRowBackgroundColors"),function(_5d,_5e){
with(_5d){
return _usesAlternatingRowBackgroundColors;
}
}),new objj_method(sel_getUid("setAlternatingRowBackgroundColors:"),function(_5f,_60,_61){
with(_5f){
if(objj_msgSend(_alternatingRowBackgroundColors,"isEqual:",_61)){
return;
}
_alternatingRowBackgroundColors=_61;
objj_msgSend(_5f,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("alternatingRowBackgroundColors"),function(_62,_63){
with(_62){
return _alternatingRowBackgroundColors;
}
}),new objj_method(sel_getUid("selectionHighlightStyle"),function(_64,_65){
with(_64){
return _selectionHighlightMask;
}
}),new objj_method(sel_getUid("setSelectionHighlightStyle:"),function(_66,_67,_68){
with(_66){
_selectionHighlightMask=_68;
}
}),new objj_method(sel_getUid("setGridColor:"),function(_69,_6a,_6b){
with(_69){
if(_gridColor===_6b){
return;
}
_gridColor=_6b;
objj_msgSend(_69,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("gridColor"),function(_6c,_6d){
with(_6c){
return _gridColor;
}
}),new objj_method(sel_getUid("setGridStyleMask:"),function(_6e,_6f,_70){
with(_6e){
if(_gridStyleMask===_70){
return;
}
_gridStyleMask=_70;
objj_msgSend(_6e,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("gridStyleMask"),function(_71,_72){
with(_71){
return _gridStyleMask;
}
}),new objj_method(sel_getUid("addTableColumn:"),function(_73,_74,_75){
with(_73){
objj_msgSend(_tableColumns,"addObject:",_75);
objj_msgSend(_75,"setTableView:",_73);
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=(_tableColumns.length)-1;
}else{
_dirtyTableColumnRangeIndex=MIN((_tableColumns.length)-1,_dirtyTableColumnRangeIndex);
}
objj_msgSend(_73,"setNeedsLayout");
}
}),new objj_method(sel_getUid("removeTableColumn:"),function(_76,_77,_78){
with(_76){
if(objj_msgSend(_78,"tableView")!==_76){
return;
}
var _79=objj_msgSend(_tableColumns,"indeOfObjectIdenticalTo:",_78);
if(_79===CPNotFound){
return;
}
objj_msgSend(_78,"setTableView:",nil);
objj_msgSend(_tableColumns,"removeObjectAtIndex:",_79);
var _7a=objj_msgSend(_78,"UID");
if(_objectValues[_7a]){
_objectValues[_7a]=nil;
}
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=_79;
}else{
_dirtyTableColumnRangeIndex=MIN(_79,_dirtyTableColumnRangeIndex);
}
objj_msgSend(_76,"setNeedsLayout");
}
}),new objj_method(sel_getUid("moveColumn:toColumn:"),function(_7b,_7c,_7d,_7e){
with(_7b){
_7d=+_7d;
_7e=+_7e;
if(_7d===_7e){
return;
}
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=MIN(_7d,_7e);
}else{
_dirtyTableColumnRangeIndex=MIN(_7d,_7e,_dirtyTableColumnRangeIndex);
}
if(_7e>_7d){
--_7e;
}
var _7f=_tableColumns[_7d];
objj_msgSend(_tableColumns,"removeObjectAtIndex:",_7d);
objj_msgSend(_tableColumns,"insertObject:atIndex:",_7f,_7e);
objj_msgSend(_7b,"setNeedsLayout");
}
}),new objj_method(sel_getUid("tableColumns"),function(_80,_81){
with(_80){
return _tableColumns;
}
}),new objj_method(sel_getUid("columnWithIdentifier:"),function(_82,_83,_84){
with(_82){
var _85=0,_86=(_tableColumns.length);
for(;_85<_86;++_85){
if(objj_msgSend(_tableColumns,"identifier")===_84){
return _85;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("tableColumnWithIdentifier:"),function(_87,_88,_89){
with(_87){
var _8a=objj_msgSend(_87,"columnWithIdentifier:",_89);
if(_8a===CPNotFound){
return nil;
}
return _tableColumns[_8a];
}
}),new objj_method(sel_getUid("selectColumnIndexes:byExtendingSelection:"),function(_8b,_8c,_8d,_8e){
with(_8b){
_selectedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
if(_8e){
objj_msgSend(_selectedColumnIndexes,"addIndexes:",_8d);
}else{
_selectedColumnIndexes=objj_msgSend(_8d,"copy");
}
objj_msgSend(_8b,"setNeedsLayout");
}
}),new objj_method(sel_getUid("selectRowIndexes:byExtendingSelection:"),function(_8f,_90,_91,_92){
with(_8f){
_selectedColumnIndexes=objj_msgSend(CPIndexSet,"indexSet");
if(_92){
objj_msgSend(_selectedRowIndexes,"addIndexes:",_91);
}else{
_selectedRowIndexes=objj_msgSend(_91,"copy");
}
objj_msgSend(_8f,"setNeedsLayout");
}
}),new objj_method(sel_getUid("selectedColumnIndexes"),function(_93,_94){
with(_93){
return _selectedColumnIndexes;
}
}),new objj_method(sel_getUid("selectedRowIndexes"),function(_95,_96){
with(_95){
return _selectedRowIndexes;
}
}),new objj_method(sel_getUid("deselectColumn:"),function(_97,_98,_99){
with(_97){
objj_msgSend(_selectedColumnIndexes,"removeIndex:",_99);
}
}),new objj_method(sel_getUid("deselectRow:"),function(_9a,_9b,_9c){
with(_9a){
objj_msgSend(_selectedRowIndexes,"removeIndex:",_9c);
}
}),new objj_method(sel_getUid("numberOfSelectedColumns"),function(_9d,_9e){
with(_9d){
return objj_msgSend(_selectedColumnIndexes,"count");
}
}),new objj_method(sel_getUid("numberOfSelectedRows"),function(_9f,_a0){
with(_9f){
return objj_msgSend(_selectedRowIndexes,"count");
}
}),new objj_method(sel_getUid("isColumnSelected:"),function(_a1,_a2,_a3){
with(_a1){
return objj_msgSend(_selectedColumnIndexes,"containsIndex:",_a3);
}
}),new objj_method(sel_getUid("isRowSelected:"),function(_a4,_a5,_a6){
with(_a4){
return objj_msgSend(_selectedRowIndexes,"containsIndex:",_a6);
}
}),new objj_method(sel_getUid("numberOfColumns"),function(_a7,_a8){
with(_a7){
return (_tableColumns.length);
}
}),new objj_method(sel_getUid("numberOfRows"),function(_a9,_aa){
with(_a9){
if(!_dataSource){
return 0;
}
return objj_msgSend(_dataSource,"numberOfRowsInTableView:",_a9);
}
}),new objj_method(sel_getUid("cornerView"),function(_ab,_ac){
with(_ab){
return _cornerView;
}
}),new objj_method(sel_getUid("setCornerView:"),function(_ad,_ae,_af){
with(_ad){
if(_cornerView===_af){
return;
}
_cornerView=_af;
var _b0=objj_msgSend(objj_msgSend(_ad,"superview"),"superview");
if(objj_msgSend(_b0,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))&&objj_msgSend(_b0,"documentView")===_ad){
objj_msgSend(_b0,"_updateCornerAndHeaderView");
}
}
}),new objj_method(sel_getUid("headerView"),function(_b1,_b2){
with(_b1){
return _headerView;
}
}),new objj_method(sel_getUid("setHeaderView:"),function(_b3,_b4,_b5){
with(_b3){
if(_headerView===_b5){
return;
}
objj_msgSend(_headerView,"setTableView:",nil);
_headerView=_b5;
if(_headerView){
objj_msgSend(_headerView,"setTableView:",_b3);
objj_msgSend(_headerView,"setFrameSize:",{width:aSize.width,height:objj_msgSend(_headerView,"frame").size.height});
}
var _b6=objj_msgSend(objj_msgSend(_b3,"superview"),"superview");
if(objj_msgSend(_b6,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))&&objj_msgSend(_b6,"documentView")===_b3){
objj_msgSend(_b6,"_updateCornerAndHeaderView");
}
}
}),new objj_method(sel_getUid("_recalculateTableColumnRanges"),function(_b7,_b8){
with(_b7){
if(_dirtyTableColumnRangeIndex<0){
return;
}
var _b9=_dirtyTableColumnRangeIndex,_ba=(_tableColumns.length),x=_b9===0?0:CPMaxRange(_tableColumnRanges[_b9-1]);
for(;_b9<_ba;++_b9){
var _bc=_tableColumns[_b9];
if(objj_msgSend(_bc,"isHidden")){
_tableColumnRanges[_b9]=CPMakeRange(x,0);
}else{
var _bd=objj_msgSend(_tableColumns[_b9],"width");
_tableColumnRanges[_b9]=CPMakeRange(x,_bd);
x+=_bd;
}
}
_tableColumnRanges.length=_ba;
_dirtyTableColumnRangeIndex=CPNotFound;
}
}),new objj_method(sel_getUid("rectOfColumn:"),function(_be,_bf,_c0){
with(_be){
_c0=+_c0;
if(_c0<0||_c0>=(_tableColumns.length)){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_be,"_recalculateTableColumnRanges");
}
var _c1=_tableColumnRanges[_c0];
return {origin:{x:_c1.location,y:0},size:{width:_c1.length,height:CGRectGetHeight(objj_msgSend(_be,"bounds"))}};
}
}),new objj_method(sel_getUid("rectOfRow:"),function(_c2,_c3,_c4){
with(_c2){
if(NO){
return NULL;
}
return {origin:{x:0,y:(_c4*(_rowHeight+_intercellSpacing.height))},size:{width:(objj_msgSend(_c2,"bounds").size.width),height:_rowHeight}};
}
}),new objj_method(sel_getUid("rowsInRect:"),function(_c5,_c6,_c7){
with(_c5){
if(_numberOfRows<=0){
return CPMakeRange(0,0);
}
var _c8=objj_msgSend(_c5,"bounds");
if(!CGRectIntersectsRect(_c7,_c8)){
return CPMakeRange(0,0);
}
var _c9=objj_msgSend(_c5,"rowAtPoint:",_c7.origin);
if(_c9<0){
_c9=0;
}
var _ca=objj_msgSend(_c5,"rowAtPoint:",{x:0,y:(_c7.origin.y+_c7.size.height)});
if(_ca<0){
_ca=_numberOfRows-1;
}
return CPMakeRange(_c9,_ca-_c9+1);
}
}),new objj_method(sel_getUid("columnIndexesInRect:"),function(_cb,_cc,_cd){
with(_cb){
var _ce=MAX(0,objj_msgSend(_cb,"columnAtPoint:",{x:_cd.origin.x,y:0})),_cf=objj_msgSend(_cb,"columnAtPoint:",{x:(_cd.origin.x+_cd.size.width),y:0});
if(_cf===CPNotFound){
_cf=(_tableColumns.length)-1;
}
if(_numberOfHiddenColumns<=0){
return objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(_ce,_cf-_ce+1));
}
var _d0=objj_msgSend(CPIndexSet,"indexSet");
for(;_ce<=_cf;++_ce){
var _d1=_tableColumns[_ce];
if(!objj_msgSend(_d1,"isHidden")){
objj_msgSend(_d0,"addIndex:",_ce);
}
}
return _d0;
}
}),new objj_method(sel_getUid("columnAtPoint:"),function(_d2,_d3,_d4){
with(_d2){
var _d5=objj_msgSend(_d2,"bounds");
if(!(_d4.x>=(_d5.origin.x)&&_d4.y>=(_d5.origin.y)&&_d4.x<(_d5.origin.x+_d5.size.width)&&_d4.y<(_d5.origin.y+_d5.size.height))){
return CPNotFound;
}
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_d2,"_recalculateTableColumnRanges");
}
var x=_d4.x,low=0,_d8=_tableColumnRanges.length-1;
while(low<=_d8){
var _d9=FLOOR(low+(_d8-low)/2),_da=_tableColumnRanges[_d9];
if(x<_da.location){
_d8=_d9-1;
}else{
if(x>=CPMaxRange(_da)){
low=_d9+1;
}else{
var _db=_tableColumnRanges.length;
while(_d9<_db&&objj_msgSend(_tableColumns[_d9],"isHidden")){
++_d9;
}
if(_d9<_db){
return _d9;
}
return CPNotFound;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("rowAtPoint:"),function(_dc,_dd,_de){
with(_dc){
var y=_de.y;
if(NO){
}
var row=FLOOR(y/(_rowHeight+_intercellSpacing.height));
if(row>=_numberOfRows){
return -1;
}
return row;
}
}),new objj_method(sel_getUid("frameOfDataViewAtColumn:row:"),function(_e1,_e2,_e3,_e4){
with(_e1){
var _e5=_tableColumns[_e3],_e6=objj_msgSend(_e1,"rectOfRow:",_e4);
return {origin:{x:_e5.location,y:(_e6.origin.y)},size:{width:_e5.length,height:(_e6.size.height)}};
}
}),new objj_method(sel_getUid("sizeLastColumnToFit"),function(_e7,_e8){
with(_e7){
var _e9=objj_msgSend(_e7,"superview");
if(!_e9){
return;
}
var _ea=objj_msgSend(_e9,"bounds").size;
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_e7,"_recalculateTableColumnRanges");
}
var _eb=(_tableColumns.length);
while(_eb--&&objj_msgSend(_tableColumns[_eb],"isHidden")){
}
if(_eb>=0){
objj_msgSend(_tableColumns[_eb],"setWidth:",MAX(0,_ea.width-(objj_msgSend(_e7,"rectOfColumn:",_eb).origin.x)));
}
objj_msgSend(_e7,"setNeedsLayout");
}
}),new objj_method(sel_getUid("noteNumberOfRowsChanged"),function(_ec,_ed){
with(_ec){
_numberOfRows=objj_msgSend(_dataSource,"numberOfRowsInTableView:",_ec);
objj_msgSend(_ec,"tile");
}
}),new objj_method(sel_getUid("tile"),function(_ee,_ef){
with(_ee){
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_ee,"_recalculateTableColumnRanges");
}
var _f0=_tableColumnRanges.length>0?CPMaxRange(objj_msgSend(_tableColumnRanges,"lastObject")):0,_f1=(_rowHeight+_intercellSpacing.height)*_numberOfRows,_f2=objj_msgSend(_ee,"superview");
if(objj_msgSend(_f2,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
var _f3=objj_msgSend(_f2,"bounds").size;
_f0=MAX(_f3.width,_f0);
_f1=MAX(_f3.height,_f1);
}
objj_msgSend(_ee,"setFrameSize:",{width:_f0,height:_f1});
objj_msgSend(_ee,"setNeedsLayout");
objj_msgSend(_ee,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setDelegate:"),function(_f4,_f5,_f6){
with(_f4){
if(_delegate===_f6){
return;
}
var _f7=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidMove:"))){
objj_msgSend(_f7,"removeObserver:name:object:",_delegate,CPTableViewColumnDidMoveNotification,_f4);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidResize:"))){
objj_msgSend(_f7,"removeObserver:name:object:",_delegate,CPTableViewColumnDidResizeNotification,_f4);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionDidChange:"))){
objj_msgSend(_f7,"removeObserver:name:object:",_delegate,CPTableViewSelectionDidChangeNotification,_f4);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionIsChanging:"))){
objj_msgSend(_f7,"removeObserver:name:object:",_delegate,CPTableViewSelectionIsChangingNotification,_f4);
}
}
_delegate=_f6;
_implementedDelegateMethods=0;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("selectionShouldChangeInTableView:"))){
_implementedDelegateMethods|=_7;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:dataViewForTableColumn:row:"))){
_implementedDelegateMethods|=_8;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:didClickTableColumn:"))){
_implementedDelegateMethods|=_9;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:didDragTableColumn:"))){
_implementedDelegateMethods|=_a;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:heightOfRow:"))){
_implementedDelegateMethods|=_b;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:isGroupRow:"))){
_implementedDelegateMethods|=_c;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:mouseDownInHeaderOfTableColumn:"))){
_implementedDelegateMethods|=_d;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:nextTypeSelectMatchFromRow:toRow:forString:"))){
_implementedDelegateMethods|=_e;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:selectionIndexesForProposedSelection:"))){
_implementedDelegateMethods|=_f;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldEditTableColumn:row:"))){
_implementedDelegateMethods|=_10;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldSelectRow:"))){
_implementedDelegateMethods|=_11;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldSelectTableColumn:"))){
_implementedDelegateMethods|=_12;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldShowViewExpansionForTableColumn:row:"))){
_implementedDelegateMethods|=_13;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldTrackView:forTableColumn:row:"))){
_implementedDelegateMethods|=_14;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldTypeSelectForEvent:withCurrentSearchString:"))){
_implementedDelegateMethods|=_15;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:toolTipForView:rect:tableColumn:row:mouseLocation:"))){
_implementedDelegateMethods|=_16;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:typeSelectStringForTableColumn:row:"))){
_implementedDelegateMethods|=_17;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:willDisplayView:forTableColumn:row:"))){
_implementedDelegateMethods|=_18;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidMove:"))){
objj_msgSend(_f7,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewColumnDidMove:"),CPTableViewColumnDidMoveNotification,_f4);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidResize:"))){
objj_msgSend(_f7,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewColumnDidMove:"),CPTableViewColumnDidResizeNotification,_f4);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionDidChange:"))){
objj_msgSend(_f7,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewSelectionDidChange:"),CPTableViewSelectionDidChangeNotification,_f4);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionIsChanging:"))){
objj_msgSend(_f7,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewSelectionIsChanging:"),CPTableViewSelectionIsChangingNotification,_f4);
}
}
}),new objj_method(sel_getUid("delegate"),function(_f8,_f9){
with(_f8){
return _delegate;
}
}),new objj_method(sel_getUid("_objectValueForTableColumn:row:"),function(_fa,_fb,_fc,_fd){
with(_fa){
var _fe=objj_msgSend(_fc,"UID"),_ff=_objectValues[_fe];
if(!_ff){
_ff=[];
_objectValues[_fe]=_ff;
}
var _100=_ff[_fd];
if(_100===undefined){
_100=objj_msgSend(_dataSource,"tableView:objectValueForTableColumn:row:",_fa,_fc,_fd);
_ff[_fd]=_100;
}
return _100;
}
}),new objj_method(sel_getUid("_exposedRect"),function(self,_cmd){
with(self){
var _103=objj_msgSend(self,"superview");
if(!objj_msgSend(_103,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
return objj_msgSend(self,"bounds");
}
return objj_msgSend(self,"convertRect:fromView:",CGRectIntersection(objj_msgSend(_103,"bounds"),objj_msgSend(self,"frame")),_103);
}
}),new objj_method(sel_getUid("load"),function(self,_cmd){
with(self){
if(_reloadAllRows){
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_exposedRows,_exposedColumns);
_exposedRows=objj_msgSend(CPIndexSet,"indexSet");
_exposedColumns=objj_msgSend(CPIndexSet,"indexSet");
_reloadAllRows=NO;
}
var _106=objj_msgSend(self,"_exposedRect"),_107=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",objj_msgSend(self,"rowsInRect:",_106)),_108=objj_msgSend(self,"columnIndexesInRect:",_106),_109=objj_msgSend(_exposedRows,"copy"),_10a=objj_msgSend(_exposedColumns,"copy");
objj_msgSend(_109,"removeIndexes:",_107);
objj_msgSend(_10a,"removeIndexes:",_108);
var _10b=objj_msgSend(_107,"copy"),_10c=objj_msgSend(_108,"copy");
objj_msgSend(_10b,"removeIndexes:",_exposedRows);
objj_msgSend(_10c,"removeIndexes:",_exposedColumns);
var _10d=objj_msgSend(_107,"copy"),_10e=objj_msgSend(_108,"copy");
objj_msgSend(_10d,"removeIndexes:",_10b);
objj_msgSend(_10e,"removeIndexes:",_10c);
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_10d,_10a);
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_109,_10e);
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_109,_10a);
objj_msgSend(self,"_loadDataViewsInRows:columns:",_10d,_10c);
objj_msgSend(self,"_loadDataViewsInRows:columns:",_10b,_10e);
objj_msgSend(self,"_loadDataViewsInRows:columns:",_10b,_10c);
_exposedRows=_107;
_exposedColumns=_108;
objj_msgSend(_tableDrawView,"setFrame:",_106);
objj_msgSend(_tableDrawView,"display");
for(identifier in _cachedDataViews){
var _10f=_cachedDataViews[identifier],_110=_10f.length;
while(_110--){
objj_msgSend(_10f[_110],"removeFromSuperview");
}
}
}
}),new objj_method(sel_getUid("_unloadDataViewsInRows:columns:"),function(self,_cmd,rows,_114){
with(self){
if(!objj_msgSend(rows,"count")||!objj_msgSend(_114,"count")){
return;
}
var _115=[],_116=[];
objj_msgSend(rows,"getIndexes:maxCount:inIndexRange:",_115,-1,nil);
objj_msgSend(_114,"getIndexes:maxCount:inIndexRange:",_116,-1,nil);
var _117=0,_118=_116.length;
for(;_117<_118;++_117){
var _119=_116[_117],_11a=_tableColumns[_119],_11b=objj_msgSend(_11a,"UID");
var _11c=0,_11d=_115.length;
for(;_11c<_11d;++_11c){
var row=_115[_11c],_11f=_dataViewsForTableColumns[_11b][row];
_dataViewsForTableColumns[_11b][row]=nil;
if(!_cachedDataViews[_11f.identifier]){
_cachedDataViews[_11f.identifier]=[_11f];
}else{
_cachedDataViews[_11f.identifier].push(_11f);
}
}
}
}
}),new objj_method(sel_getUid("_loadDataViewsInRows:columns:"),function(self,_cmd,rows,_123){
with(self){
if(!objj_msgSend(rows,"count")||!objj_msgSend(_123,"count")){
return;
}
var _124=[],_125=[],_126=[];
objj_msgSend(rows,"getIndexes:maxCount:inIndexRange:",_124,-1,nil);
objj_msgSend(_123,"getIndexes:maxCount:inIndexRange:",_126,-1,nil);
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(self,"_recalculateTableColumnRanges");
}
var _127=0,_128=_126.length;
for(;_127<_128;++_127){
var _129=_126[_127],_12a=_tableColumns[_129],_12b=objj_msgSend(_12a,"UID"),_12c=_tableColumnRanges[_129];
if(!_dataViewsForTableColumns[_12b]){
_dataViewsForTableColumns[_12b]=[];
}
var _12d=0,_12e=_124.length;
for(;_12d<_12e;++_12d){
var row=_124[_12d],_130=objj_msgSend(_12a,"_newDataViewForRow:",row),_131=_125[row];
if(!_131){
_131=_125[row]=objj_msgSend(self,"rectOfRow:",row);
}
objj_msgSend(_130,"setFrame:",{origin:{x:_12c.location,y:(_131.origin.y)},size:{width:_12c.length,height:(_131.size.height)}});
objj_msgSend(_130,"setObjectValue:",objj_msgSend(self,"_objectValueForTableColumn:row:",_12a,row));
if(objj_msgSend(_130,"superview")!==self){
objj_msgSend(self,"addSubview:",_130);
}
_dataViewsForTableColumns[_12b][row]=_130;
}
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(self,_cmd,_134){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPControl")},"setFrameSize:",_134);
if(_headerView){
objj_msgSend(_headerView,"setFrameSize:",{width:_134.width,height:objj_msgSend(_headerView,"frame").size.height});
}
}
}),new objj_method(sel_getUid("exposedClipRect"),function(self,_cmd){
with(self){
var _137=objj_msgSend(self,"superview");
if(!objj_msgSend(_137,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
return objj_msgSend(self,"bounds");
}
return objj_msgSend(self,"convertRect:fromView:",CGRectIntersection(objj_msgSend(_137,"bounds"),objj_msgSend(self,"frame")),_137);
}
}),new objj_method(sel_getUid("_drawRect:"),function(self,_cmd,_13a){
with(self){
var _13b=objj_msgSend(self,"_exposedRect");
objj_msgSend(self,"drawBackgroundInClipRect:",_13b);
objj_msgSend(self,"highlightSelectionInClipRect:",_13b);
objj_msgSend(self,"drawGridInClipRect:",_13b);
}
}),new objj_method(sel_getUid("drawBackgroundInClipRect:"),function(self,_cmd,_13e){
with(self){
if(!objj_msgSend(self,"usesAlternatingRowBackgroundColors")){
return;
}
var _13f=objj_msgSend(self,"alternatingRowBackgroundColors"),_140=objj_msgSend(_13f,"count");
if(_140===0){
return;
}
var _141=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
if(_140===1){
CGContextSetFillColor(_141,_13f[0]);
CGContextFillRect(_141,_13e);
return;
}
var _142=objj_msgSend(self,"rowsInRect:",_13e),_143=_142.location,_144=CPMaxRange(_142)-1,_145=MIN(_142.length,_140),_146=0;
while(_145--){
var row=_143%_140+_143+_145,_148=nil;
CGContextBeginPath(_141);
for(;row<=_144;row+=_140){
CGContextAddRect(_141,CGRectIntersection(_13e,_148=objj_msgSend(self,"rectOfRow:",row)));
}
if(row-_140===_144){
_146=(_148.origin.y+_148.size.height);
}
CGContextClosePath(_141);
CGContextSetFillColor(_141,_13f[_145]);
CGContextFillPath(_141);
}
var _149=(_13e.origin.y+_13e.size.height);
if(_146>=_149||_rowHeight<=0){
return;
}
var _14a=_rowHeight+_intercellSpacing.height,_148={origin:{x:(_13e.origin.x),y:(_13e.origin.y)+_146},size:{width:(_13e.size.width),height:_14a}};
for(row=_144+1;_146<_149;++row){
CGContextSetFillColor(_141,_13f[row%_140]);
CGContextFillRect(_141,_148);
_146+=_14a;
_148.origin.y+=_14a;
}
}
}),new objj_method(sel_getUid("drawGridInClipRect:"),function(self,_cmd,_14d){
with(self){
var _14e=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_14f=objj_msgSend(self,"gridStyleMask");
if(!(_14f&(CPTableViewSolidHorizontalGridLineMask|CPTableViewSolidVerticalGridLineMask))){
return;
}
CGContextBeginPath(_14e);
if(_14f&CPTableViewSolidHorizontalGridLineMask){
var _150=objj_msgSend(self,"rowsInRect:",_14d);
row=_150.location,lastRow=CPMaxRange(_150)-1,rowY=0,minX=(_14d.origin.x),maxX=(_14d.origin.x+_14d.size.width);
for(;row<=lastRow;++row){
var _152=objj_msgSend(self,"rectOfRow:",row),rowY=(_152.origin.y+_152.size.height)-0.5;
CGContextMoveToPoint(_14e,minX,rowY);
CGContextAddLineToPoint(_14e,maxX,rowY);
}
if(_rowHeight>0){
var _153=_rowHeight+_intercellSpacing.height,_154=(_14d.origin.y+_14d.size.height);
while(rowY<_154){
rowY+=_153;
CGContextMoveToPoint(_14e,minX,rowY);
CGContextAddLineToPoint(_14e,maxX,rowY);
}
}
}
if(_14f&CPTableViewSolidVerticalGridLineMask){
var _155=objj_msgSend(self,"columnIndexesInRect:",_14d),_156=[];
objj_msgSend(_155,"getIndexes:maxCount:inIndexRange:",_156,-1,nil);
var _157=0,_158=_156.length,minY=(_14d.origin.y),maxY=(_14d.origin.y+_14d.size.height);
for(;_157<_158;++_157){
var _15b=objj_msgSend(self,"rectOfColumn:",_157),_15c=(_15b.origin.x+_15b.size.width)-0.5;
CGContextMoveToPoint(_14e,_15c,minY);
CGContextAddLineToPoint(_14e,_15c,maxY);
}
}
CGContextClosePath(_14e);
CGContextSetStrokeColor(_14e,_gridColor);
CGContextStrokePath(_14e);
}
}),new objj_method(sel_getUid("highlightSelectionInClipRect:"),function(self,_cmd,_15f){
with(self){
if(objj_msgSend(self,"selectionHighlightStyle")===CPTableViewSelectionHighlightStyleSourceList){
objj_msgSend(objj_msgSend(CPColor,"selectionColorSourceView"),"setFill");
}else{
objj_msgSend(objj_msgSend(CPColor,"selectionColor"),"setFill");
}
var _160=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_161=[],_162=sel_getUid("rectOfRow:");
if(objj_msgSend(_selectedRowIndexes,"count")>=1){
var _163=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",objj_msgSend(self,"rowsInRect:",_15f)),_164=objj_msgSend(_163,"firstIndex"),_165=CPMakeRange(_164,objj_msgSend(_163,"lastIndex")-_164+1);
objj_msgSend(_selectedRowIndexes,"getIndexes:maxCount:inIndexRange:",_161,-1,_165);
}else{
if(objj_msgSend(_selectedColumnIndexes,"count")>=1){
_162=sel_getUid("rectOfColumn:");
var _166=objj_msgSend(self,"columnIndexesInRect:",_15f),_167=objj_msgSend(_166,"firstIndex"),_165=CPMakeRange(_167,objj_msgSend(_166,"lastIndex")-_167+1);
objj_msgSend(_selectedColumnIndexes,"getIndexes:maxCount:inIndexRange:",_161,-1,_165);
}
}
var _168=objj_msgSend(_161,"count");
if(!_168){
return;
}
CGContextBeginPath(_160);
while(_168--){
CGContextAddRect(_160,CGRectIntersection(objj_msgSend(self,_162,_161[_168]),_15f));
}
CGContextClosePath(_160);
CGContextFillPath(_160);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(self,_cmd){
with(self){
objj_msgSend(self,"load");
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(self,_cmd,_16d){
with(self){
var _16e=objj_msgSend(self,"superview"),_16f=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_16e){
objj_msgSend(_16f,"removeObserver:name:object:",self,CPViewFrameDidChangeNotification,_16e);
objj_msgSend(_16f,"removeObserver:name:object:",self,CPViewBoundsDidChangeNotification,_16e);
}
if(_16d){
objj_msgSend(_16d,"setPostsFrameChangedNotifications:",YES);
objj_msgSend(_16d,"setPostsBoundsChangedNotifications:",YES);
objj_msgSend(_16f,"addObserver:selector:name:object:",self,sel_getUid("superviewFrameChanged:"),CPViewFrameDidChangeNotification,_16d);
objj_msgSend(_16f,"addObserver:selector:name:object:",self,sel_getUid("superviewBoundsChanged:"),CPViewBoundsDidChangeNotification,_16d);
}
}
}),new objj_method(sel_getUid("superviewBoundsChanged:"),function(self,_cmd,_172){
with(self){
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("superviewFrameChanged:"),function(self,_cmd,_175){
with(self){
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("tracksMouseOutsideOfFrame"),function(self,_cmd){
with(self){
return YES;
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(self,_cmd,_17a){
with(self){
var row=objj_msgSend(self,"rowAtPoint:",_17a);
if(objj_msgSend(self,"mouseDownFlags")&CPShiftKeyMask){
_selectionAnchorRow=(ABS(objj_msgSend(_selectedRowIndexes,"firstIndex")-row)<ABS(objj_msgSend(_selectedRowIndexes,"lastIndex")-row))?objj_msgSend(_selectedRowIndexes,"firstIndex"):objj_msgSend(_selectedRowIndexes,"lastIndex");
}else{
_selectionAnchorRow=row;
}
objj_msgSend(self,"_updateSelectionWithMouseAtRow:",row);
return YES;
}
}),new objj_method(sel_getUid("continueTracking:at:"),function(self,_cmd,_17e,_17f){
with(self){
objj_msgSend(self,"_updateSelectionWithMouseAtRow:",objj_msgSend(self,"rowAtPoint:",_17f));
return YES;
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(self,_cmd,_182,_183,_184){
with(self){
}
}),new objj_method(sel_getUid("_updateSelectionWithMouseAtRow:"),function(self,_cmd,aRow){
with(self){
if(objj_msgSend(self,"mouseDownFlags")&(CPCommandKeyMask|CPControlKeyMask|CPAlternateKeyMask)){
if(objj_msgSend(_selectedRowIndexes,"containsIndex:",aRow)){
newSelection=objj_msgSend(_selectedRowIndexes,"copy");
objj_msgSend(newSelection,"removeIndex:",aRow);
}else{
if(_allowsMultipleSelection){
newSelection=objj_msgSend(_selectedRowIndexes,"copy");
objj_msgSend(newSelection,"addIndex:",aRow);
}else{
newSelection=objj_msgSend(CPIndexSet,"indexSetWithIndex:",aRow);
}
}
}else{
if(_allowsMultipleSelection){
newSelection=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(MIN(aRow,_selectionAnchorRow),ABS(aRow-_selectionAnchorRow)+1));
}else{
if(aRow>=0&&aRow<_numberOfRows){
newSelection=objj_msgSend(CPIndexSet,"indexSetWithIndex:",aRow);
}else{
newSelection=objj_msgSend(CPIndexSet,"indexSet");
}
}
}
if(objj_msgSend(newSelection,"isEqualToIndexSet:",_selectedRowIndexes)){
return;
}
if(_implementedDelegateMethods&_7&&!objj_msgSend(_delegate,"selectionShouldChangeInTableView:",self)){
return;
}
if(_implementedDelegateMethods&_f){
newSelection=objj_msgSend(_delegate,"tableView:selectionIndexesForProposedSelection:",self,newSelection);
}
if(_implementedDelegateMethods&_11){
var _188=[];
objj_msgSend(newSelection,"getIndexes:maxCount:inIndexRange:",_188,-1,nil);
var _189=_188.length;
while(_189--){
var _18a=_188[_189];
if(!objj_msgSend(_delegate,"tableView:shouldSelectRow:",self,_18a)){
objj_msgSend(newSelection,"removeIndex:",_18a);
}
}
}
if(!_allowsEmptySelection&&objj_msgSend(newSelection,"count")===0){
return;
}
if(objj_msgSend(newSelection,"isEqualToIndexSet:",_selectedRowIndexes)){
return;
}
objj_msgSend(self,"selectRowIndexes:byExtendingSelection:",newSelection,NO);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewSelectionIsChangingNotification,self,nil);
}
})]);
var _18b="CPTableViewDataSourceKey",_18c="CPTableViewDelegateKey",_18d="CPTableViewHeaderViewKey",_18e="CPTableViewTableColumnsKey",_18f="CPTableViewRowHeightKey",_190="CPTableViewIntercellSpacingKey",_191="CPTableViewMultipleSelectionKey",_192="CPTableViewEmptySelectionKey";
var _1b=objj_getClass("CPTableView");
if(!_1b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTableView\""));
}
var _1c=_1b.isa;
class_addMethods(_1b,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_195){
with(self){
objj_msgSend(self,"init");
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPControl")},"initWithCoder:",_195);
if(self){
_dataSource=objj_msgSend(_195,"decodeObjectForKey:",_18b);
_delegate=objj_msgSend(_195,"decodeObjectForKey:",_18c);
_rowHeight=objj_msgSend(_195,"decodeFloatForKey:",_18f);
_intercellSpacing=objj_msgSend(_195,"decodeSizeForKey:",_190);
_allowsMultipleSelection=objj_msgSend(_195,"decodeBoolForKey:",_191);
_allowsEmptySelection=objj_msgSend(_195,"decodeBoolForKey:",_192);
_tableColumns=objj_msgSend(_195,"decodeObjectForKey:",_18e);
objj_msgSend(_tableColumns,"makeObjectsPerformSelector:withObject:",sel_getUid("setTableView:"),self);
_dirtyTableColumnRangeIndex=0;
objj_msgSend(self,"viewWillMoveToSuperview:",objj_msgSend(self,"superview"));
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_198){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_198);
objj_msgSend(_198,"encodeObject:forKey:",_dataSource,_18b);
objj_msgSend(_198,"encodeObject:forKey:",_delegate,_18c);
objj_msgSend(_198,"encodeFloat:forKey:",_rowHeight,_18f);
objj_msgSend(_198,"encodeSize:forKey:",_intercellSpacing,_190);
objj_msgSend(_198,"encodeBool:forKey:",_allowsMultipleSelection,_191);
objj_msgSend(_198,"encodeBool:forKey:",_allowsEmptySelection,_192);
objj_msgSend(_198,"encodeObject:forKey:",_tableColumns,_18e);
}
})]);
var _1b=objj_getClass("CPColor");
if(!_1b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColor\""));
}
var _1c=_1b.isa;
class_addMethods(_1c,[new objj_method(sel_getUid("selectionColor"),function(self,_cmd){
with(self){
return objj_msgSend(CPColor,"colorWithHexString:","5f83b9");
}
}),new objj_method(sel_getUid("selectionColorSourceView"),function(self,_cmd){
with(self){
return objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:","Resources/tableviewselection.png",CGSizeMake(6,22)));
}
})]);
