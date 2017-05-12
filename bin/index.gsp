<!doctype html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to Grails</title>

<asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body>
	<content tag="nav"> <!-- <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Application Status <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#">Environment: ${grails.util.Environment.current.name}</a></li>
                <li><a href="#">App profile: ${grailsApplication.config.grails?.profile}</a></li>
                <li><a href="#">App version:
                    <g:meta name="info.app.version"/></a>
                </li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Grails version:
                    <g:meta name="info.app.grailsVersion"/></a>
                </li>
                <li><a href="#">Groovy version: ${GroovySystem.getVersion()}</a></li>
                <li><a href="#">JVM version: ${System.getProperty('java.version')}</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</a></li>
            </ul>
        </li>--> <!--<li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Artefacts <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#">Controllers: ${grailsApplication.controllerClasses.size()}</a></li>
                <li><a href="#">Domains: ${grailsApplication.domainClasses.size()}</a></li>
                <li><a href="#">Services: ${grailsApplication.serviceClasses.size()}</a></li>
                <li><a href="#">Tag Libraries: ${grailsApplication.tagLibClasses.size()}</a></li>
            </ul>
        </li>-->
	<li class="dropdown"><a href="#" class="dropdown-toggle"
		data-toggle="dropdown" role="button" aria-haspopup="true"
		aria-expanded="false">Bitte wähle währung aus<span class="caret"></span></a>
		<ul class="dropdown-menu">
			<!-- <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                    <li><a href="#">${plugin.name} - ${plugin.version}</a></li>
                </g:each>-->
			<li><a href="#">Euro</a></li>
			<li><a href="#">Dollar</a></li>
		</ul></li>
	</content>

	<div class="svg" role="presentation">
		<div class="grails-logo-container">
			<asset:image src="grails-cupsonly-logo-white.svg" class="grails-logo" />
		</div>
	</div>

	<div id="content" role="main">
		<section class="row colset-2-its">

			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#home">Table</a></li>
				<li><a data-toggle="tab" href="#menu1">Graph</a></li>
			</ul>

			<div class="tab-content">
				<div id="home" class="tab-pane fade in active">
					<h1>Welcome to Table</h1>
						<table >
						   <tr>
						    <th>Date</th>
						    <th>Dollar</th>
						    <th>Euro</th>
						   </tr>
							<g:each in="${results}" var="item">
					  			<tr>
								   	<td>${item.day}</td>
								   	<td>${item.valueDol}</td>
								   	<td>${item.valueEur}</td>
							</g:each>
					</table>
				</div>
				<div id="menu1" class="tab-pane fade">
					<h1>Welcome to Grails Graph</h1>
					<div id="controllers" role="navigation">
						<ul>
						</ul>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>
