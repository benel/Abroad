function(head, req) {
  var Mustache = require("lib/mustache");
  start({"headers":{"Content-Type":"text/html;charset=utf-8"}});
  var data = {
    curriculum: req.query.curriculum,
    universities: []
  };
  var i = 0;
  while (row = getRow()) {
    data.universities.push({
      order: ++i,
      name: row.key[1],
      count: row.value
    });
  }
  return Mustache.to_html(this.templates.universities, data, this.templates.partials);
}
