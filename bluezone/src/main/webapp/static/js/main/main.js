var Main={
	win:0,
	lose:0,
	draw:0,
	lineChartData:null,
	drawPieChart:function() {
		// Create the data table.
		var data = new google.visualization.DataTable();
	       data.addColumn('string', 'Topping');
	       data.addColumn('number', 'Slices');
	       data.addRows([
	                     ['Win('+Main.win+'G)', Main.win],
	                     ['Lose('+Main.lose+'G)', Main.lose],
	                     ['Draw('+Main.draw+'G)', Main.draw]
	                   ]);

	    // Set chart options
	    var options = {'title':'',
	    				'is3D':true,
			    		'width':455, 
			    		'height':220};

	    // Instantiate and draw our chart, passing in some options.
	    var chart = new google.visualization.PieChart(document.getElementById('pie_chart_div'));
	    chart.draw(data, options);
	},
	drawLineChart1:function(){
		// 최근 기록을 가져온다.
		var recentRecordData = Main.lineChartData;
		
		var arrayData = new Array();
		arrayData[0] = ['회차', '점수', '하이런'];
		if(recentRecordData != null){
			for(var i=0 ; i < recentRecordData.length && i < 10 ; i++){
				arrayData[i+1] = [Util.viewDate(recentRecordData[i].strRegDtm),  Util.getInt(recentRecordData[i].earnScore), Util.getInt(recentRecordData[i].highRun)];
			}
		}
		
		var data = google.visualization.arrayToDataTable(arrayData);
		var options = {
			title: ""
		};

		var chart = new google.visualization.LineChart(document.getElementById('line_chart_div1'));
		chart.draw(data, options);
	},
	drawLineChart2:function(){
		// 최근 기록을 가져온다.
		var recentRecordData = Main.lineChartData;
		
		var arrayData = new Array();
		arrayData[0] = ['회차', 'AVG'];
		if(recentRecordData != null){
			for(var i=0 ; i < recentRecordData.length && i < 10 ; i++){
				arrayData[i+1] = [Util.viewDate(recentRecordData[i].strRegDtm),  Util.getFloat(recentRecordData[i].avg)];
			}
		}
		
		var data = google.visualization.arrayToDataTable(arrayData);
		var options = {
				title: ""
		};
		
		var chart = new google.visualization.LineChart(document.getElementById('line_chart_div2'));
		chart.draw(data, options);
	},
	ajaxRecentRecordList:function(){
		var url = "/main/ajaxRecentRecordList.do";
		jQuery.ajax({      
	        type:"POST",
	        url:url,
	        async:false,
	        timeout:3000,
	        success:function(data){
	        	if(data != "1"){
	        		Main.lineChartData = data;
	        	}else{
	        		alert("fail");
	        	}
	        },   
	        error:function(e){  
	            alert(e.responseText);  
	        },
	        complete:function(data){
	        }
	    });
	},
	runPieChart:function(){
		//Load the Visualization API and the piechart package.
		google.load('visualization', '1.0', {'packages':['corechart']});
		// Set a callback to run when the Google Visualization API is loaded.
		google.setOnLoadCallback(Main.drawPieChart);
		// Callback that creates and populates a data table,
		// instantiates the pie chart, passes in the data and
		// draws it.
	},
	runLineChart1:function(){
		google.load('visualization', '1.0', {'packages':['corechart']});
		google.setOnLoadCallback(Main.drawLineChart1);
	},
	runLineChart2:function(){
		google.load('visualization', '1.0', {'packages':['corechart']});
		google.setOnLoadCallback(Main.drawLineChart2);
	}
};

var Util={
	getInt:function(data){
		if(data == undefined || data == null || data == "" || isNaN(data) == true){
			return 0;
		}else{
			return parseInt(data);
		}
	},
	getFloat:function(data){
		if(data == undefined || data == null || data == "" || isNaN(data) == true){
			return 0;
		}else{
			return parseFloat(data);
		}
	},
	viewDate:function(str){
		if(str != null && str != "" && str.length >= 8){
			return str.substring(4,6) + "/" + str.substring(6,8);
		}else{
			return str;
		}
	}
};

