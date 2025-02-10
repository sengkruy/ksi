<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>

<?php
$v = '';
$w = '';
if ($this->input->post('start_date')) {
    $v .= '&start_date=' . $this->input->post('start_date');
    $w .= 'start_date:"'.$this->input->post("start_date").'",';
}
if ($this->input->post('end_date')) {
    $v .= '&end_date=' . $this->input->post('end_date');
    $w .= 'end_date:"'.$this->input->post("end_date").'"';
}

?>

<script>
    $(document).ready(function () {
        // default date 
        <?php
            if($v=='')
            {
                $query_date = date('d-m-Y');
                $start = date('01/m/Y', strtotime($query_date)) .' 00:00';
                $end = date('t/m/Y', strtotime($query_date)). ' 23:59';
                $v .= '&start_date=' .$start;
                $v .= '&end_date=' .$end;
				$w .= 'start_date:"'.$start.'",';
                $w .= 'end_date:"'.$end.'"';
            }
            $v = '&start_date=' .$_COOKIE['list_sale_starttime'] ;
            $v .= '&end_date=' .$_COOKIE['list_sale_endtime'];
            $w  = 'start_date:"'.$_COOKIE['list_sale_starttime'].'",';
            $w .= 'end_date:"'.$_COOKIE['list_sale_endtime'].'"';
        ?>
        var versionNo = $.fn.dataTable.version;
      //alert("<?=lang('phone')?>");
        oTable = $('#SLData').dataTable({
            "aaSorting": [[1, "desc"], [2, "desc"]],
            "aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "<?=lang('all')?>"]],
            "iDisplayLength": <?=$Settings->rows_per_page?>,
            'bProcessing': true, 'bServerSide': true,
            'bAutoWidth': false,
            'sAjaxSource': '<?=admin_url('sales/getSales' . ($warehouse_id ? '/' . $warehouse_id : '') . '?v=1' .$v . ($this->input->get('shop') ? '&shop=' . $this->input->get('shop') : '') . ($this->input->get('attachment') ? '&attachment=' . $this->input->get('attachment') : '') . ($this->input->get('delivery') ? '&delivery=' . $this->input->get('delivery') : '')); ?>',
            'fnServerData': function (sSource, aoData, fnCallback) {
                aoData.push({
                    "name": "<?=$this->security->get_csrf_token_name()?>",
                    "value": "<?=$this->security->get_csrf_hash()?>"
                });
                $.ajax({'dataType': 'json', 'type': 'POST', 'url': sSource, 'data': aoData, 'success': fnCallback});
            },
            'fnRowCallback': function (nRow, aData, iDisplayIndex) {
                
                var oSettings = oTable.fnSettings();
                //$("td:first", nRow).html(oSettings._iDisplayStart+iDisplayIndex +1);
                nRow.id = aData[0];
                nRow.setAttribute('data-return-id', aData[14]); //returnid
                nRow.className = "invoice_link re"+aData[14]; //returnid
                //if(aData[7] > aData[9]){ nRow.className = "product_link warning"; } else { nRow.className = "product_link"; }
               // alert(aData[14]);
               //aData[14] = "Packing";

               /* var dState = aData[14];
               if(!dState)
               {
                    $("td:eq(13)",nRow).html('<p class="payment_status label label-danger">Not Packed</p>');
               }
               else
               {
                     $("td:eq(13)",nRow).html('<p class="payment_status label label-success">Packed</p>');
               } */
               
               var dBy = aData[6];
               <?php 
               $opts = array('unknown'=>'Unknown','private'=>'Private','sreng'=>'Sreng','ra'=>'RA','nk'=>'NK','fz'=>'FZ','ce'=>'CE','bus'=>'Bus','jt'=>'JT','ds'=>'DS','pickup'=>'Pickup');
                ?>
               var opts = <?php echo json_encode($opts);?>;
               if(!dBy)
               {
                    $("td:eq(6)",nRow).html('<p class="payment_status label label-danger">Not Packed</p>');
               }
               else if(dBy=='unknown')
               {
                     $("td:eq(6)",nRow).html('<p class="payment_status label label-warning">Unknown</p>');
               }
               else{
                     $("td:eq(6)",nRow).html('<p class="payment_status label label-success">'+opts[dBy]+'</p>');
               }
               
              // console.log(nRow);
               //console.log(aData);
              // console.log(dState==null)
                return nRow;
            },
            "aoColumns": [
                
                {"bSortable": false,"mRender": checkbox} //Check 0
                , {"mRender": fld,"sWidth": "5%","bSearchable": false} //Date   1
                , {"sTitle":"No."} //Refno  2
                , null //Customer  3
                ,{"bSortable": false,"bSearchable": true} //Phone  4
                
                , {"bSearchable": true} //Address  5
                , null // delivered by 6
                , {"mRender": row_status} //Sale status  7
                , {"sWidth": "40%","bSortable": false,"bSearchable": false,"sTitle":"_______________________Product_name_________________________"} // Product name  8
                , {"mRender": currencyFormat} // grand total  9
                , {"mRender": currencyFormat} //paid  10
                , {"mRender": currencyFormat} //balance  11
                , {"mRender": pay_status} // payment status  12
                , {"bSortable": false,"mRender": attachment}  //attachment 13
                , {"bVisible": false} // return_id  14
              //  , {"bSearchable": false} // delistate 15
                
                , {"bSortable": false} //Action  14 16
            
            ]
            
            ,"fnFooterCallback": function (nRow, aaData, iStart, iEnd, aiDisplay) {
                var gtotal = 0, paid = 0, balance = 0;
                for (var i = 0; i < aaData.length; i++) {
                    gtotal += parseFloat(aaData[aiDisplay[i]][9]);
                    paid += parseFloat(aaData[aiDisplay[i]][10]);
                    balance += parseFloat(formatDecimals(aaData[aiDisplay[i]][11]));
                }
                var nCells = nRow.getElementsByTagName('th');
                nCells[9].innerHTML = currencyFormat(parseFloat(gtotal));
                nCells[10].innerHTML = currencyFormat(parseFloat(paid));
                nCells[11].innerHTML = currencyFormat(parseFloat(balance));
            }
        }).fnSetFilteringDelay().dtFilter([
            {column_number: 1, filter_default_label: "[<?=lang('date');?> (yyyy-mm-dd)]", filter_type: "text", data: []},
            {column_number: 2, filter_default_label: "[No.]", filter_type: "text", data: []},
            {column_number: 5, filter_default_label: "[<?=lang('address');?>]", filter_type: "text", data: []},
            {column_number: 4, filter_default_label: "[<?=lang('phone');?>]", filter_type: "text", data: []},
            {column_number: 3, filter_default_label: "[<?=lang('customer');?>]", filter_type: "text", data: []},
            {column_number: 6, filter_default_label: "[<?=lang('delivered_by');?>]", filter_type: "text", data: []},
            {column_number: 7, filter_default_label: "[<?=lang('sale_status');?>]", filter_type: "text", data: []},
            {column_number: 12, filter_default_label: "[<?=lang('payment_status');?>]", filter_type: "text", data: []},
            //{column_number: 13, filter_default_label: "[<?=lang('Product');?>]", filter_type: "text", data: []},
        ], "header");
        // custom script

        $( "#todaybtn" ).click(function() {
            var today = new Date();
            var d = ('0' + today.getDate()).slice(-2);
            var m = ('0' + (today.getMonth()+1)).slice(-2);
            var y = today.getFullYear();
            var today_date = d+'/'+m+'/'+y ;
            var start_date = today_date+ ' 00:00';
            var end_date = today_date+ ' 23:59';
            $("#start_date").val(start_date);
            $("#end_date").val(end_date);
        });
        $( "#last7btn" ).click(function() {
            var last7 = new Date();
            last7.setDate(last7.getDate()-7);
            var d = ('0' + (last7.getDate())).slice(-2);
            var m = ('0' + (last7.getMonth()+1)).slice(-2);
            var y = last7.getFullYear();
            var last7_date = d+'/'+m+'/'+y ;
            var start_date = last7_date+ ' 00:00';

            var today = new Date();
            var d = ('0' + (today.getDate())).slice(-2);
            var m = ('0' + (today.getMonth()+1)).slice(-2);
            var y = today.getFullYear();
            var today_date = d+'/'+m+'/'+y ;
            var end_date = today_date+ ' 23:59';

            $("#start_date").val(start_date);
            $("#end_date").val(end_date);
        });
        $( "#yesterdaybtn" ).click(function() {
            var today = new Date();
            var d = ('0' + (today.getDate()-1)).slice(-2);
            var m = ('0' + (today.getMonth()+1)).slice(-2);
            var y = today.getFullYear();
            var today_date = d+'/'+m+'/'+y ;
            var start_date = today_date+ ' 00:00';
            var end_date = today_date+ ' 23:59';
            $("#start_date").val(start_date);
            $("#end_date").val(end_date);
        });
        $( "#thismonthbtn" ).click(function() {
            var today = new Date();
            var endmonth =  new Date(today.getFullYear(), today.getMonth() + 1, 0);
            
            var start_date = '01'+'/'+('0'+(endmonth.getMonth()+1)).slice(-2)+'/'+ endmonth.getFullYear()+ ' 00:00';
            var end_date = endmonth.getDate()+'/'+('0'+(endmonth.getMonth()+1)).slice(-2)+'/'+endmonth.getFullYear()+ ' 23:59';
            $("#start_date").val(start_date);
            $("#end_date").val(end_date);
        });
        $( "#lastmonthbtn" ).click(function() {
            var today = new Date();
            var endmonth =  new Date(today.getFullYear(), today.getMonth() , 0);
            
            var start_date = '01'+'/'+('0'+(endmonth.getMonth()+1)).slice(-2)+'/'+ endmonth.getFullYear()+ ' 00:00';
            var end_date = endmonth.getDate()+'/'+('0'+(endmonth.getMonth()+1)).slice(-2)+'/'+endmonth.getFullYear()+ ' 23:59';
            $("#start_date").val(start_date);
            $("#end_date").val(end_date);
        });

        // Request ajax to get widget data
        

        $.ajax({
            url: '<?=admin_url('sales/getSalesWidget')?>'
            ,data:{<?= $w ?>}

            ,success: function(result){
              //alert("hi");
              var obj = JSON.parse(result);
              $("#total_order").text(obj.total_order);
              $("#unpaid").text(obj.unpaid);
              $("#unknown_delivery").text(obj.unknown_delivery);
              $("#not_packed_delivery").text(obj.not_packed_delivery);
              $("#total_return").text(obj.total_return);
         }});

         $('#example').dataTable( {
        "bProcessing": true,
        "sAjaxSource": '<?=admin_url('sales/get_duplicate_sale');?>',
        "aaSorting": [[0,'desc'],[3,'desc']],
	"iDisplayLength": 10,
        "aoColumns": [
            { "mData": "date" ,"sTitle":"Date"},
          //  { "mData": "id" ,"sTitle":"ID"},
            { "mData": "reference_no" ,"sTitle":"Ref No"},
            { "mData": "customer" ,"sTitle":"Customer"},
            { "mData": "phone" ,"sTitle":"Phone"},
            { "mData": "address","sTitle":"Address" },
            { "mData": "sale_status" ,"sTitle":"Sale Status","mRender": row_status},
           
            
            { "mData": "payment_status" ,"sTitle":"Payment Status","mRender": pay_status}
        ],
        'fnRowCallback': function (nRow, aData, iDisplayIndex) {
                var inputDate = new Date(aData['date']);
                var todaysDate = new Date();
                if(inputDate.setHours(0,0,0,0) == todaysDate.setHours(0,0,0,0)) {
                    // Date equals today's date
                    //alert('samed day')
                    //$("td:eq(6)",nRow).html('<p class="payment_status label label-success">'+opts[dBy]+'</p>');
                    $("td",nRow ).css( "background-color", "yellow" );
                  // $("td",nRow).addClass("kk");
                  // $(".sorting_2",nRow).addClass("kk");
                }
               
            }
         } );
         



        if (localStorage.getItem('remove_slls')) {
            if (localStorage.getItem('slitems')) {
                localStorage.removeItem('slitems');
            }
            if (localStorage.getItem('sldiscount')) {
                localStorage.removeItem('sldiscount');
            }
            if (localStorage.getItem('sltax2')) {
                localStorage.removeItem('sltax2');
            }
            if (localStorage.getItem('slref')) {
                localStorage.removeItem('slref');
            }
            if (localStorage.getItem('slshipping')) {
                localStorage.removeItem('slshipping');
            }
            if (localStorage.getItem('slwarehouse')) {
                localStorage.removeItem('slwarehouse');
            }
            if (localStorage.getItem('slnote')) {
                localStorage.removeItem('slnote');
            }
            if (localStorage.getItem('slinnote')) {
                localStorage.removeItem('slinnote');
            }
            if (localStorage.getItem('slcustomer')) {
                localStorage.removeItem('slcustomer');
            }
            if (localStorage.getItem('slbiller')) {
                localStorage.removeItem('slbiller');
            }
            if (localStorage.getItem('slcurrency')) {
                localStorage.removeItem('slcurrency');
            }
            if (localStorage.getItem('sldate')) {
                localStorage.removeItem('sldate');
            }
            if (localStorage.getItem('slsale_status')) {
                localStorage.removeItem('slsale_status');
            }
            if (localStorage.getItem('slpayment_status')) {
                localStorage.removeItem('slpayment_status');
            }
            if (localStorage.getItem('paid_by')) {
                localStorage.removeItem('paid_by');
            }
            if (localStorage.getItem('amount_1')) {
                localStorage.removeItem('amount_1');
            }
            if (localStorage.getItem('paid_by_1')) {
                localStorage.removeItem('paid_by_1');
            }
            if (localStorage.getItem('pcc_holder_1')) {
                localStorage.removeItem('pcc_holder_1');
            }
            if (localStorage.getItem('pcc_type_1')) {
                localStorage.removeItem('pcc_type_1');
            }
            if (localStorage.getItem('pcc_month_1')) {
                localStorage.removeItem('pcc_month_1');
            }
            if (localStorage.getItem('pcc_year_1')) {
                localStorage.removeItem('pcc_year_1');
            }
            if (localStorage.getItem('pcc_no_1')) {
                localStorage.removeItem('pcc_no_1');
            }
            if (localStorage.getItem('cheque_no_1')) {
                localStorage.removeItem('cheque_no_1');
            }
            if (localStorage.getItem('slpayment_term')) {
                localStorage.removeItem('slpayment_term');
            }
            localStorage.removeItem('remove_slls');
        }

        <?php if ($this->session->userdata('remove_slls')) {
    ?>
        if (localStorage.getItem('slitems')) {
            localStorage.removeItem('slitems');
        }
        if (localStorage.getItem('sldiscount')) {
            localStorage.removeItem('sldiscount');
        }
        if (localStorage.getItem('sltax2')) {
            localStorage.removeItem('sltax2');
        }
        if (localStorage.getItem('slref')) {
            localStorage.removeItem('slref');
        }
        if (localStorage.getItem('slshipping')) {
            localStorage.removeItem('slshipping');
        }
        if (localStorage.getItem('slwarehouse')) {
            localStorage.removeItem('slwarehouse');
        }
        if (localStorage.getItem('slnote')) {
            localStorage.removeItem('slnote');
        }
        if (localStorage.getItem('slinnote')) {
            localStorage.removeItem('slinnote');
        }
        if (localStorage.getItem('slcustomer')) {
            localStorage.removeItem('slcustomer');
        }
        if (localStorage.getItem('slbiller')) {
            localStorage.removeItem('slbiller');
        }
        if (localStorage.getItem('slcurrency')) {
            localStorage.removeItem('slcurrency');
        }
        if (localStorage.getItem('sldate')) {
            localStorage.removeItem('sldate');
        }
        if (localStorage.getItem('slsale_status')) {
            localStorage.removeItem('slsale_status');
        }
        if (localStorage.getItem('slpayment_status')) {
            localStorage.removeItem('slpayment_status');
        }
        if (localStorage.getItem('paid_by')) {
            localStorage.removeItem('paid_by');
        }
        if (localStorage.getItem('amount_1')) {
            localStorage.removeItem('amount_1');
        }
        if (localStorage.getItem('paid_by_1')) {
            localStorage.removeItem('paid_by_1');
        }
        if (localStorage.getItem('pcc_holder_1')) {
            localStorage.removeItem('pcc_holder_1');
        }
        if (localStorage.getItem('pcc_type_1')) {
            localStorage.removeItem('pcc_type_1');
        }
        if (localStorage.getItem('pcc_month_1')) {
            localStorage.removeItem('pcc_month_1');
        }
        if (localStorage.getItem('pcc_year_1')) {
            localStorage.removeItem('pcc_year_1');
        }
        if (localStorage.getItem('pcc_no_1')) {
            localStorage.removeItem('pcc_no_1');
        }
        if (localStorage.getItem('cheque_no_1')) {
            localStorage.removeItem('cheque_no_1');
        }
        if (localStorage.getItem('slpayment_term')) {
            localStorage.removeItem('slpayment_term');
        }
        <?php $this->sma->unset_data('remove_slls');
}
        ?>

        $(document).on('click', '.sledit', function (e) {
            if (localStorage.getItem('slitems')) {
                e.preventDefault();
                var href = $(this).attr('href');
                bootbox.confirm("<?=lang('you_will_loss_sale_data')?>", function (result) {
                    if (result) {
                        window.location.href = href;
                    }
                });
            }
        });
        $(document).on('click', '.slduplicate', function (e) {
            if (localStorage.getItem('slitems')) {
                e.preventDefault();
                var href = $(this).attr('href');
                bootbox.confirm("<?=lang('you_will_loss_sale_data')?>", function (result) {
                    if (result) {
                        window.location.href = href;
                    }
                });
            }
        });

    });

