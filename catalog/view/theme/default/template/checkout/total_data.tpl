<?php foreach($totals as $total) { ?>
    <tr class="total-info">
    	<td colspan="3" class="price"><b><?php echo $total['title']; ?>:</b></td>
    	<td class="total"><?php echo $total['text']; ?></td>
    </tr>
	<?php } ?>
