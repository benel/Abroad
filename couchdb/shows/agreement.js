function(o, req) {
  var Mustache = require('lib/mustache');
  return Mustache.to_html(this.templates.agreement, o);
}
