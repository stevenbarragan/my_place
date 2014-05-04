Template.me.age = function(){
  born = new Date(1990, 11, 19, 6)
  today = new Date()
  diff = today - born

  year = 1000 * 60 * 60 * 24 * 365

  return diff / year
}