</script>
<script>
    function setCookie(){
        document.cookie = "list_sale_starttime="+$("#start_date").val();
        document.cookie = "list_sale_endtime="+$("#end_date").val();
    }
</script>
<?php if ($Owner || $GP['bulk_actions']) {
            echo admin_form_open('sales/sale_actions', 'id="action-form"');
        }
?>
<div class="box">
    <div class="box-header">
        <h2 class="blue"><i
                class="fa-fw fa fa-heart"></i><?=lang('sales') .'Filter'. ' (' . ($warehouse_id ? $warehouse->name : lang('all_warehouses')) . ')';?>
        <?php
            if ($this->input->post('start_date')) {
                echo 'From ' . $this->input->post('start_date') . ' to ' . $this->input->post('end_date');
            }
        ?>
            </h2>

        <div class="box-icon">
            <ul class="btn-tasks">
                
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="icon fa fa-tasks tip" data-placement="left" title="<?=lang('actions')?>"></i>
                    </a>
                    <ul class="dropdown-menu pull-right tasks-menus" role="menu" aria-labelledby="dLabel">
                        <li>
                            <a href="<?=admin_url('sales/add')?>">
                                <i class="fa fa-plus-circle"></i> <?=lang('add_sale')?>
                            </a>
                        </li>
                        <li>
                            <a href="#" id="excel" data-action="export_excel">
                                <i class="fa fa-file-excel-o"></i> <?=lang('export_to_excel')?>
                            </a>
                        </li>
                        <li>
                            <a href="#" id="combine" data-action="combine">
                                <i class="fa fa-file-pdf-o"></i> <?=lang('combine_to_pdf')?>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#" class="bpo" title="<b><?=lang('delete_sales')?></b>" data-content="<p><?=lang('r_u_sure')?></p><button type='button' class='btn btn-danger' id='delete' data-action='delete'><?=lang('i_m_sure')?></a> <button class='btn bpo-close'><?=lang('no')?></button>" data-html="true" data-placement="left">
                                <i class="fa fa-trash-o"></i> <?=lang('delete_sales')?>
                            </a>
                        </li>
                    </ul>
                </li>
                <?php if (!empty($warehouses)) {
    ?>
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icon fa fa-building-o tip" data-placement="left" title="<?=lang('warehouses')?>"></i></a>
                        <ul class="dropdown-menu pull-right tasks-menus" role="menu" aria-labelledby="dLabel">
                            <li><a href="<?=admin_url('sales')?>"><i class="fa fa-building-o"></i> <?=lang('all_warehouses')?></a></li>
                            <li class="divider"></li>
                            <?php
                                foreach ($warehouses as $warehouse) {
                                    echo '<li><a href="' . admin_url('sales/' . $warehouse->id) . '"><i class="fa fa-building"></i>' . $warehouse->name . '</a></li>';
                                } ?>
                        </ul>
                    </li>
                <?php
}
                ?>
                <?php if (SHOP) {
                    ?>
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icon fa fa-list-alt tip" data-placement="left" title="<?=lang('sales')?>"></i></a>
                    <ul class="dropdown-menu pull-right tasks-menus" role="menu" aria-labelledby="dLabel">
                        <li<?= $this->input->get('shop') == 'yes' ? ' class="active"' : ''; ?>><a href="<?=admin_url('sales?shop=yes')?>"><i class="fa fa-shopping-cart"></i> <?=lang('shop_sales')?></a></li>
                        <li<?= $this->input->get('shop') == 'no' ? ' class="active"' : ''; ?>><a href="<?=admin_url('sales?shop=no')?>"><i class="fa fa-heart"></i> <?=lang('staff_sales')?></a></li>
                        <li<?= !$this->input->get('shop') ? ' class="active"' : ''; ?>><a href="<?=admin_url('sales')?>"><i class="fa fa-list-alt"></i> <?=lang('all_sales')?></a></li>
                    </ul>
                </li>
                <?php
                } ?>
            </ul>
        </div>
    </div>
    <?php if ($Owner || $GP['bulk_actions']) {
                    ?>
    <div style="display: none;">
        <input type="hidden" name="form_action" value="" id="form_action"/>
        <?=form_submit('performAction', 'performAction', 'id="action-form-submit"')?>
    </div>
    <?=form_close()?>
<?php
                }
