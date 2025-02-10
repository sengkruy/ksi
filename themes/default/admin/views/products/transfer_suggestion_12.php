<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<style type="text/css" media="screen">
    #PRData td:nth-child(7) {
        text-align: right;
    }
    <?php if ($Owner || $Admin || $this->session->userdata('show_cost')) {
        ?>
    #PRData td:nth-child(9) {
        text-align: right;
    }
        <?php
    } if ($Owner || $Admin || $this->session->userdata('show_price')) {
        ?>
    #PRData td:nth-child(8) {
        text-align: right;
    }
        <?php
    } ?>
</style>
<script>
    var oTable;
    $(document).ready(function () {
        // Add an event listener for the category selector
    $('#categorySelect').on('change', function () {
        var category = $(this).val();
        // Apply the category filter to the table
        oTable.fnFilter(category, 8); // Filter by the 9th column (category column)
    });
    
        oTable = $('#PRData').dataTable({
            "aaSorting": [[4, "desc"]], //sort by transfer qty
            "aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "<?= lang('all') ?>"]],
            "iDisplayLength": <?= $Settings->rows_per_page ?>,
            'bProcessing': true, 'bServerSide': true,
            'sAjaxSource': '<?= admin_url('products/getProducts_transfer_12' . ($warehouse_id ? '/' . $warehouse_id : '') . ($supplier ? '?supplier=' . $supplier->id : '')) ?>',
            'fnServerData': function (sSource, aoData, fnCallback) {
                aoData.push({
                    "name": "<?= $this->security->get_csrf_token_name() ?>",
                    "value": "<?= $this->security->get_csrf_hash() ?>"
                });
                $.ajax({'dataType': 'json', 'type': 'POST', 'url': sSource, 'data': aoData, 'success': fnCallback});
            },
            'fnRowCallback': function (nRow, aData, iDisplayIndex) {
                var oSettings = oTable.fnSettings();
                nRow.id = aData[0];
                nRow.className = "product_link";
                //if(aData[7] > aData[9]){ nRow.className = "product_link warning"; } else { nRow.className = "product_link"; }
                return nRow;
            },
            //productid, image, code, name, quantity_1, quantity_2, total_qty, cname, cost, price,  rack, alert_quantity
            //productid, image, code, name, quantity_1, quantity_2, total_qty, transfer_to_branch_1,  cname')
            "aoColumns": [
                {"bSortable": false,  "mRender": checkbox}, 
                {"bSortable": false,"mRender": img_hl}, //image
                 null, //code
                 null, // name
              
               {"mRender": formatQuantity}, // QTY 1 
               {"mRender": formatQuantity}, //QTY 2
                {"mRender": formatQuantity}, //total qty
                {"mRender": formatQuantity}, //transfer qty
                 null, // cname
                 {"bSortable": false} //action
                 ]
        }).fnSetFilteringDelay().dtFilter([
            {column_number: 2, filter_default_label: "[<?=lang('code');?>]", filter_type: "text", data: []},
            {column_number: 3, filter_default_label: "[<?=lang('name');?>]", filter_type: "text", data: []},
            {column_number: 4, filter_default_label: "[Transfer QTY]", filter_type: "text", data: []},
            {column_number: 5, filter_default_label: "[QTY Pawfect]", filter_type: "text", data: []},
            {column_number: 6, filter_default_label: "[QTY Petland]", filter_type: "text", data: []},
            {column_number: 7, filter_default_label: "[Total QTY]", filter_type: "text", data: []},
            
            {column_number: 8, filter_default_label: "[<?=lang('category');?>]", filter_type: "text", data: []},
            ], "footer");

    });
