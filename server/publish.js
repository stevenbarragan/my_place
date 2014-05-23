var Matches = new Meteor.Collection('matches');
var Counters = new Meteor.Collection('counter');

Matches.allow({
  insert: function() {
    return true;
  },
  update: function() {
    return true;
  }
});

Meteor.publish('matches', function() {
  return Matches.find();
});
