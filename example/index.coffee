angular.module('chosenExampleApp', ['localytics.directives'])

.controller 'IndexCtrl', ['$scope', '$q', '$timeout', ($scope, $q, $timeout) ->

  simulateAjax = (result) ->
    deferred = $q.defer()
    fn = -> deferred.resolve(result)
    $timeout fn, 3000
    deferred.promise

  $scope.optionsFromQuery = do ->
    result = ['grooo', 'wowowowow', 'lakakalakakl', 'yadayada', 'insight', 'delve', 'synergy']
    simulateAjax(result)

  $scope.emptyOptions = do ->
    simulateAjax([])

  $scope.directiveOptions =
    no_results_text: "SO SORRY"

  $scope.myPets = ['cat']
  $scope.pets =
    cat: 'Cat'
    dog: 'Dog'
    hamster: 'Hamster'

  $timeout ->
    $scope.$apply -> $scope.myPets.push('hamster')
  , 1000

  $scope.disabled = true

]
