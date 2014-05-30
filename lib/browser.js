(function() {
  define(['vendor/platform'], function(platform) {
    var Browser, c, _addClass, _doc_element, _hasClass, _i, _len, _ref, _removeClass, _setClass;
    _doc_element = window.document.documentElement;
    _hasClass = function(class_name) {
      var regex;
      regex = new RegExp(class_name, 'i');
      return _doc_element.className.match(regex);
    };
    _setClass = function(class_name) {
      return _doc_element.className = ((class_name || "").replace(/\s+/, " ")).trim();
    };
    _addClass = function(class_name) {
      if (!_hasClass(class_name)) {
        return _setClass(_doc_element.className + " " + class_name);
      }
    };
    _removeClass = function(class_name) {
      if (_hasClass(class_name)) {
        return _setClass(_doc_element.className.replace(class_name, ""));
      }
    };
    _removeClass('no-js');
    _removeClass('nojs');
    Browser = (function() {
      function Browser() {}

      return Browser;

    })();
    Browser.classes = function() {
      var os, osmap, ua;
      ua = platform.name.toLowerCase();
      osmap = {
        'os x': 'mac'
      };
      os = platform.os.family.toLowerCase();
      os = osmap[os] || os.split(' ')[0];
      return ["ua-" + ua, "os-" + os, "" + os + "-" + ua, "ua-" + (platform.name.toLowerCase()) + (parseInt(platform.version))];
    };
    _ref = Browser.classes();
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      c = _ref[_i];
      _addClass(c);
    }
    return Browser;
  });

}).call(this);
