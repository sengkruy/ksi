<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous"> -->
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" /> -->

<!-- Include Bootstrap Datepicker -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
      $(function(){
        
        $("#monthPick").datepicker({
        format: "yyyy-mm",
        viewMode: "months", 
        minViewMode: "months",
        autoclose: true
      });
      });
    </script>
    <script type="text/javascript">



     // $('#monthPick').datepicker();

      google.charts.load('current', {'packages':['table','corechart','line']});
      google.charts.setOnLoadCallback(drawTable);
      
      chart_data = [];
    //   for (a in jArray) 
    //   {
    //     chart_data.push(a['product_id'])  
    //     chart_data.push(a['product_name'])
    //   }
      
      function drawTable() {
        var jArray = <?php echo json_encode($db_result,JSON_NUMERIC_CHECK ); ?>;
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Name');
        for (i = 1; i <= 31; i++) 
        {
            data.addColumn('number', i);
        }
        
        for (key in jArray)
        {
          row = jArray[key];
          data.addRows([
          [row['product_name'],row[1],row[2],row[3],row[4],row[5],row[6],row[7],row[8],row[9],row[10],row[11],row[12],row[13],row[14],row[15],row[16],row[17],row[18],row[19],row[20],row[21],row[22],row[23],row[24],row[25],row[26],row[27],row[28],row[29],row[30],row[31]  ]
          
        ]);
          
        }
       
        var table = new google.visualization.Table(document.getElementById('table_div'));

        table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});

      //   var options = {
      //   hAxis: {
      //     title: 'Time'
      //   },
      //   vAxis: {
      //     title: 'Popularity'
      //   },
      //   backgroundColor: '#f1f8e9',
      //   width:'100%',
      //   height:'500%'
      // };
      //   var chart = new google.visualization.LineChart(document.getElementById('linechart_div'));
      //   chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    
      <?php echo admin_form_open('reports/daily_sales_detail'); ?>
    <div class= 'form-group col-sm-4'>
      <label for="monthPick">Select month</label>
      <?php echo form_input('monthPick',(isset($_POST['monthPick']) ? $_POST['monthPick'] : date('Y-m')),'class="form-control " id="monthPick" placeholder="Select a month" autocomplete="off" ');  ?>
    </div>
    <div class= 'form-group '>
      <br>
      <?php echo form_submit('class = "btn btn-primary" type="submit" value="Submit"');     ?>
    </div>
      <?php echo form_close(); ?>
   

    <div id="table_div"></div>
    <br>
    <div id="linechart_div"></div>
  </body>
</html>
