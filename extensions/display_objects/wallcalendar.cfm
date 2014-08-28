
<cfif StructKeyExists(url, "currdate")>
	<cfset currdate = url.currdate />
<cfelse>
	<cfset currdate = now() />
</cfif>


<cfparam name="rownames" default="Jake,David,Andrew,Emma,Mark,Stephen,Sarah,Tim,John,Paul,Mike,Chris" />


<cfset prevmonth = month(currdate)-1 />
<cfset nextmonth = month(currdate)+1 />
<cfif prevmonth Lt 1> <cfset prevmonth = 12 /> </cfif>
<cfif nextmonth Gt 12> <cfset prevmonth = 1 /> </cfif>

<cfset monthdays = daysinmonth(currdate) />
<cfset currmonth = month(currdate) />
<cfset curryear = year(currdate) />


<cfsavecontent variables="head">
	<style>
			.row {float:left; height:10%; width:100%; margin-bottom:2px;}
			.daycell {float:left; border:1px solid; width:2%; padding:1px; margin:1px;}
			.namecell {float:left; border:1px solid; width:10%; padding:1px; margin:0px;}
	</style>
</cfsavecontent>
<cfhtmlhead text="#head#" />


<cfoutput>
	<a href="#cgi.script_name#?currdate=#dateadd('m',-1, currdate)#">Previous month</a>
	<h2 style="display:inline;margin:2px;">#dateformat(currdate, "mmmm")# #curryear#</h2>
	<a href="#cgi.script_name#?currdate=#dateadd('m',1, currdate)#">Next month</a>
</cfoutput>

<cfoutput>
	<cfset rowcount = listlen(rownames) />

	<div id="wallcalendar" style="width:900px;height:#rowcount*20#px;">
		<cfloop list="#rownames#" index="rowtitle">
			<div class="row">
				<div class="namecell">#rowtitle#</div>
				<cfloop from="1" to="#monthdays#" index="day">
					<div class="daycell" id="r#rowtitle#,d#day#">#day#</div>
				</cfloop>
			</div>
		</cfloop>
	</div>
</cfoutput>
