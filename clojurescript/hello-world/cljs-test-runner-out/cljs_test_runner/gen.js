// Compiled by ClojureScript 1.10.773 {:target :nodejs}
goog.provide('cljs_test_runner.gen');
goog.require('cljs.core');
goog.require('doo.runner');
goog.require('hello_world_test');
cljs_test_runner.gen.var__GT_sym = (function cljs_test_runner$gen$var__GT_sym(var$){
return cljs.core.symbol.call(null,new cljs.core.Keyword(null,"ns","ns",441598760).cljs$core$IFn$_invoke$arity$1(cljs.core.meta.call(null,var$)),new cljs.core.Keyword(null,"name","name",1843675177).cljs$core$IFn$_invoke$arity$1(cljs.core.meta.call(null,var$)));
});
cljs_test_runner.gen.var_filter = (function cljs_test_runner$gen$var_filter(p__4132){
var map__4133 = p__4132;
var map__4133__$1 = (((((!((map__4133 == null))))?(((((map__4133.cljs$lang$protocol_mask$partition0$ & (64))) || ((cljs.core.PROTOCOL_SENTINEL === map__4133.cljs$core$ISeq$))))?true:false):false))?cljs.core.apply.call(null,cljs.core.hash_map,map__4133):map__4133);
var var$ = cljs.core.get.call(null,map__4133__$1,new cljs.core.Keyword(null,"var","var",-769682797));
var include = cljs.core.get.call(null,map__4133__$1,new cljs.core.Keyword(null,"include","include",153360230));
var exclude = cljs.core.get.call(null,map__4133__$1,new cljs.core.Keyword(null,"exclude","exclude",-1230250334));
var test_specific = (cljs.core.truth_(var$)?cljs.core.comp.call(null,var$,cljs_test_runner.gen.var__GT_sym):cljs.core.constantly.call(null,true));
var test_inclusion = (cljs.core.truth_(include)?(function (p1__4129_SHARP_){
return cljs.core.apply.call(null,cljs.core.some_fn,include).call(null,cljs.core.meta.call(null,p1__4129_SHARP_));
}):cljs.core.constantly.call(null,true));
var test_exclusion = (cljs.core.truth_(exclude)?(function (p1__4130_SHARP_){
return cljs.core.complement.call(null,cljs.core.apply.call(null,cljs.core.some_fn,exclude)).call(null,cljs.core.meta.call(null,p1__4130_SHARP_));
}):cljs.core.constantly.call(null,true));
return (function (p1__4131_SHARP_){
var and__4115__auto__ = test_specific.call(null,p1__4131_SHARP_);
if(cljs.core.truth_(and__4115__auto__)){
var and__4115__auto____$1 = test_inclusion.call(null,p1__4131_SHARP_);
if(cljs.core.truth_(and__4115__auto____$1)){
return test_exclusion.call(null,p1__4131_SHARP_);
} else {
return and__4115__auto____$1;
}
} else {
return and__4115__auto__;
}
});
});
cljs_test_runner.gen.filter_vars_BANG_ = (function cljs_test_runner$gen$filter_vars_BANG_(ns_syms,filter_fn){
var seq__4135 = cljs.core.seq.call(null,ns_syms);
var chunk__4136 = null;
var count__4137 = (0);
var i__4138 = (0);
while(true){
if((i__4138 < count__4137)){
var ns_sym = cljs.core._nth.call(null,chunk__4136,i__4138);
var seq__4171_4203 = cljs.core.seq.call(null,ns_sym);
var chunk__4172_4204 = null;
var count__4173_4205 = (0);
var i__4174_4206 = (0);
while(true){
if((i__4174_4206 < count__4173_4205)){
var vec__4181_4207 = cljs.core._nth.call(null,chunk__4172_4204,i__4174_4206);
var __4208 = cljs.core.nth.call(null,vec__4181_4207,(0),null);
var var_4209 = cljs.core.nth.call(null,vec__4181_4207,(1),null);
if(cljs.core.truth_(new cljs.core.Keyword(null,"test","test",577538877).cljs$core$IFn$_invoke$arity$1(cljs.core.meta.call(null,var_4209)))){
if(cljs.core.not.call(null,filter_fn.call(null,var_4209))){
(cljs.core.deref.call(null,var_4209).cljs$lang$test = null);
} else {
}
} else {
}


var G__4210 = seq__4171_4203;
var G__4211 = chunk__4172_4204;
var G__4212 = count__4173_4205;
var G__4213 = (i__4174_4206 + (1));
seq__4171_4203 = G__4210;
chunk__4172_4204 = G__4211;
count__4173_4205 = G__4212;
i__4174_4206 = G__4213;
continue;
} else {
var temp__5735__auto___4214 = cljs.core.seq.call(null,seq__4171_4203);
if(temp__5735__auto___4214){
var seq__4171_4215__$1 = temp__5735__auto___4214;
if(cljs.core.chunked_seq_QMARK_.call(null,seq__4171_4215__$1)){
var c__4556__auto___4216 = cljs.core.chunk_first.call(null,seq__4171_4215__$1);
var G__4217 = cljs.core.chunk_rest.call(null,seq__4171_4215__$1);
var G__4218 = c__4556__auto___4216;
var G__4219 = cljs.core.count.call(null,c__4556__auto___4216);
var G__4220 = (0);
seq__4171_4203 = G__4217;
chunk__4172_4204 = G__4218;
count__4173_4205 = G__4219;
i__4174_4206 = G__4220;
continue;
} else {
var vec__4184_4221 = cljs.core.first.call(null,seq__4171_4215__$1);
var __4222 = cljs.core.nth.call(null,vec__4184_4221,(0),null);
var var_4223 = cljs.core.nth.call(null,vec__4184_4221,(1),null);
if(cljs.core.truth_(new cljs.core.Keyword(null,"test","test",577538877).cljs$core$IFn$_invoke$arity$1(cljs.core.meta.call(null,var_4223)))){
if(cljs.core.not.call(null,filter_fn.call(null,var_4223))){
(cljs.core.deref.call(null,var_4223).cljs$lang$test = null);
} else {
}
} else {
}


var G__4224 = cljs.core.next.call(null,seq__4171_4215__$1);
var G__4225 = null;
var G__4226 = (0);
var G__4227 = (0);
seq__4171_4203 = G__4224;
chunk__4172_4204 = G__4225;
count__4173_4205 = G__4226;
i__4174_4206 = G__4227;
continue;
}
} else {
}
}
break;
}


var G__4228 = seq__4135;
var G__4229 = chunk__4136;
var G__4230 = count__4137;
var G__4231 = (i__4138 + (1));
seq__4135 = G__4228;
chunk__4136 = G__4229;
count__4137 = G__4230;
i__4138 = G__4231;
continue;
} else {
var temp__5735__auto__ = cljs.core.seq.call(null,seq__4135);
if(temp__5735__auto__){
var seq__4135__$1 = temp__5735__auto__;
if(cljs.core.chunked_seq_QMARK_.call(null,seq__4135__$1)){
var c__4556__auto__ = cljs.core.chunk_first.call(null,seq__4135__$1);
var G__4232 = cljs.core.chunk_rest.call(null,seq__4135__$1);
var G__4233 = c__4556__auto__;
var G__4234 = cljs.core.count.call(null,c__4556__auto__);
var G__4235 = (0);
seq__4135 = G__4232;
chunk__4136 = G__4233;
count__4137 = G__4234;
i__4138 = G__4235;
continue;
} else {
var ns_sym = cljs.core.first.call(null,seq__4135__$1);
var seq__4187_4236 = cljs.core.seq.call(null,ns_sym);
var chunk__4188_4237 = null;
var count__4189_4238 = (0);
var i__4190_4239 = (0);
while(true){
if((i__4190_4239 < count__4189_4238)){
var vec__4197_4240 = cljs.core._nth.call(null,chunk__4188_4237,i__4190_4239);
var __4241 = cljs.core.nth.call(null,vec__4197_4240,(0),null);
var var_4242 = cljs.core.nth.call(null,vec__4197_4240,(1),null);
if(cljs.core.truth_(new cljs.core.Keyword(null,"test","test",577538877).cljs$core$IFn$_invoke$arity$1(cljs.core.meta.call(null,var_4242)))){
if(cljs.core.not.call(null,filter_fn.call(null,var_4242))){
(cljs.core.deref.call(null,var_4242).cljs$lang$test = null);
} else {
}
} else {
}


var G__4243 = seq__4187_4236;
var G__4244 = chunk__4188_4237;
var G__4245 = count__4189_4238;
var G__4246 = (i__4190_4239 + (1));
seq__4187_4236 = G__4243;
chunk__4188_4237 = G__4244;
count__4189_4238 = G__4245;
i__4190_4239 = G__4246;
continue;
} else {
var temp__5735__auto___4247__$1 = cljs.core.seq.call(null,seq__4187_4236);
if(temp__5735__auto___4247__$1){
var seq__4187_4248__$1 = temp__5735__auto___4247__$1;
if(cljs.core.chunked_seq_QMARK_.call(null,seq__4187_4248__$1)){
var c__4556__auto___4249 = cljs.core.chunk_first.call(null,seq__4187_4248__$1);
var G__4250 = cljs.core.chunk_rest.call(null,seq__4187_4248__$1);
var G__4251 = c__4556__auto___4249;
var G__4252 = cljs.core.count.call(null,c__4556__auto___4249);
var G__4253 = (0);
seq__4187_4236 = G__4250;
chunk__4188_4237 = G__4251;
count__4189_4238 = G__4252;
i__4190_4239 = G__4253;
continue;
} else {
var vec__4200_4254 = cljs.core.first.call(null,seq__4187_4248__$1);
var __4255 = cljs.core.nth.call(null,vec__4200_4254,(0),null);
var var_4256 = cljs.core.nth.call(null,vec__4200_4254,(1),null);
if(cljs.core.truth_(new cljs.core.Keyword(null,"test","test",577538877).cljs$core$IFn$_invoke$arity$1(cljs.core.meta.call(null,var_4256)))){
if(cljs.core.not.call(null,filter_fn.call(null,var_4256))){
(cljs.core.deref.call(null,var_4256).cljs$lang$test = null);
} else {
}
} else {
}


var G__4257 = cljs.core.next.call(null,seq__4187_4248__$1);
var G__4258 = null;
var G__4259 = (0);
var G__4260 = (0);
seq__4187_4236 = G__4257;
chunk__4188_4237 = G__4258;
count__4189_4238 = G__4259;
i__4190_4239 = G__4260;
continue;
}
} else {
}
}
break;
}


var G__4261 = cljs.core.next.call(null,seq__4135__$1);
var G__4262 = null;
var G__4263 = (0);
var G__4264 = (0);
seq__4135 = G__4261;
chunk__4136 = G__4262;
count__4137 = G__4263;
i__4138 = G__4264;
continue;
}
} else {
return null;
}
}
break;
}
});
cljs_test_runner.gen.filter_vars_BANG_.call(null,new cljs.core.PersistentVector(null, 1, 5, cljs.core.PersistentVector.EMPTY_NODE, [cljs.core.into.call(null,cljs.core.PersistentArrayMap.EMPTY,new cljs.core.PersistentVector(null, 1, 5, cljs.core.PersistentVector.EMPTY_NODE, [new cljs.core.PersistentVector(null, 2, 5, cljs.core.PersistentVector.EMPTY_NODE, [cljs.core.symbol.call(null,"test-hello-world"),new cljs.core.Var(function(){return hello_world_test.test_hello_world;},new cljs.core.Symbol("hello-world-test","test-hello-world","hello-world-test/test-hello-world",71552555,null),cljs.core.PersistentHashMap.fromArrays([new cljs.core.Keyword(null,"ns","ns",441598760),new cljs.core.Keyword(null,"name","name",1843675177),new cljs.core.Keyword(null,"file","file",-1269645878),new cljs.core.Keyword(null,"end-column","end-column",1425389514),new cljs.core.Keyword(null,"column","column",2078222095),new cljs.core.Keyword(null,"line","line",212345235),new cljs.core.Keyword(null,"end-line","end-line",1837326455),new cljs.core.Keyword(null,"arglists","arglists",1661989754),new cljs.core.Keyword(null,"doc","doc",1913296891),new cljs.core.Keyword(null,"test","test",577538877)],[new cljs.core.Symbol(null,"hello-world-test","hello-world-test",399832352,null),new cljs.core.Symbol(null,"test-hello-world","test-hello-world",-1577943981,null),"/home/colin/zcode/exercism/clojurescript/hello-world/test/hello_world_test.cljs",26,1,5,5,cljs.core.List.EMPTY,null,(cljs.core.truth_(hello_world_test.test_hello_world)?hello_world_test.test_hello_world.cljs$lang$test:null)]))], null)], null))], null),cljs_test_runner.gen.var_filter.call(null,new cljs.core.PersistentArrayMap(null, 3, [new cljs.core.Keyword(null,"var","var",-769682797),null,new cljs.core.Keyword(null,"include","include",153360230),null,new cljs.core.Keyword(null,"exclude","exclude",-1230250334),null], null)));
doo.runner.set_entry_point_BANG_.call(null,((doo.runner.karma_QMARK_.call(null))?(function (tc__4121__auto__){
jx.reporter.karma.start.call(null,tc__4121__auto__,1);

return cljs.test.run_block.call(null,(function (){var env4265 = cljs.test.empty_env.call(null,new cljs.core.Keyword("jx.reporter.karma","karma","jx.reporter.karma/karma",404831826));
var summary4266 = cljs.core.volatile_BANG_.call(null,new cljs.core.PersistentArrayMap(null, 5, [new cljs.core.Keyword(null,"type","type",1174270348),new cljs.core.Keyword(null,"summary","summary",380847952),new cljs.core.Keyword(null,"fail","fail",1706214930),(0),new cljs.core.Keyword(null,"error","error",-978969032),(0),new cljs.core.Keyword(null,"pass","pass",1574159993),(0),new cljs.core.Keyword(null,"test","test",577538877),(0)], null));
return cljs.core.concat.call(null,cljs.core.concat.call(null,new cljs.core.PersistentVector(null, 2, 5, cljs.core.PersistentVector.EMPTY_NODE, [(function (){
cljs.test.set_env_BANG_.call(null,env4265);

cljs.test.do_report.call(null,new cljs.core.PersistentArrayMap(null, 2, [new cljs.core.Keyword(null,"ns","ns",441598760),new cljs.core.Symbol(null,"hello-world-test","hello-world-test",399832352,null),new cljs.core.Keyword(null,"type","type",1174270348),new cljs.core.Keyword(null,"begin-test-ns","begin-test-ns",-1701237033)], null));

return cljs.test.block.call(null,(function (){var env__3168__auto__ = cljs.test.get_current_env.call(null);
return cljs.core.concat.call(null,new cljs.core.PersistentVector(null, 1, 5, cljs.core.PersistentVector.EMPTY_NODE, [(function (){
if((env__3168__auto__ == null)){
cljs.test.set_env_BANG_.call(null,cljs.test.empty_env.call(null));
} else {
}


return null;
})], null),cljs.test.test_vars_block.call(null,new cljs.core.PersistentVector(null, 1, 5, cljs.core.PersistentVector.EMPTY_NODE, [new cljs.core.Var(function(){return hello_world_test.test_hello_world;},new cljs.core.Symbol("hello-world-test","test-hello-world","hello-world-test/test-hello-world",71552555,null),cljs.core.PersistentHashMap.fromArrays([new cljs.core.Keyword(null,"ns","ns",441598760),new cljs.core.Keyword(null,"name","name",1843675177),new cljs.core.Keyword(null,"file","file",-1269645878),new cljs.core.Keyword(null,"end-column","end-column",1425389514),new cljs.core.Keyword(null,"column","column",2078222095),new cljs.core.Keyword(null,"line","line",212345235),new cljs.core.Keyword(null,"end-line","end-line",1837326455),new cljs.core.Keyword(null,"arglists","arglists",1661989754),new cljs.core.Keyword(null,"doc","doc",1913296891),new cljs.core.Keyword(null,"test","test",577538877)],[new cljs.core.Symbol(null,"hello-world-test","hello-world-test",399832352,null),new cljs.core.Symbol(null,"test-hello-world","test-hello-world",-1577943981,null),"/home/colin/zcode/exercism/clojurescript/hello-world/test/hello_world_test.cljs",26,1,5,5,cljs.core.List.EMPTY,null,(cljs.core.truth_(hello_world_test.test_hello_world)?hello_world_test.test_hello_world.cljs$lang$test:null)]))], null)),new cljs.core.PersistentVector(null, 1, 5, cljs.core.PersistentVector.EMPTY_NODE, [(function (){
if((env__3168__auto__ == null)){
return cljs.test.clear_env_BANG_.call(null);
} else {
return null;
}
})], null));
})());
}),(function (){
return cljs.test.do_report.call(null,new cljs.core.PersistentArrayMap(null, 2, [new cljs.core.Keyword(null,"ns","ns",441598760),new cljs.core.Symbol(null,"hello-world-test","hello-world-test",399832352,null),new cljs.core.Keyword(null,"type","type",1174270348),new cljs.core.Keyword(null,"end-test-ns","end-test-ns",1620675645)], null));
})], null),new cljs.core.PersistentVector(null, 1, 5, cljs.core.PersistentVector.EMPTY_NODE, [(function (){
return cljs.core._vreset_BANG_.call(null,summary4266,cljs.core.partial.call(null,cljs.core.merge_with,cljs.core._PLUS_).call(null,cljs.core._deref.call(null,summary4266),new cljs.core.Keyword(null,"report-counters","report-counters",-1702609242).cljs$core$IFn$_invoke$arity$1(cljs.test.get_and_clear_env_BANG_.call(null))));
})], null)),new cljs.core.PersistentVector(null, 1, 5, cljs.core.PersistentVector.EMPTY_NODE, [(function (){
cljs.test.set_env_BANG_.call(null,env4265);

cljs.test.do_report.call(null,cljs.core.deref.call(null,summary4266));

cljs.test.report.call(null,cljs.core.assoc.call(null,cljs.core.deref.call(null,summary4266),new cljs.core.Keyword(null,"type","type",1174270348),new cljs.core.Keyword(null,"end-run-tests","end-run-tests",267300563)));

return cljs.test.clear_env_BANG_.call(null);
})], null));
})());
}):(function (){
return cljs.test.run_block.call(null,(function (){var env4267 = cljs.test.empty_env.call(null);
var summary4268 = cljs.core.volatile_BANG_.call(null,new cljs.core.PersistentArrayMap(null, 5, [new cljs.core.Keyword(null,"type","type",1174270348),new cljs.core.Keyword(null,"summary","summary",380847952),new cljs.core.Keyword(null,"fail","fail",1706214930),(0),new cljs.core.Keyword(null,"error","error",-978969032),(0),new cljs.core.Keyword(null,"pass","pass",1574159993),(0),new cljs.core.Keyword(null,"test","test",577538877),(0)], null));
return cljs.core.concat.call(null,cljs.core.concat.call(null,new cljs.core.PersistentVector(null, 2, 5, cljs.core.PersistentVector.EMPTY_NODE, [(function (){
cljs.test.set_env_BANG_.call(null,env4267);

cljs.test.do_report.call(null,new cljs.core.PersistentArrayMap(null, 2, [new cljs.core.Keyword(null,"ns","ns",441598760),new cljs.core.Symbol(null,"hello-world-test","hello-world-test",399832352,null),new cljs.core.Keyword(null,"type","type",1174270348),new cljs.core.Keyword(null,"begin-test-ns","begin-test-ns",-1701237033)], null));

return cljs.test.block.call(null,(function (){var env__3168__auto__ = cljs.test.get_current_env.call(null);
return cljs.core.concat.call(null,new cljs.core.PersistentVector(null, 1, 5, cljs.core.PersistentVector.EMPTY_NODE, [(function (){
if((env__3168__auto__ == null)){
cljs.test.set_env_BANG_.call(null,cljs.test.empty_env.call(null));
} else {
}


return null;
})], null),cljs.test.test_vars_block.call(null,new cljs.core.PersistentVector(null, 1, 5, cljs.core.PersistentVector.EMPTY_NODE, [new cljs.core.Var(function(){return hello_world_test.test_hello_world;},new cljs.core.Symbol("hello-world-test","test-hello-world","hello-world-test/test-hello-world",71552555,null),cljs.core.PersistentHashMap.fromArrays([new cljs.core.Keyword(null,"ns","ns",441598760),new cljs.core.Keyword(null,"name","name",1843675177),new cljs.core.Keyword(null,"file","file",-1269645878),new cljs.core.Keyword(null,"end-column","end-column",1425389514),new cljs.core.Keyword(null,"column","column",2078222095),new cljs.core.Keyword(null,"line","line",212345235),new cljs.core.Keyword(null,"end-line","end-line",1837326455),new cljs.core.Keyword(null,"arglists","arglists",1661989754),new cljs.core.Keyword(null,"doc","doc",1913296891),new cljs.core.Keyword(null,"test","test",577538877)],[new cljs.core.Symbol(null,"hello-world-test","hello-world-test",399832352,null),new cljs.core.Symbol(null,"test-hello-world","test-hello-world",-1577943981,null),"/home/colin/zcode/exercism/clojurescript/hello-world/test/hello_world_test.cljs",26,1,5,5,cljs.core.List.EMPTY,null,(cljs.core.truth_(hello_world_test.test_hello_world)?hello_world_test.test_hello_world.cljs$lang$test:null)]))], null)),new cljs.core.PersistentVector(null, 1, 5, cljs.core.PersistentVector.EMPTY_NODE, [(function (){
if((env__3168__auto__ == null)){
return cljs.test.clear_env_BANG_.call(null);
} else {
return null;
}
})], null));
})());
}),(function (){
return cljs.test.do_report.call(null,new cljs.core.PersistentArrayMap(null, 2, [new cljs.core.Keyword(null,"ns","ns",441598760),new cljs.core.Symbol(null,"hello-world-test","hello-world-test",399832352,null),new cljs.core.Keyword(null,"type","type",1174270348),new cljs.core.Keyword(null,"end-test-ns","end-test-ns",1620675645)], null));
})], null),new cljs.core.PersistentVector(null, 1, 5, cljs.core.PersistentVector.EMPTY_NODE, [(function (){
return cljs.core._vreset_BANG_.call(null,summary4268,cljs.core.partial.call(null,cljs.core.merge_with,cljs.core._PLUS_).call(null,cljs.core._deref.call(null,summary4268),new cljs.core.Keyword(null,"report-counters","report-counters",-1702609242).cljs$core$IFn$_invoke$arity$1(cljs.test.get_and_clear_env_BANG_.call(null))));
})], null)),new cljs.core.PersistentVector(null, 1, 5, cljs.core.PersistentVector.EMPTY_NODE, [(function (){
cljs.test.set_env_BANG_.call(null,env4267);

cljs.test.do_report.call(null,cljs.core.deref.call(null,summary4268));

cljs.test.report.call(null,cljs.core.assoc.call(null,cljs.core.deref.call(null,summary4268),new cljs.core.Keyword(null,"type","type",1174270348),new cljs.core.Keyword(null,"end-run-tests","end-run-tests",267300563)));

return cljs.test.clear_env_BANG_.call(null);
})], null));
})());
})));

//# sourceMappingURL=gen.js.map
