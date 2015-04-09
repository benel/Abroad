function(o) {
  for each(var c in o.courses) {
    var f = c.field;
    if (f) {
      emit([f, o.host_institution]);
      emit([':curriculum', o.host_institution]); //Instead of '', workaround for CouchDB bug 
    }
  }
}
