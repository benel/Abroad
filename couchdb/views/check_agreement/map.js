function(o) {
  var month = {
    Spring: 4,
    Fall: 10,
  };
  emit([o.study_field, o.academic_year, month[o.semester]]);
  emit([':curriculum', o.academic_year, month[o.semester]]); //Instead of '', workaround for CouchDB bug 
}
