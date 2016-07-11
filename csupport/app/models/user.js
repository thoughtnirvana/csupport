import DS from 'ember-data';
// import attr from 'ember-data/attr';
// import { belongsTo, hasMany } from 'ember-data/relationships';

export default DS.Model.extend({
  name: DS.attr('string'),
  email: DS.attr('string'),
  password: DS.attr('string'),
  role_mask: DS.attr('number'),
  role: DS.attr('string'),
});
