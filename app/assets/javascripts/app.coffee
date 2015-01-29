receta = angular.module('receta',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
])

receta.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'RecipesController'
      )
])

recipes = [
  {
    id: 1
    name: 'Анализ крови'
    description: 'Не есть перед анализом'
  },
  {
    id: 2
    name: 'Анализ мочи'
    description: 'Не пить, за 20 часов до анализа'
  },
  {
    id: 3
    name: 'Анализ кала'
    description: 'Не какать, за 20 часов до анализа'
  },
  {
    id: 4
    name: 'Развернутый анализ крови'
    description: 'Не есть, за 20 часов до анализа'
  },
]
controllers = angular.module('controllers',[])
controllers.controller("RecipesController", [ '$scope', '$routeParams', '$location', '$resource',
  ($scope,$routeParams,$location,$resource)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)

    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerCase()
      $scope.recipes = recipes.filter (recipe)-> recipe.name.toLowerCase().indexOf(keywords) != -1
    else
      $scope.recipes = []
])