<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<style>
  .khmerfont {
    font-family:'Kh Content';
    font-size:14px;
}
.phone {
    font-family:'serif';
    font-size:21px;
}
.dateprint {
    font-family:'arial';
    font-size:15px;
}
@page  
{ 
    size: 80mm 80mm;   /* auto is the initial value */ 

    /* this affects the margin in the printer settings top right bottom */ 
    margin: -4mm 2mm 0mm -4mm;  
} 

  
</style>

<div  class="modal-dialog modal-lg no-modal-header">
    <div class="modal-content">
        <div class="modal-body">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                <i class="fa fa-2x">&times;</i>
            </button>
           
            <button type="button" class="btn btn-xs btn-default no-print pull-right" style="margin-right:15px;" onclick="window.print();">
            <i class="fa fa-print"></i> <?= lang('print'); ?>           
            </button>
            <!-- <?php if ($logo) {
    ?>
                <div class="text-center" style="margin-bottom:20px;">
                    <img src="<?= base_url() . 'assets/uploads/logos/' . $biller->logo; ?>"
                         alt="<?= $biller->company && $biller->company != '-' ? $biller->company : $biller->name; ?>">
                </div>
            <?php
} ?> -->
    
            <div class="table-responsive">
                <table class="table table-bordered table-condensed">

                    <tbody>
                    <tr>
                        <td width="50%"><strong><?= $delivery->sale_reference_no; ?></></td>
                        <td class="dateprint" width="50%"><strong><?= $this->sma->hrld($delivery->date); ?></></td>
                    </tr>
                    <tr>
                        <td><strong><?= $delivery->customer; ?></></td>
                        <td class="phone"><strong><?=$other['tel'];?></></td>
                    </tr>
                    <tr>
                        
                        <!-- <td style="font-family:'Kh Content'" colspan="2"><strong><?=$other['add']; ?></></td> -->
                        <td class="khmerfont" colspan="2"><strong><?=$other['add']; ?></></td>
                        <!-- <td><?= $delivery->sale_reference_no; ?></td> -->
                    </tr>
                    <!-- <tr>
                        <td><?= lang('customer'); ?></td>
                        <td><?= $delivery->customer; ?></td>
                    </tr>
                    <tr>
                        <td><?= lang('address'); ?></td>
                        <td><?= $delivery->address; ?></td>
                    </tr>
                    <tr>
                        <td><?= lang('status'); ?></td>
                        <td><?= lang($delivery->status); ?></td>
                    </tr> -->
                    <?php if ($delivery->note) {
        ?>
                        <tr>
                            <td><?= lang('note'); ?></td>
                            <td><?= $this->sma->decode_html($delivery->note); ?></td>
                        </tr>
                    <?php
    } ?>
                    </tbody>

                </table>
            </div>
            
            <div class="table-responsive">
                <table class="table table-bordered table-hover table-striped">
                    <col style="vertical-align:middle;">
	                <col style="text-align:center; vertical-align:middle; width:7%">
                   

                    <tbody>

                    <?php 
                    foreach ($rows as $row): ?>
                        <tr>
                            <!-- <td style="text-align:center; width:40px; vertical-align:middle;"><?= $r; ?></td> -->
                            <td style="vertical-align:middle;">
                                <?= $row->product_name . ($row->variant ? ' (' . $row->variant . ')' : '');
                                if ($row->details) {
                                    echo '<br><strong>' . lang('product_details') . '</strong> ' .
                                    html_entity_decode($row->details);
                                }
                                ?>
                            </td>
                            <td style="width: 150px; text-align:center; vertical-align:middle;"><?=(int)$row->unit_quantity ?></td>
                        </tr>
                        <?php
                     
                    endforeach;
                    ?>
                    <tr>
                    <?php
                        $opts = array('unknown'=>'Unknown','bus'=>'Bus','jt'=>'JT','d2d'=>'D2D','pickup'=>'Pickup');
                    ?>
                    <!-- <td colspan="2" style="text-align:right;"><strong><?=$opts[$delivery->delivered_by]?>&nbsp;Total($)= <?=' '.$other['grand_total'].'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Khmer= ';?><?=number_format((float)$other['grand_total']*4100);?> riel</></td> -->
                    <td class="phone" colspan="2" style="text-align:right;"><strong><?=$opts[$delivery->delivered_by]?>&nbsp;Total($)= <?=' '.$other['grand_total'];?></td>
                   
                </tr>
              
                    </tbody>
                </table>
            </div>
            <div class="clearfix"></div>

            <!-- <?php if ($delivery->status == 'delivered') {
                        ?>
            <div class="row">
                <div class="col-xs-4">
                    <p><?= lang('prepared_by'); ?>:<br> <?= $user->first_name . ' ' . $user->last_name; ?> </p>
                </div>
                <div class="col-xs-4">
                    <p><?= lang('delivered_by'); ?>:<br> <?= $delivery->delivered_by; ?></p>
                </div>
                <div class="col-xs-4">
                    <p><?= lang('received_by'); ?>:<br> <?= $delivery->received_by; ?></p>
                </div>
            </div>
            <?php
                    } else {
                        ?>
            <div class="row">
                <div class="col-xs-4">
                    <p style="height:80px;"><?= lang('prepared_by'); ?>
                        : <?= $user->first_name . ' ' . $user->last_name; ?> </p>
                    <hr>
                    <p><?= lang('stamp_sign'); ?></p>
                </div>
                <div class="col-xs-4">
                    <p style="height:80px;"><?= lang('delivered_by'); ?>: </p>
                    <hr>
                    <p><?= lang('stamp_sign'); ?></p>
                </div>
                <div class="col-xs-4">
                    <p style="height:80px;"><?= lang('received_by'); ?>: </p>
                    <hr>
                    <p><?= lang('stamp_sign'); ?></p>
                </div>
            </div>
            <?php
                    } ?> -->

        </div>
    </div>
</div>

