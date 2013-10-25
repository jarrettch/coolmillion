app = angular.module 'coolMillion', []

app.config ['$stateProvider', '$urlRouterProvider', '$locationProvider', ($stateProvider, $urlRouterProvider, $locationProvider) ->
  $urlRouterProvider
    .otherwise("/")

  $stateProvider
    .state "default",
      abstract: true
      views:
        "":
          controller: "ApplicationController"
          templateUrl: "/assets/layouts/default.html.erb"

  .state "games",
    parent: "default"
    url: "/games"
    views:
      "":
        controller: "GamesController"
        templateUrl: "/assets/games/index.html.erb"

  .state "new",
    parent: "games"
    url: "/new"
    views:
      "@default":
        controller: "GamesController"
        templateUrl: "/assets/games/new.html.erb"

  .state "edit",
    parent: "games"
    url: "/:id/edit"
    views:
      "@default":
        controller: "GamesController"
        templateUrl: "/assets/games/edit.html.erb"

  $locationProvider.html5mode true
]