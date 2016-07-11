import DS from 'ember-data';
import EmberValidations from 'ember-validations';
// import attr from 'ember-data/attr';
// import { belongsTo, hasMany } from 'ember-data/relationships';

export default DS.Model.extend(EmberValidations, {
  validations: {
    'model.name': {
      presence: true,
      length: { minimum: 5, maximum: 50 }
    },
    'model.email': {
      presence: true,
      format: { with: /.+@.+\..{2,4}/ }
    },
    'model.password': {
      presence: true
    }
  },
  name: DS.attr('string'),
  email: DS.attr('string'),
  password: DS.attr('string'),
  role_mask: DS.attr('number'),
  role: DS.attr('string'),
  tickets: DS.hasMany('ticket', {async: true}),
});