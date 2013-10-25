app = angular.module 'coolMillion', []

app.controller "gamesController", ($scope, $http, $location, $state, $stateParams) ->
  $scope.games = {}
  if $state.current.name == 'games'
    $http.get("/games"

    ).then ((response) ->
      $scope.games = response.data

    ), (error) ->

  $scope.game = {}
  if $state.current.name == 'edit'
    $http.get("/games/#{$stateParams['id']}"


    ).then ((response) ->
      $scope.game = response.data

    ), (error) ->


  $scope.create = ->
    $http.post("/games",
      game:
        date_played: $scope.game.date_played
        location: $scope.game.location
        game_type: $scope.game.game_type
        stakes: $scope.game.stakes
        hours: $scope.game.hours
        profit_or_loss: $scope.game.profit_or_loss
        notes: $scope.game.notes


    ).then ((response) ->
      $location.path "/games"

    ), (error) ->

  $scope.update = ->
    $http.put("/games/#{$scope.game.id}",
      game:
        date_played: $scope.game.date_played
        location: $scope.game.location
        game_type: $scope.game.game_type
        stakes: $scope.game.stakes
        hours: $scope.game.hours
        profit_or_loss: $scope.game.profit_or_loss
        notes: $scope.game.notes

    ).then ((response) ->
      $location.path "/games"

    ), (error) ->

  $scope.destroy = (id) ->
    $http.delete("/games/#{id}"


    ).then ((response) ->
      $http.get("/games/").then ((response) ->
        $scope.games = response.data
      ), (error) ->


    ), (error) ->

  return false
