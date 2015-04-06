function(head, req) {
  var Mustache = require("lib/mustache");  
  start({"headers":{"Content-Type":"text/html;charset=utf-8"}});
  var data = {
    curriculum: req.query.curriculum,
    semesters: []
  };
  var current_year;
  var current_semester;
  while (row = getRow()) {
    var o = row.doc;
    if (o.semester!==current_semester || o.academic_year!==current_year) {
      data.semesters.push({
        semester: o.semester,
        academic_year: o.academic_year,
        agreements: []
      });
      current_year = o.academic_year;
      current_semester = o.semester;
    }
    data.semesters[data.semesters.length-1].agreements.push(o);
  }
  return Mustache.to_html(this.templates.agreements, data, this.templates.partials);
}
