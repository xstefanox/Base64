/* The MIT License, Copyright (c) 2012 Stefano Varesi */


(function() {
  var Base64, global;

  global = typeof exports !== "undefined" && exports !== null ? exports : this;

  Base64 = {};

  Base64.key = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";

  Base64.encode = function(input) {
    var chr1, chr2, chr3, enc1, enc2, enc3, enc4, i, output;
    if (!(input != null)) {
      return input;
    }
    output = '';
    i = 0;
    input = unescape(encodeURIComponent(input));
    while (i < input.length) {
      chr1 = input.charCodeAt(i);
      i += 1;
      chr2 = input.charCodeAt(i);
      i += 1;
      chr3 = input.charCodeAt(i);
      i += 1;
      enc1 = chr1 >> 2;
      enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
      enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
      enc4 = chr3 & 63;
      if (isNaN(chr2)) {
        enc3 = enc4 = 64;
      } else if (isNaN(chr3)) {
        enc4 = 64;
      }
      output = output + Base64.key.charAt(enc1) + Base64.key.charAt(enc2) + Base64.key.charAt(enc3) + Base64.key.charAt(enc4);
    }
    return output;
  };

  Base64.decode = function(input) {
    var chr1, chr2, chr3, enc1, enc2, enc3, enc4, i, output;
    if (!(input != null)) {
      return input;
    }
    output = '';
    i = 0;
    input = String(input).replace(/[^A-Za-z0-9\+\/\=]/g, '');
    while (i < input.length) {
      enc1 = Base64.key.indexOf(input.charAt(i));
      i += 1;
      enc2 = Base64.key.indexOf(input.charAt(i));
      i += 1;
      enc3 = Base64.key.indexOf(input.charAt(i));
      i += 1;
      enc4 = Base64.key.indexOf(input.charAt(i));
      i += 1;
      chr1 = (enc1 << 2) | (enc2 >> 4);
      chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
      chr3 = ((enc3 & 3) << 6) | enc4;
      output = output + String.fromCharCode(chr1);
      if (enc3 !== 64) {
        output = output + String.fromCharCode(chr2);
      }
      if (enc4 !== 64) {
        output = output + String.fromCharCode(chr3);
      }
    }
    output = decodeURIComponent(escape(output));
    return output;
  };

  global.Base64 = Base64;

}).call(this);
