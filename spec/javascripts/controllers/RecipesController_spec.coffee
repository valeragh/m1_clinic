describe "RecipesController", ->
  scope        = null
  ctrl         = null
  location     = null
  routeParams  = null
  resource     = null
  httpBackend  = null

  setupController =(keywords)->
    inject(($location, $routeParams, $rootScope, $resource, $httpBackend, $controller)->
      scope       = $rootScope.$new()
      location    = $location
      resource    = $resource
      routeParams = $routeParams
      routeParams.keywords = keywords
      httpBackend = $httpBackend

      if result
        request = new RegExp("\/recipes.*keywords=#{keywords}")
        httpBackend.expectGET(request).respond(result)

      ctrl        = $controller('RecipesController',
                                $scope: scope
                                $location: location)
    )

    afterEach ->
    httpBackend.verifyNoOutstandingExpectation()
    httpBackend.verifyNoOutstandingRequest()

  describe 'controller initialization', ->
    describe 'when no keywords present', ->
      beforeEach(setupController())

      it 'defaults to no recipes', ->
        expect(scope.recipes).toEqual([])

    describe 'with keywords', ->
      keywords = 'foo'
      recipes = [
        {
          id: 2
          name: 'Анализ мочи'
        },
        {
          id: 4
          name: 'Развернутый анализ крови'
        }
      ]
      beforeEach ->
        setupController(keywords,recipes)
        httpBackend.flush()

      it 'calls the back-end', ->
        expect(scope.recipes).toEqual(recipes)

    describe 'search()', ->
    beforeEach ->
      setupController()

    it 'redirects to itself with a keyword param', ->
      keywords = 'foo'
      scope.search(keywords)
      expect(location.path()).toBe('/')
      expect(location.search()).toEqual({keywords: keywords})