</script>
<?php if ($Owner || ($GP && $GP['bulk_actions'])) {
                echo admin_form_open('products/product_actions' . ($warehouse_id ? '/' . $warehouse_id : ''), 'id="action-form"');
} ?>
<div class="box">
    <div class="box-header">
        <h2 class="blue"><i
                class="fa-fw fa fa-barcode"></i><?= lang('products') . ' (' . ($warehouse_id ? $warehouse->name : lang('all_warehouses')) . ')' . ($supplier ? ' (' . lang('supplier') . ': ' . ($supplier->company && $supplier->company != '-' ? $supplier->company : $supplier->name) . ')' : ''); ?>
        </h2>

        <div class="box-icon">
            <ul class="btn-tasks">
                 <!-- Move the category selector here -->
            
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="icon fa fa-tasks tip" data-placement="left" title="<?= lang('actions') ?>"></i>
                    </a>
                    <ul class="dropdown-menu pull-right tasks-menus" role="menu" aria-labelledby="dLabel">
                        <li>
                            <a href="<?= admin_url('products/add') ?>">
                                <i class="fa fa-plus-circle"></i> <?= lang('add_product') ?>
                            </a>
                        </li>
                        <?php if (!$warehouse_id) {
                            ?>
                        <li>
                            <a href="<?= admin_url('products/update_price') ?>" data-toggle="modal" data-target="#myModal">
                                <i class="fa fa-file-excel-o"></i> <?= lang('update_price') ?>
                            </a>
                        </li>
                            <?php
                        } ?>
                        <li>
                            <a href="#" id="labelProducts" data-action="labels">
                                <i class="fa fa-print"></i> <?= lang('print_barcode_label') ?>
                            </a>
                        </li>
                        <li>
                            <a href="#" id="sync_quantity" data-action="sync_quantity">
                                <i class="fa fa-arrows-v"></i> <?= lang('sync_quantity') ?>
                            </a>
                        </li>
                        <li>
                            <a href="#" id="set_avg_cost" data-action="set_avg_cost">
                                <i class="fa fa-dollar"></i> <?= lang('set_avg_cost') ?>
                            </a>
                        </li>
                        <li>
                            <a href="#" id="excel" data-action="export_excel">
                                <i class="fa fa-file-excel-o"></i> <?= lang('export_to_excel') ?>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#" class="bpo" title="<b><?= $this->lang->line('delete_products') ?></b>"
                                data-content="<p><?= lang('r_u_sure') ?></p><button type='button' class='btn btn-danger' id='delete' data-action='delete'><?= lang('i_m_sure') ?></a> <button class='btn bpo-close'><?= lang('no') ?></button>"
                                data-html="true" data-placement="left">
                            <i class="fa fa-trash-o"></i> <?= lang('delete_products') ?>
                             </a>
                         </li>
                    </ul>
                </li>
               
                <?php if (!empty($warehouses)) {
                    ?>
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icon fa fa-building-o tip" data-placement="left" title="<?= lang('warehouses') ?>"></i></a>
                        <ul class="dropdown-menu pull-right tasks-menus" role="menu" aria-labelledby="dLabel">
                            <li><a href="<?= admin_url('products_both') ?>"><i class="fa fa-building-o"></i> <?= lang('all_warehouses') ?></a></li>
                            <li class="divider"></li>
                            <?php
                            foreach ($warehouses as $warehouse) {
                                echo '<li><a href="' . admin_url('products_both/' . $warehouse->id) . '"><i class="fa fa-building"></i>' . $warehouse->name . '</a></li>';
                            } ?>
                        </ul>
                    </li>
                    <?php
                } ?>
            </ul>
        </div>
    </div>
    
                
            
    <div class="box-content">
   
        <div class="row">
            
            <div class="col-lg-12">
                <p class="introtext"><?= lang('list_results'); ?></p>

                <div class="table-responsive">
                <a href="<?php echo admin_url('products/exportStockCount'); ?>" class="btn btn-primary">Export Excel</a>
                <a href="<?php echo admin_url('products/testtelegram'); ?>" class="btn btn-primary">test</a>
    
                <select id="categorySelect" class="form-control">
                    <option value="">Sort by category</option>
                    <option value="Cloth">Cloth</option>
                    <option value="Collar">Collar</option>
                    <option value="Daily Used">Daily Used</option>
                    <option value="Food">Food</option>
                    <option value="Medicine">Medicine</option>
                    <option value="Toy">Toy</option>
                    <option value="Shampoo">Shampoo</option>
                    <!-- Add more options for each category -->
                </select>
                    <table id="PRData" class="table table-bordered table-condensed table-hover table-striped">
                        <thead>
                       <!-- //productid, image, code, name, quantity_1, quantity_2, total_qty, cname, cost, price,  rack, alert_quantity
                        //productid, image, code, name, quantity_1, quantity_2, total_qty, transfer_to_branch_1,  cname')-->
                        <tr class="primary">
                            <th style="min-width:30px; width: 30px; text-align: center;">
                                <input class="checkbox checkth" type="checkbox" name="check"/>
                            </th>
                            <th style="min-width:40px; width: 40px; text-align: center;"><?php echo $this->lang->line('image'); ?></th>
                            <th><?= lang('code') ?></th>
                            <th><?= lang('name') ?></th>
                            <th>Transfer to 1</th>
                            <th>QTY Pawfect</th>
                            <th>QTY Petland</th>
                            <th>TOTAL QTY</th>
                            
                            <th><?= lang('category') ?></th>
                           
                            <th style="min-width:65px; text-align:center;"><?= lang('actions') ?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="11" class="dataTables_empty"><?= lang('loading_data_from_server'); ?></td>
                        </tr>
                        </tbody>

                        <tfoot class="dtFilter">
                        <tr class="active">
                            <th style="min-width:30px; width: 30px; text-align: center;">
                                <input class="checkbox checkft" type="checkbox" name="check"/>
                            </th>
                            <th style="min-width:40px; width: 40px; text-align: center;"><?php echo $this->lang->line('image'); ?></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>

                            <th></th>
                            <th></th>
                            <th></th>
                           
                            <th style="width:65px; text-align:center;"><?= lang('actions') ?></th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<?php if ($Owner || ($GP && $GP['bulk_actions'])) {
    ?>
    <div style="display: none;">
        <input type="hidden" name="form_action" value="" id="form_action"/>
        <?= form_submit('performAction', 'performAction', 'id="action-form-submit"') ?>
    </div>
    <?= form_close() ?>
    <?php
} ?>
