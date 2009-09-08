I;21;Foundation/CPBundle.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jc;2917;
var _1="CPCibOwner";
var _2={};
var _3=objj_getClass("CPObject");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPObject\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("awakeFromCib"),function(_5,_6){
with(_5){
}
})]);
var _3=objj_getClass("CPBundle");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPBundle\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("loadCibFile:externalNameTable:loadDelegate:"),function(_7,_8,_9,_a,_b){
with(_7){
objj_msgSend(objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithCibNamed:bundle:",_9,_7),"instantiateCibWithExternalNameTable:",_a);
}
}),new objj_method(sel_getUid("loadCibFile:externalNameTable:loadDelegate:"),function(_c,_d,_e,_f,_10){
with(_c){
var cib=objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithCibNamed:bundle:loadDelegate:",_e,_c,objj_msgSend(_c,"class"));
_2[objj_msgSend(cib,"UID")]={loadDelegate:_10,externalNameTable:_f};
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("loadCibFile:externalNameTable:"),function(_12,_13,_14,_15){
with(_12){
objj_msgSend(objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithContentsOfURL:",_14),"instantiateCibWithExternalNameTable:",_15);
}
}),new objj_method(sel_getUid("loadCibNamed:owner:"),function(_16,_17,_18,_19){
with(_16){
if(!objj_msgSend(_18,"hasSuffix:",".cib")){
_18=objj_msgSend(_18,"stringByAppendingString:",".cib");
}
var _1a=_19?objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_19,"class")):objj_msgSend(CPBundle,"mainBundle"),_1b=objj_msgSend(_1a,"pathForResource:",_18);
objj_msgSend(_16,"loadCibFile:externalNameTable:",_1b,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_19,_1));
}
}),new objj_method(sel_getUid("loadCibFile:externalNameTable:loadDelegate:"),function(_1c,_1d,_1e,_1f,_20){
with(_1c){
var cib=objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithContentsOfURL:loadDelegate:",_1e,_1c);
_2[objj_msgSend(cib,"UID")]={loadDelegate:_20,externalNameTable:_1f};
}
}),new objj_method(sel_getUid("loadCibNamed:owner:loadDelegate:"),function(_22,_23,_24,_25,_26){
with(_22){
if(!objj_msgSend(_24,"hasSuffix:",".cib")){
_24=objj_msgSend(_24,"stringByAppendingString:",".cib");
}
var _27=_25?objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_25,"class")):objj_msgSend(CPBundle,"mainBundle"),_28=objj_msgSend(_27,"pathForResource:",_24);
objj_msgSend(_22,"loadCibFile:externalNameTable:loadDelegate:",_28,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_25,_1),_26);
}
}),new objj_method(sel_getUid("cibDidFinishLoading:"),function(_29,_2a,_2b){
with(_29){
var _2c=_2[objj_msgSend(_2b,"UID")];
delete _2[objj_msgSend(_2b,"UID")];
objj_msgSend(_2b,"instantiateCibWithExternalNameTable:",_2c.externalNameTable);
objj_msgSend(_2c.loadDelegate,"cibDidFinishLoading:",_2b);
}
})]);
