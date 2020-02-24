!function(t,e){"use strict";"function"==typeof define&&define.amd?define(["moment"],e):"object"==typeof module&&module.exports?module.exports=e(require("moment")):e(t.moment)}(this,function(t){"use strict";function e(t){return t>96?t-87:t>64?t-29:t-48}function n(t){var n,o=0,r=t.split("."),i=r[0],s=r[1]||"",f=1,a=0,u=1;for(45===t.charCodeAt(0)&&(o=1,u=-1),o;o<i.length;o++)n=e(i.charCodeAt(o)),a=60*a+n;for(o=0;o<s.length;o++)f/=60,n=e(s.charCodeAt(o)),a+=n*f;return a*u}function o(t){for(var e=0;e<t.length;e++)t[e]=n(t[e])}function r(t,e){for(var n=0;n<e;n++)t[n]=Math.round((t[n-1]||0)+6e4*t[n]);t[e-1]=Infinity}function i(t,e){var n,o=[];for(n=0;n<e.length;n++)o[n]=t[e[n]];return o}function s(t){var e=t.split("|"),n=e[2].split(" "),s=e[3].split(""),f=e[4].split(" ");return o(n),o(s),o(f),r(f,s.length),{name:e[0],abbrs:i(e[1].split(" "),s),offsets:i(n,s),untils:f,population:0|e[5]}}function f(t){t&&this._set(s(t))}function a(t){var e=t.toTimeString(),n=e.match(/\([a-z ]+\)/i);n&&n[0]?(n=n[0].match(/[A-Z]/g),n=n?n.join(""):undefined):(n=e.match(/[A-Z]{3,5}/g),n=n?n[0]:undefined),"GMT"===n&&(n=undefined),this.at=+t,this.abbr=n,this.offset=t.getTimezoneOffset()}function u(t){this.zone=t,this.offsetScore=0,this.abbrScore=0}function c(t,e){for(var n,o;o=6e4*((e.at-t.at)/12e4|0);)n=new a(new Date(t.at+o)),n.offset===t.offset?t=n:e=n;return t}function h(){var t,e,n,o=(new Date).getFullYear()-2,r=new a(new Date(o,0,1)),i=[r];for(n=1;n<48;n++)e=new a(new Date(o,n,1)),e.offset!==r.offset&&(t=c(r,e),i.push(t),i.push(new a(new Date(t.at+6e4)))),r=e;for(n=0;n<4;n++)i.push(new a(new Date(o+n,0,1))),i.push(new a(new Date(o+n,6,1)));return i}function l(t,e){return t.offsetScore!==e.offsetScore?t.offsetScore-e.offsetScore:t.abbrScore!==e.abbrScore?t.abbrScore-e.abbrScore:e.zone.population-t.zone.population}function d(t,e){var n,r;for(o(e),n=0;n<e.length;n++)r=e[n],C[r]=C[r]||{},C[r][t]=!0}function p(t){var e,n,o,r=t.length,i={},s=[];for(e=0;e<r;e++){o=C[t[e].offset]||{};for(n in o)o.hasOwnProperty(n)&&(i[n]=!0)}for(e in i)i.hasOwnProperty(e)&&s.push(k[e]);return s}function m(){try{var t=Intl.DateTimeFormat().resolvedOptions().timeZone;if(t&&t.length>3){var e=k[b(t)];if(e)return e;A("Moment Timezone found "+t+" from the Intl api, but did not have that data loaded.")}}catch(t){}var n,o,r,i=h(),s=i.length,f=p(i),a=[];for(o=0;o<f.length;o++){for(n=new u(g(f[o]),s),r=0;r<s;r++)n.scoreOffsetAt(i[r]);a.push(n)}return a.sort(l),a.length>0?a[0].zone.name:undefined}function z(t){return x&&!t||(x=m()),x}function b(t){return(t||"").toLowerCase().replace(/\//g,"_")}function v(t){var e,n,o,r;for("string"==typeof t&&(t=[t]),e=0;e<t.length;e++)o=t[e].split("|"),n=o[0],r=b(n),Z[r]=t[e],k[r]=n,d(r,o[2].split(" "))}function g(t,e){t=b(t);var n,o=Z[t];return o instanceof f?o:"string"==typeof o?(o=new f(o),Z[t]=o,o):F[t]&&e!==g&&(n=g(F[t],g))?(o=Z[t]=new f,o._set(n),o.name=k[t],o):null}function _(){var t,e=[];for(t in k)k.hasOwnProperty(t)&&(Z[t]||Z[F[t]])&&k[t]&&e.push(k[t]);return e.sort()}function w(t){var e,n,o,r;for("string"==typeof t&&(t=[t]),e=0;e<t.length;e++)n=t[e].split("|"),o=b(n[0]),r=b(n[1]),F[o]=r,k[o]=n[0],F[r]=o,k[r]=n[1]}function y(t){v(t.zones),w(t.links),M.dataVersion=t.version}function S(t){return S.didShowError||(S.didShowError=!0,A("moment.tz.zoneExists('"+t+"') has been deprecated in favor of !moment.tz.zone('"+t+"')")),!!g(t)}function O(t){var e="X"===t._f||"x"===t._f;return!(!t._a||t._tzm!==undefined||e)}function A(t){"undefined"!=typeof console&&"function"==typeof console.error&&console.error(t)}function M(e){var n=Array.prototype.slice.call(arguments,0,-1),o=arguments[arguments.length-1],r=g(o),i=t.utc.apply(null,n);return r&&!t.isMoment(e)&&O(i)&&i.add(r.parse(i),"minutes"),i.tz(o),i}function j(t){return function(){return this._z?this._z.abbr(this):t.call(this)}}function D(t){return function(){return this._z=null,t.apply(this,arguments)}}var x,T="0.5.14",Z={},F={},k={},C={},I=t.version.split("."),E=+I[0],P=+I[1];(E<2||2===E&&P<6)&&A("Moment Timezone requires Moment.js >= 2.6.0. You are using Moment.js "+t.version+". See momentjs.com"),f.prototype={_set:function(t){this.name=t.name,this.abbrs=t.abbrs,this.untils=t.untils,this.offsets=t.offsets,this.population=t.population},_index:function(t){var e,n=+t,o=this.untils;for(e=0;e<o.length;e++)if(n<o[e])return e},parse:function(t){var e,n,o,r,i=+t,s=this.offsets,f=this.untils,a=f.length-1;for(r=0;r<a;r++)if(e=s[r],n=s[r+1],o=s[r?r-1:r],e<n&&M.moveAmbiguousForward?e=n:e>o&&M.moveInvalidForward&&(e=o),i<f[r]-6e4*e)return s[r];return s[a]},abbr:function(t){return this.abbrs[this._index(t)]},offset:function(t){return A("zone.offset has been deprecated in favor of zone.utcOffset"),this.offsets[this._index(t)]},utcOffset:function(t){return this.offsets[this._index(t)]}},u.prototype.scoreOffsetAt=function(t){this.offsetScore+=Math.abs(this.zone.utcOffset(t.at)-t.offset),this.zone.abbr(t.at).replace(/[^A-Z]/g,"")!==t.abbr&&this.abbrScore++},M.version=T,M.dataVersion="",M._zones=Z,M._links=F,M._names=k,M.add=v,M.link=w,M.load=y,M.zone=g,M.zoneExists=S,M.guess=z,M.names=_,M.Zone=f,M.unpack=s,M.unpackBase60=n,M.needsOffset=O,M.moveInvalidForward=!0,M.moveAmbiguousForward=!1;var q=t.fn;t.tz=M,t.defaultZone=null,t.updateOffset=function(e,n){var o,r=t.defaultZone;e._z===undefined&&(r&&O(e)&&!e._isUTC&&(e._d=t.utc(e._a)._d,e.utc().add(r.parse(e),"minutes")),e._z=r),e._z&&(o=e._z.utcOffset(e),Math.abs(o)<16&&(o/=60),e.utcOffset!==undefined?e.utcOffset(-o,n):e.zone(o,n))},q.tz=function(e,n){return e?(this._z=g(e),this._z?t.updateOffset(this,n):A("Moment Timezone has no data for "+e+". See http://momentjs.com/timezone/docs/#/data-loading/."),this):this._z?this._z.name:void 0},q.zoneName=j(q.zoneName),q.zoneAbbr=j(q.zoneAbbr),q.utc=D(q.utc),t.tz.setDefault=function(e){return(E<2||2===E&&P<9)&&A("Moment Timezone setDefault() requires Moment.js >= 2.9.0. You are using Moment.js "+t.version+"."),t.defaultZone=e?g(e):null,t};var Y=t.momentProperties;return"[object Array]"===Object.prototype.toString.call(Y)?(Y.push("_z"),Y.push("_a")):Y&&(Y._z=null),t});