<div class="box-content">
  <div class="heading"><?php echo $heading_title; ?></div>
    <div class="body no-padding">
      <div class="box-item">
      <?php foreach ($products as $product) { ?>
        <div class="boxy">
          <?php if ( empty($product['thumb']) ) { $imgThumb = "/image/no.jpg"; } else { $imgThumb = $product['thumb']; } ?>
            <div class="image">
                <div class="img-thumb" style="background-image:url(<?php echo $imgThumb; ?>)" >
                  <div class="cart tip-description" title="<b><?php echo $product['name']; ?></b><? echo $product['description']; ?>">
                    <div class="price"><?php echo $product['price']; ?></div>
                    <div class="btn-cart tip-addtocart" onclick="addToCart('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> В корзину</div>
                    <a class="item-link" href="<?php echo $product['href']; ?>"><i class="fa fa-search"></i></a>
                  </div>
                </div>
            </div>
        <div class="name"><?php echo $product['name']; ?></div>
        </div>
      <?php } ?>
      </div>

    </div>
  </div>
</div>
