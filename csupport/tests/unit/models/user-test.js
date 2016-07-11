import { moduleForModel, test } from 'ember-qunit';
import Ember from 'ember';

moduleForModel('user', 'Unit | Model | user', {
  // Specify the other units that are required for this test.
  needs: ['model:ticket', 'ember-validations@validator:local/presence']
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

test('it has an attribute: email', function(assert){
  var model = this.subject();
  var hasEmail = Object.keys(model.toJSON()).indexOf('email') > -1;
  assert.ok(hasEmail);
});

test('it has an attribute: password', function(assert){
  var model = this.subject();
  var hasPass = Object.keys(model.toJSON()).indexOf('password') > -1;
  assert.ok(hasPass);
});

test('it has an attribute: role_mask', function(assert){
  var model = this.subject();
  var hasRoleMask = Object.keys(model.toJSON()).indexOf('role_mask') > -1;
  assert.ok(hasRoleMask);
});

test('it has an attribute: role', function(assert){
  var model = this.subject();
  var hasRole = Object.keys(model.toJSON()).indexOf('role') > -1;
  assert.ok(hasRole);
});

test('ticket relationship', function(assert) {
  var model = this.store().modelFor('user');
  var relationship = Ember.get(model, 'relationshipsByName').get('tickets');

  assert.equal(relationship.key, 'tickets');
  assert.equal(relationship.kind, 'hasMany');
});

test('name should be required', function(assert){
  var model = this.subject();
  Ember.run(function(){
    model.set('name', '');
  });
  assert.equal(model.get('isValid'), false, 'User is not valid without a name');
});

test('email should be required', function(assert){
  var model = this.subject();
  Ember.run(function(){
    model.set('email', '');
  });
  assert.equal(model.get('isValid'), false, 'User is not valid without an email');
});

test('password should be required', function(assert){
  var model = this.subject();
  Ember.run(function(){
    model.set('password', '');
  });
  assert.equal(model.get('isValid'), false, 'User is not valid without a password');
});