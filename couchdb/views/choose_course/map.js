function(o) {
  for each(var c in o.courses) {
    if (c.id) {
      emit([o.host_institution, c.field, c.type, c.id], {name:c.name});
    }
  }
}
