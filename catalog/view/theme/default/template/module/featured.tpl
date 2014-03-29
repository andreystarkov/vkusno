<div class="box-items">
  <div class="heading"><?php echo $heading_title; ?></div>
  <div class="body no-padding">
    <div class="box-item">
      <?php foreach ($products as $product) { ?>
      <div>
        <?php if ($product['thumb']) { ?>
        <div class="image">
          <a href="<?php echo $product['href']; ?>">
            <div class="img-thumb" style="background-image:url(<?php echo $product['thumb']; ?>)" >
                      <div class="cart"><div class="btn-cart" onclick="addToCart('<?php echo $product['product_id']; ?>');" />В корзину</div></div>
            </div></a></div>
        <?php } ?>
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>

      </div>
      <?php } ?>
    </div>
  </div>
</div>
