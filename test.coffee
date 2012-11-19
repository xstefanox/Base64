assert = require('assert')

Base64 = require('./Base64.js').Base64

src = 'JavaScript'
dest = 'SmF2YVNjcmlwdA=='

describe 'Base64', ->
  
  describe "#encode()", ->
    it "encode('#{src}') should return the string '#{dest}'", ->
      assert.equal(Base64.encode(src), dest)
      
  describe "#decode()", ->
    it "decode('#{dest}') should return the string '#{src}'", ->
      assert.equal(Base64.decode(dest), src)
      
  describe "encode & decode", ->
    it 'should return the original value', ->
      assert.equal(Base64.decode(Base64.encode(src)), src)
      
  describe "decode & encode", ->
    it 'should return the original value', ->
      assert.equal(Base64.encode(Base64.decode(dest)), dest)
      
  describe "encode an empty string", ->
    it 'should return an empty string', ->
      assert.equal(Base64.encode(''), '')
      
  describe "decode an empty string", ->
    it 'should return an empty string', ->
      assert.equal(Base64.decode(''), '')
      
  describe "encode null", ->
    it 'should return null', ->
      assert.equal(Base64.encode(null), null)
      
  describe "decode null", ->
    it 'should return null', ->
      assert.equal(Base64.decode(null), null)
      
  describe "encode with no arguments", ->
    it 'should return undefined', ->
      assert.equal(Base64.encode(), undefined)
      
  describe "decode with no arguments", ->
    it 'should return undefined', ->
      assert.equal(Base64.decode(), undefined)
