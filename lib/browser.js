(function() {
  var cls, platform, previousBrowser, _addClass, _doc_element, _hasClass, _i, _len, _ref, _removeClass, _setClass,
    __slice = [].slice;

  String.prototype.strip = function() {
    if (String.prototype.trim != null) {
      return this.trim();
    } else {
      return this.replace(/^\s+|\s+$/g, "");
    }
  };

  String.prototype.lstrip = function() {
    return this.replace(/^\s+/g, "");
  };

  String.prototype.rstrip = function() {
    return this.replace(/\s+$/g, "");
  };

  previousBrowser = window.browser;

  platform = window.platform;

  window.browser = {};

  _doc_element = window.document.documentElement;

  browser.classes = function() {
    var os, osmap, ua;
    ua = platform.name.toLowerCase();
    osmap = {
      'os x': 'mac'
    };
    os = platform.os.family.toLowerCase();
    os = osmap[os] || os.split(' ')[0];
    return ["ua-" + ua, "os-" + os, "" + os + "-" + ua, "ua-" + ua + (parseInt(platform.version))];
  };

  browser.noConflict = function() {
    window.browser = previousBrowser;
    return this;
  };

  _hasClass = function(class_name) {
    var regex;
    regex = new RegExp(class_name, 'i');
    return _doc_element.className.match(regex);
  };

  _setClass = function() {
    var class_name, class_names, _i, _len, _results;
    class_names = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    _results = [];
    for (_i = 0, _len = class_names.length; _i < _len; _i++) {
      class_name = class_names[_i];
      _results.push(_doc_element.className = ((class_name || "").replace(/\s+/, " ")).strip());
    }
    return _results;
  };

  _addClass = function() {
    var class_name, class_names, _i, _len, _results;
    class_names = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    _results = [];
    for (_i = 0, _len = class_names.length; _i < _len; _i++) {
      class_name = class_names[_i];
      if (!_hasClass(class_name)) {
        _results.push(_setClass(_doc_element.className + " " + class_name));
      } else {
        _results.push(void 0);
      }
    }
    return _results;
  };

  _removeClass = function() {
    var class_name, class_names, _i, _len, _results;
    class_names = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    _results = [];
    for (_i = 0, _len = class_names.length; _i < _len; _i++) {
      class_name = class_names[_i];
      if (_hasClass(class_name)) {
        _results.push(_setClass(_doc_element.className.replace(class_name, "")));
      } else {
        _results.push(void 0);
      }
    }
    return _results;
  };

  _removeClass('no-js', 'nojs');

  _ref = browser.classes();
  for (_i = 0, _len = _ref.length; _i < _len; _i++) {
    cls = _ref[_i];
    _addClass(cls);
  }

  window.browser = browser;

}).call(this);
