var Matches = new Meteor.Collection('matches');

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
