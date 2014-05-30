(function() {
  require(['browser'], function(browser) {
    var classes;
    classes = browser.classes();
    document.getElementById('extra_classes').innerHTML = classes.join(" ");
    return document.getElementById('all_classes').innerHTML = window.document.documentElement.className;
  });

}).call(this);