?>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">

                <p class="introtext"><?=lang('list_results');?></p>
                <div id="form">
               
                    <?php echo admin_form_open('sales','onsubmit="return setCookie()"'); ?>
                    <div class="row">
                        
                        <div class="col-sm-4">
                            <div class="form-group">
                                Start Date
                                <?php echo form_input('start_date', $_COOKIE['list_sale_starttime'] , 'class="form-control datetime"  id="start_date" autocomplete="off"'); ?>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                End Date
                                <?php echo form_input('end_date', $_COOKIE['list_sale_endtime'], 'class="form-control datetime" id="end_date" autocomplete="off"'); ?>
                            </div>
                        </div>
                    </div>
                    Filter date:
                    <button class= "btn btn-outline-dark"type="button" id="todaybtn">Today</button>
                    <button class= "btn btn-outline-dark"type="button" id="yesterdaybtn">Yesterday</button>
                    <button class= "btn btn-outline-dark"type="button" id="last7btn">Last 7 days</button>
                    <button class= "btn btn-outline-dark"type="button" id="thismonthbtn">This month</button>
                    <button class= "btn btn-outline-dark"type="button" id="lastmonthbtn">Last month</button>
                    
                    
                    <div class="form-group">
                        <div
                            class="controls"> <?php echo form_submit('submit_report', $this->lang->line('submit'), 'class="btn btn-primary"'); ?> </div>
                    </div>
                    <?php echo form_close(); ?>

                </div>
                <div class="row">
                    <div class="col-md-2">
                    <div class=" card-counter primary">
                    <i class="fa fa-flag"></i>
                        <span class="count-numbers" id="total_order">---</span>
                        <span class="count-name">Order</span>
                    </div>
                    </div>

                    <div class="col-md-2">
                    <div class="card-counter danger">
                        <i class="fa fa-money"></i>
                        <span class="count-numbers" id="unpaid">---</span>
                        <span class="count-name">Unpaid</span>
                    </div>
                    </div>
                    <div class="col-md-2">
                    <div class="card-counter danger">
                        <i class="fa fa-frown-o"></i>
                        <span class="count-numbers" id="unknown_delivery">---</span>
                        <span class="count-name">Unknown Delivery</span>
                    </div>
                    </div>
                    <div class="col-md-2">
                    <div class="card-counter success">
                        <i class="fa fa-motorcycle"></i>
                        <span class="count-numbers" id="not_packed_delivery">---</span>
                        <span class="count-name">Not Packed</span>
                    </div>
                    </div>

                    
                    <div class="col-md-2">
                    <div class="card-counter info">
                        <i class="fa fa-frown-o"></i>
                        <span class="count-numbers" id="total_return">---</span>
                        <span class="count-name">Total Return</span>
                    </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <h2>តារាងលេខដូចគ្នា (<?php $s =  date("Y-m-d 00:00", strtotime("-4 days")) ." to " . $end_date = date("Y-m-d 23:59") ; echo $s?>) </h2>
                <table id="example" class="table table-dark table-bordered  table-striped">
                    <thead  class="thead-dark">
                        <tr >
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                          
                          
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            
                        </tr>
                       
                    </tbody>
                </table>
                <div class="clearfix"></div>
                <div class="table-responsive">
                    <table id="SLData" class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0" border="0" >
                        <thead>
                        <tr>
                            <th style="min-width:30px; width: 30px; text-align: center;">
                                <input class="checkbox checkft" type="checkbox" name="check"/>
                            </th>
                            
                            <th><?= lang('date'); ?></th>
                            <th><?= lang('reference_no'); ?></th>
                            
                            <th><?= lang('customer'); ?></th>
                            <th ><?= lang('phone'); ?></th>
                            <th><?= lang('address'); ?></th>
                            <th> Delivered by</th>
                            <th><?= lang('sale_status'); ?></th>
                            <th></th>
                            <th><?= lang('grand_total'); ?></th>
                            <th><?= lang('paid'); ?></th>
                            <th><?= lang('balance'); ?></th>
                            <th><?= lang('payment_status'); ?></th>
                            <th style="min-width:30px; width: 30px; text-align: center;"><i class="fa fa-chain"></i></th>
                            <th></th><!-- return id --> 
                            <!-- <th style="min-width:30px; width: 900px; text-align: center;">Producdddddddddddddt name</th> -->
                            <!-- <th> Delivery Status</th> -->
                            
                            <th style="width:80px; text-align:center;"><?= lang('actions'); ?></th>
                            
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="12" class="dataTables_empty"><?= lang('loading_data'); ?></td>
                        </tr>
                        </tbody>
                        <tfoot class="dtFilter">
                        <tr class="active">
                            <th style="min-width:30px; width: 30px; text-align: center;">
                                <input class="checkbox checkft" type="checkbox" name="check"/>
                            </th>
                            <th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th>
                            <th><?= lang('grand_total'); ?></th>
                            <th><?= lang('paid'); ?></th>
                            <th><?= lang('balance'); ?></th>
                            <th></th>
                            <th style="min-width:30px; width: 30px; text-align: center;"><i class="fa fa-chain"></i></th>
                            <th></th>
                            
                            <th style="width:80px; text-align:center;"><?= lang('actions'); ?></th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .card-counter{
    box-shadow: 2px 2px 10px #DADADA;
    margin: 5px;
    padding: 20px 10px;
    background-color: #fff;
    height: 100px;
    border-radius: 5px;
    transition: .3s linear all;
  }

  .card-counter:hover{
    box-shadow: 4px 4px 20px #DADADA;
    transition: .3s linear all;
  }

  .card-counter.primary{
    background-color: #007bff;
    color: #FFF;
  }

  .card-counter.danger{
    background-color: #ef5350;
    color: #FFF;
  }  

  .card-counter.success{
    background-color: #66bb6a;
    color: #FFF;
  }  

  .card-counter.info{
    background-color: #26c6da;
    color: #FFF;
  }  

  .card-counter i{
    font-size: 5em;
    opacity: 0.2;
  }

  .card-counter .count-numbers{
    position: absolute;
    right: 35px;
    top: 20px;
    font-size: 32px;
    display: block;
  }

  .card-counter .count-name{
    position: absolute;
    right: 35px;
    top: 65px;
    font-style: italic;
    text-transform: capitalize;
    opacity: 0.7;
    display: block;
    font-size: 18px;
  }
</style>