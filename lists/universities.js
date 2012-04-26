function(head, req) {
  // !json templates.universities
  // !code lib/mustache.js
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
  return Mustache.to_html(templates.universities, data);
}
