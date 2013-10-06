var NoMain={
	pieChartData:null,
	drawPieChart:function() {
		// Create the data table.
		var totalScoreData = NoMain.pieChartData;
		
		var arrayData = new Array();
		if(totalScoreData != null){
			for(var i=0 ; i < totalScoreData.length; i++){
				arrayData[i] = [totalScoreData[i].score+'점',  totalScoreData[i].gameCnt];
			}
		}
		
		var data = new google.visualization.DataTable();
	       data.addColumn('string', 'Topping');
	       data.addColumn('number', 'Slices');
	       data.addRows(arrayData);

	    // Set chart options
	    var options = {'title':'',
	    				'is3D':true,
			    		'width':455, 
			    		'height':220};

	    // Instantiate and draw our chart, passing in some options.
	    var chart = new google.visualization.PieChart(document.getElementById('pie_chart_div'));
	    chart.draw(data, options);
	},
	ajaxTotalMemberScoreList:function(){
		var url = "/main/ajaxTotalMemberScoreList.do";
		jQuery.ajax({      
	        type:"GET",
	        url:url,
	        async:false,
	        timeout:3000,
	        success:function(data){
	        	if(data != "1"){
	        		NoMain.pieChartData = data;
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
		google.setOnLoadCallback(NoMain.drawPieChart);
		// Callback that creates and populates a data table,
		// instantiates the pie chart, passes in the data and
		// draws it.
	}
};


