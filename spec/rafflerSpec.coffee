describe "App namespace", ->
  it "should be defined", ->
    expect(Raffler).toBeDefined()

describe "Entry model", ->
  it "should exist", ->
    expect(Raffler.Models.Entry).toBeDefined()

  describe "Attributes", ->
    entryTest = new Raffler.Models.Entry
    it "should have default attributes", ->
      expect(entryTest.attributes.name).toBeDefined()
      expect(entryTest.attributes.winner).toBeDefined()
      expect(entryTest.attributes.winner).toBeFalsy()

  describe "Collection", ->
    entriesTest = new Raffler.Collections.Entries
    it "should exist", ->
      expect(Raffler.Collections.Entries).toBeDefined()
    it "should use entry model", ->
      expect(entriesTest.model).toEqual Raffler.Models.Entry

describe "App view", ->
  entriesData = [
    {
      id: 0
      name: 'Test1'
      winner: false
    },
    {
      id: 1
      name: 'Test2'
      winner: false
    },
    {
      id: 2
      name: 'Test3'
      winner: false
    }
  ]

  hiddenDiv = document.createElement 'div'

  beforeEach ->
    @entriesCollection = new Raffler.Collections.Entries entriesData
    @entriesView = new Raffler.Views.EntriesIndex
      collection: @entriesCollection
      el: hiddenDiv

  it "should be defined", ->
    expect(Raffler.Views.EntriesIndex).toBeDefined()

  it "should have the right element", ->
    expect(@entriesView.el).toEqual hiddenDiv

  it "should have the right collection", ->
    expect(@entriesView.collection).toEqual @entriesCollection
