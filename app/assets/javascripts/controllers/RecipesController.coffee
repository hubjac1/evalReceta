controllers = angular.module('controllers')
controllers.controller("RecipesController", [ '$scope', '$routeParams', '$location', '$resource',
  ($scope,$routeParams,$location, $resource)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)
    Recipe = $resource('/recipes/:recipeId', { recipeId: "@id", format: 'json' })

    $scope.recipes = []

    if $routeParams.keywords
      Recipe.query(keywords: $routeParams.keywords, (results)->
        $scope.recipes = results
        $scope.mode = 'Results'
      )
    else
      Recipe.query({}, (results)->
        $scope.recipes = results
        $scope.mode = 'Most popular'
      )

    $scope.view = (recipeId)-> $location.path("/recipes/#{recipeId}")

    $scope.newRecipe = -> $location.path("/recipes/new")

    $scope.edit = (recipeId)-> $location.path("/recipes/#{recipeId}/edit")
])