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
    'model.user_id': {
      presence: true
    },
    'model.status': {
      presence: true
    }
  },
  name: DS.attr('string'),
  description: DS.attr('string'),
  user_id: DS.attr('number'),
  status: DS.attr('number'),
  user: DS.belongsTo('user'),
});
