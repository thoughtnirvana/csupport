import { moduleForModel, test } from 'ember-qunit';
import Ember from 'ember';

moduleForModel('ticket', 'Unit | Model | ticket', {
  // Specify the other units that are required for this test.
  needs: ['model:user', 'ember-validations@validator:local/presence']
});

test('it exists', function(assert) {
  let model = this.subject();
  // let store = this.store();
  assert.ok(!!model);
});

test('it has an attribute: name', function(assert){
  var model = this.subject();
  var hasName = Object.keys(model.toJSON()).indexOf('name') > -1;
  assert.ok(hasName);
});

test('it has an attribute: description', function(assert){
  var model = this.subject();
  var hasDesc = Object.keys(model.toJSON()).indexOf('description') > -1;
  assert.ok(hasDesc);
});

test('it has an attribute: user_id', function(assert){
  var model = this.subject();
  var hasUserId = Object.keys(model.toJSON()).indexOf('user_id') > -1;
  assert.ok(hasUserId);
});

test('it has an attribute: status', function(assert){
  var model = this.subject();
  var hasStatus = Object.keys(model.toJSON()).indexOf('status') > -1;
  assert.ok(hasStatus);
});

test('user relationship', function(assert) {
  var model = this.store().modelFor('ticket');
  var relationship = Ember.get(model, 'relationshipsByName').get('user');

  assert.equal(relationship.key, 'user');
  assert.equal(relationship.kind, 'belongsTo');
});

test('name should be required', function(assert){
  var model = this.subject();
  Ember.run(function(){
    model.set('name', '');
  });
  assert.equal(model.get('isValid'), false, 'Ticket is not valid without a name');
});

test('user should be required', function(assert){
  var model = this.subject();
  Ember.run(function(){
    model.set('user_id', '');
  });
  assert.equal(model.get('isValid'), false, 'Ticket is not valid without a user');
});

test('status should be required', function(assert){
  var model = this.subject();
  Ember.run(function(){
    model.set('status', '');
  });
  assert.equal(model.get('isValid'), false, 'Ticket is not valid without a status');
});