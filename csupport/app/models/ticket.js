import DS from 'ember-data';
// import attr from 'ember-data/attr';
// import { belongsTo, hasMany } from 'ember-data/relationships';

export default DS.Model.extend({
  name: DS.attr('string'),
  description: DS.attr('string'),
  user_id: DS.attr('number'),
  status: DS.attr('number'),
});
