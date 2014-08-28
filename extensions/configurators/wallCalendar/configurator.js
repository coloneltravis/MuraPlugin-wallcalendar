/**
* 
* This file is part of MuraPlugin
*
* Copyright 2013 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
function initWallCalendarConfigurator(data) {

	initConfigurator(data,{
		url: '../plugins/MuraPlugin/extensions/configurators/wallCalendar/configurator.cfm'
		, pars: ''
		, title: 'Select Calendar Items'
		, init: function(){}
		, destroy: function(){}
		, validate: function(){
			// simple js validation
			if ( !jQuery('#items').val() ) {
				//var response = alert('Please say something!');
				return false;
			}
			return true;
		}
	});

	return true;

};