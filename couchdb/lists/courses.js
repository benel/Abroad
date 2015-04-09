function(head, req) {
  // !json templates.courses
  // !code lib/mustache.js
  start({"headers":{"Content-Type":"text/html;charset=utf-8"}});
  var data = {
    university: req.query.university,
    courses: []
  };
  while (row = getRow()) {
    data.courses.push({
      field: row.key[1],
      type: row.key[2],
      code: row.key[3],
      name: row.value.name,
      count: row.value.count
    });
  }
  return Mustache.to_html(templates.courses, data);
}
