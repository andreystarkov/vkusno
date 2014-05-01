<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="box-content"><?php echo $content_top; ?>
  <div class="box-breadcrumb">
    <i class="fa fa-sitemap fa-icon"></i>
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <?php if ($thumb || $description) { ?>
  <div class="category-info">
    <?php if ($thumb) { ?>
    <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
    <?php } ?>
    <?php if ($description) { ?>
    <?php echo $description; ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php if ($categories) { ?>
    <h3><?php echo $text_refine; ?></h3>
    <div class="category-list">

      <?php foreach ($categories as $category) { ?>
      <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      <?php } ?>

  </div>
  <?php } ?>
  <?php if ($products) { ?>
  <div class="product-filter inactive">
    <i class="fa fa-sort-alpha-asc tip" title="Параметры сортировки и отображения товаров."></i>
    <div class="limit">
      <b><?php echo $text_limit; ?></b>
      <select onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>

    </div>
    <div class="sort">

      <b><?php echo $text_sort; ?></b>
      <select onchange="location = this.value;">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
  </div>

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
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } ?>
  <?php if (!$categories && !$products) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>

<?php echo $footer; ?>