<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<style type="text/css">
	.payment .buttons{
		display: none;
	}
</style>
<div id="box-content"><?php echo $content_top; ?>
	<div class="box-breadcrumb">
		  <i class="fa fa-sitemap fa-icon"></i>
		<?php foreach($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a
				href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	<h1 class="has-icon"><i class="fa fa-check-circle-o"></i> <?php echo $heading_title; ?></h1>

	<div class="checkout">
		<div id="checkout">
			<div class="checkout-content" style="display: block">
				<form id="checkout_form" onsubmit="return false;">
					<div class="left block-left checkout-form">
						<table class="form table">
							<tr>
								<td><span class="required">*</span> <?php echo $entry_firstname; ?></td>
								<td><input type="text" name="firstname" value="<?php echo $firstname?>"
										   class="large-field"/></td>
							</tr>
							<tr style="display:none">
								<td><span class="required">*</span> <?php echo $entry_lastname; ?></td>
								<td><input type="text" name="lastname" value="Zakaz"
										   class="large-field"/></td>
							</tr>
							<tr>
								<td><span class="required">*</span> <?php echo $entry_telephone; ?></td>
								<td><input type="text" name="telephone" value="<?php echo $telephone?>"
										   class="large-field"/></td>
							</tr>
							<tr>
								<td> <?php echo $entry_address_1; ?></td>
								<td><input type="text" name="address_1" value="<?php echo $address_1?>"
										   class="large-field"/></td>
							</tr>
							<tr style="display:none">
								<td><span class="required">*</span> <?php echo $entry_city; ?></td>
								<td><input type="text" name="city" value="Оренбург" class="large-field" /></td>
  							</tr>
							<tr style="display:none">
								<td><span class="required">*</span> <?php echo $entry_postcode; ?></td>
								<td><input type="text" name="postcode" value="460000" class="large-field" /></td>
  							</tr>
							<tr style="display:none">
								<td><span class="required">*</span> <?php echo $entry_country; ?></td>
								<td>
								    <input name="country_id" class="large-field" value="7">
								  </td>
							</tr>
							<tr style="display:none">
							  <td><span class="required">*</span> <?php echo $entry_zone; ?></td>
							  <td><input name="zone_id" class="large-field" value="7"></td>
							</tr>
							<tr style="display:none">
								<td><span class="required">*</span> <?php echo $entry_email; ?></td>
								<td><input type="text" name="email" value="root@webscapes.ru" class="large-field"/>
								</td>
							</tr>

							<tr>
								<td><?php echo $column_comment; ?>:</td>
								<td><textarea rows="6" name="comment"><?php echo $comment?></textarea></td>
							</tr>
							<tr>
								<td>
									<a class="btn-send btn-back" href="http://m-vkusno.ru/index.php?route=checkout/cart">
										Изменить</i>
									</a>
								</td>
								<td>
									<a id="confirm" class="btn-send"><span><?php echo $button_confirm?></span> </a>
								</td>
							</tr>
						</table>
					</div>
					<div class="block-left checkout-list">
           			 <table class="checkout-table">
								<thead>
								<tr>
									<td class="image"><?php echo $column_image; ?></td>
									<td class="name">Название</td>
									<td class="quantity"><?php echo $column_quantity; ?></td>
									<td class="price"><?php echo $column_price; ?></td>
								</tr>
								</thead>
								<tbody>
								<?php foreach($products as $product) { ?>
								<tr>
									<td class="image"><?php if ($product['thumb']) { ?>
									  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
									  <?php } ?>
									</td>
									<td class="name">
										<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
										<?php foreach($product['option'] as $option) { ?>
											<br/>
											&nbsp;
											<small> - <?php echo $option['name']; ?>
												: <?php echo $option['value']; ?></small>
											<?php } ?></td>
									<td class="quantity"><?php echo $product['quantity']; ?></td>
									<td class="price"><?php echo $product['price_text']; ?></td>

								</tr>
									<?php } ?>
								<?php foreach($vouchers as $voucher) { ?>
								<tr>
									<td class="image"></td>
									<td class="name"><?php echo $voucher['description']; ?></td>
									<td class="model"></td>
									<td class="quantity">1</td>
									<td class="price"><?php echo $voucher['amount']; ?></td>

								</tr>
									<?php } ?>
								</tbody>
								<tbody id="total_data">
									<?php echo $total_data?>
								</tbody>
							</table>
						</div>
					<div class="right" style="display:none">
						<div class="shipping-content" style="display: block">

							<?php if(count($shipping_methods) > 1) { ?>
							<p><?php echo $text_shipping_method; ?></p>
							<table class="form">
								<?php foreach($shipping_methods as $shipping_method) { ?>
								<tr>
									<td colspan="3"><b><?php echo $shipping_method['title']; ?></b></td>
								</tr>
								<?php if(!$shipping_method['error']) { ?>
									<?php foreach($shipping_method['quote'] as $quote) { ?>
										<tr>
											<td style="width: 1px;"><?php if($quote['code'] == $shipping_code || !$shipping_code) { ?>
												<?php $shipping_code = $quote['code']; ?>
												<input type="radio" name="shipping_method"
													   value="<?php echo $quote['code']; ?>"
													   id="<?php echo $quote['code']; ?>" checked="checked"/>
												<?php } else { ?>
												<input type="radio" name="shipping_method"
													   value="<?php echo $quote['code']; ?>"
													   id="<?php echo $quote['code']; ?>"/>
												<?php } ?></td>
											<td><label
													for="<?php echo $quote['code']; ?>"><?php echo $quote['title']; ?></label>
											</td>
											<td style="text-align: right;"><label
													for="<?php echo $quote['code']; ?>"><?php echo $quote['text']; ?></label>
											</td>
										</tr>
										<?php } ?>
									<?php } else { ?>
									<tr>
										<td colspan="3">
											<div class="error"><?php echo $shipping_method['error']; ?></div>
										</td>
									</tr>
									<?php } ?>
								<?php } ?>
							</table>
							<?php } else if ($shipping_methods) { ?>
							<?php $shipping_method = array_shift($shipping_methods);?>
								<p><?php echo $text_shipping_method; ?></p>
							<table class="form">
								<tr>
									<td colspan="3"><b><?php echo $shipping_method['title']; ?></b></td>
								<?php foreach($shipping_method['quote'] as $quote) { ?>
									<td><label><?php echo $quote['title']; ?></label></td>
									<td style="text-align: right;"><label><?php echo $quote['text']; ?></label></td>
								<?php }?>
								</tr>
								</table>
							<?php } else { ?>

							<?php }?>
						</div>
						<div class="payment-content" style="display: block">
							<?php echo $payment_data?>
						</div>
					</div>
					<div style="clear: both;">

					<?php if ($text_agree) { ?>
					<div class="buttons" style="display:none">
					  <div class="right"><?php echo $text_agree; ?>
					  	<input name="agree" class="large-field" value="1">
					  </div>
					</div>
						<script type="text/javascript"><!--

						//--></script>
					<?php }?>

					</div>
				</form>
			</div>
		</div>
	</div>

<?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$('#checkout_form select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#checkout_form select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#shipping-postcode-required').show();
			} else {
				$('#shipping-postcode-required').hide();
			}

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] != undefined) {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}

	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('#checkout_form select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#checkout_form select[name=\'country_id\']').trigger('change');


	$('#confirm').live('click', function() {
		$.ajax({
			url: 'index.php?route=checkout/checkout',
			type: 'post',
			data: $('#checkout_form').serialize(),
			dataType: 'json',
			beforeSend: function() {
				$('#confirm').bind('click', false);
				$('#confirm').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
				$('#confirm').html('Подождите несколько секунд...');
			},
			complete: function() {
				$('#confirm').unbind('click', false);
				console.log('cmpl');
				$('.wait').remove();
			},
			error: function(){
				console.log('err');
			},
			success: function(json) {
			//	$('.warning').remove();
			//	$('.error').remove();
				console.log('sccl');
				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json.errors) {
					for (var key in json.errors) {
						$('#checkout .checkout-content :input[name=\'' + key + '\']').tooltipster({ animation: 'swing', delay: 1000, position: 'right',
          				theme: 'tip-error', trigger: 'custom', content: json.errors[key], autoClose: true
        				});

						$('#checkout .checkout-content :input[name=\'' + key + '\']').tooltipster('show');
					}

				} else {
					if (json.result = "success") {
						var confirm_btn = $('#button-confirm');
						if (!confirm_btn){
							confirm_btn =$('.payment . buttons input.button')
						}
						confirm_btn.trigger('click');
					}
				}
			}
		});
	});

	$('input[name=payment_method]').live('change', function() {
		$(".checkout-product").mask();
		$.ajax({
			url: 'index.php?route=checkout/checkout/change_payment',
			type: 'post',
			data: 'payment_code='+$("input[name=payment_method]:checked").val(),
			dataType: 'json',
			success: function(json) {
				 if (json.payment){
					 $(".payment").html(json.payment);
				 }
				 $(".checkout-product").unmask();
			}
		})
	});

	$('input[name=shipping_method]').live('change', function() {
		$(".checkout-product").mask();
		$.ajax({
			url: 'index.php?route=checkout/checkout/change_shipping',
			type: 'post',
			data: 'shipping_method='+$("input[name=shipping_method]:checked").val(),
			dataType: 'json',
			success: function(json) {
				 $('#total_data').html(json['totals_data']);
				 $('.payment-content').html(json['payment_data']);
				 $(".checkout-product").unmask();
			}
		})
	});

	//--></script>
<?php echo $footer; ?>
