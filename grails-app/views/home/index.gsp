<!doctype html>
<html>
<head>
<meta name="layout" content="main" />
<title>Monetka</title>
<asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>

	<div id="content" role="main">
		<section class="row colset-2-its">
			
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#home">Table</a></li>
				<li><a data-toggle="tab" href="#menu1">Graph</a></li>
			</ul>

			<div class="tab-content">
				<div id="home" class="tab-pane fade in active">
					<h1>Table: Dollar/RUB and Euro/RUB and Euro/Dollar</h1>
					<div class="table-responsive">
						<table class="table table-striped">
						   <tr>
						    <th>Date</th>
						    <th>Dollar to RUB</th>
						    <th>Euro to RUB</th>
						   </tr>
							<g:each in="${results}" var="item">
					  			<tr>
								   	<td >${item.day}</td>
								   	<g:if test="${minDollar == item.valueDol}">
										 <td class="danger">min is ${item.valueDol}</td>
									</g:if>
									<g:elseif test="${maxDollar == item.valueDol}">
										  <td class="success">MAX is ${item.valueDol}</td>
									</g:elseif>
									<g:else>
										  <td>${item.valueDol}</td>
									</g:else>
									<g:if test="${minEuro == item.valueEur}">
										 <td class="danger">min is ${item.valueEur}</td>
									</g:if>
									<g:elseif test="${maxEuro == item.valueEur}">
										  <td class="success">MAX is ${item.valueEur}</td>
									</g:elseif>
									<g:else>
										  <td>${item.valueEur}</td>
									</g:else>
								</tr>
							</g:each>
					</table>
					</div>
				</div>
				<div id="menu1" class="tab-pane fade">
					<h1>Graph Euro/Dollar</h1>
					<div id="controllers" role="navigation">
						<ul>
							<div id="container" style="width:100%; height:400px;"></div>
							<g:javascript> 
								$(document).ready(function () { 
										var data = "${valueEur}";
										var newE = JSON.parse(data);
									    Highcharts.chart('container', {

									    title: {
									        text: 'Euro to Dollar'
									    },
									
									    subtitle: {
									        text: 'Source: andrei.kosintsau@gmail.com'
									    },
									
									    yAxis: {
									        title: {
									            text: 'Сoefficient'
									        },
									        tickInterval: 0.0001
									    },
									    xAxis: {
									        tickInterval: 1
									    },
									    legend: {
									        layout: 'vertical',
									        align: 'right',
									        verticalAlign: 'middle'
									    },
										plotOptions: {
											series : {
												pointStart: 1
											}
									    },
									    series: [{
									        name: 'Euro/Dollar',
									        data: newE
									    }]
									    
									
									});
								});
								</g:javascript>
						</ul>
					</div>
				</div>
			</div>
		</section>
	</div>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
</body>
</html>
