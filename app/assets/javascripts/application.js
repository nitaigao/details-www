// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require unstable/angular
//= require unstable/angular-sanitize
//= require_tree .

notesApp = angular.module('notesApp', ['ngSanitize']);

notesApp.filter('newlines', function () {
    return function(text) {
        return text.replace(/\n/g, '<br>');
    }
})

var NotesListController = ['$scope', '$http', function($scope, $http) {
  $scope.notes = []
	$http.get('/notes/notes').success(function(listings) {
		angular.forEach(listings, function(listing, key){
		  	$http.get('/notes/note?path=' + listing.path).success(function(note) {
				$scope.notes.push(note);
			});
			return 1;
		}, $scope.notes);		
	});
}];

notesApp.controller('NotesListController', NotesListController);