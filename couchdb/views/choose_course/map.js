function(o) {
  for each(var c in o.courses) {
    var e = c.equivalence;
    if (e) {
      emit([o.host_institution, e, c.id], {name:c.name});
    }
  }
}
