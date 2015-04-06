function(keys, values, rereduce) {
  return {
    name: values[0].name,
    count: (rereduce)?sum(values):values.length
  }
}
