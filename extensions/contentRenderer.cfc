/**
*
* This file is part of MuraPlugin
*
* Copyright 2013 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
component accessors=true extends='mura.cfobject' output=false {

	property name='$';

	include '../plugin/settings.cfm';

	public any function init(required struct $) {
		set$(arguments.$);
		return this;
	}

	public string function showWallCalendar(string items='') {
		rownames = arguments.items;
		include 'display_objects/wallcalendar.cfm';
	}

	/*
	* CONFIGURED DISPLAY OBJECTS
	* --------------------------------------------------------------------- */


	public any function dspConfiguredWallCalendar(required struct $) {
		var local = {};
		set$(arguments.$);

		local.params = arguments.$.event('objectParams');

		local.defaultParams = {
			items = ''
		};

		StructAppend(local.params, local.defaultParams, false);

		local.str = '<div class="objWallCalendar">' & showWallCalendar(argumentCollection=local.params) & '</div>';

		return local.str;
	}

}