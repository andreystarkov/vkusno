<!DOCTYPE html>
<html>
<meta charset="UTF-8" />
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>" />
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>" />
    <?php } ?>
    <?php if ($icon) { ?>
    <link href="<?php echo $icon; ?>" rel="icon" />
    <?php } ?>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
    <?php } ?>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />

    <?php foreach ($styles as $style) { ?>
    <link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
    <?php } ?>

    <!-- <link rel="stylesheet" href="css/main.css">-->

    <link rel="stylesheet" href="css/root.css">
    <link rel="stylesheet/less" type="text/css" href="css/root.less" />
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/fonts/hagincaps/font.css">
    <link rel="stylesheet" type="text/css" href="/css/fullwidth-slider.css" />
    <link rel="stylesheet" type="text/css" href="/css/tooltipster.css" />
    <link rel="stylesheet" type="text/css" href="/css/nanoscroller.css" />

    <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700,400italic,700italic&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="/js/vendor/bootstrap.min.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
    <link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />

    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <script type="text/javascript" src="/js/vendor/jquery.ba-cond.min.js"></script>
    <script type="text/javascript" src="/js/vendor/jquery.slitslider.js"></script>
    <script type="text/javascript" src="/js/vendor/jquery.transit.min.js"></script>
    <script type="text/javascript" src="/js/vendor/jquery.tooltipster.min.js"></script>
    <script type="text/javascript" src="/js/vendor/jquery.nanoscroller.min.js"></script>
    <script type="text/javascript" src="/js/vendor/snap.svg-min.js"></script>
    <script type="text/javascript" src="/js/vendor/masonry.pkgd.min.js"></script>
    <script type="text/javascript" src="/js/slider.js"></script>
    <script type="text/javascript" src="/js/hovers.js"></script>


    <script src="/js/main.js"></script>

    <script type="text/javascript" src="catalog/view/javascript/common.js"></script>

    <noscript>
      <link rel="stylesheet" type="text/css" href="css/styleNoJS.css" />
    </noscript>

    <script type="text/javascript" src="/js/vendor/skel.min.js"></script>
    <script type="text/javascript" src="/js/vendor/skel-panels.min.js"></script>
    <script type="text/javascript" src="/js/skel-config.js"></script>


    <!--<script src="/js/vendor/less-1.7.0.min.js"></script>-->
    <?php foreach ($scripts as $script) { ?>
    <script type="text/javascript" src="<?php echo $script; ?>"></script>
    <?php } ?>
    <!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
    <![endif]-->
    <!--[if lt IE 7]>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
    <script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
    <script type="text/javascript">
    DD_belatedPNG.fix('#logo img');
    </script>
    <![endif]-->
    <?php if ($stores) { ?>
    <script type="text/javascript"><!--
    /*
    $(document).ready(function() {
    <?php foreach ($stores as $store) { ?>
    $('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
    <?php } ?>
    }); */
    //--></script>
    <?php } ?>
    <? if(!empty($this->request->get['path'])) { $paths = explode('_', $this->request->get['path']); } ?>
    <?php echo $google_analytics; ?>

    <script>
      $(function(){

          <? if(!empty($paths[0])){ ?>
              var selector = '.parent-'+<? echo $paths[0]; ?>;
              toggleNavCategory($(selector));

              var selector1 = '.id-'+<? echo $paths[1]; ?>;
              if( $(selector1).attr('data-id') ==  <? echo $paths[1]; ?> ) {
                $(selector1).addClass('active');
                 toggleNavSubCategory($(selector1));
              }

          <? } else { ?>
          //      toggleNavCategory($('.parent-84'));
          <? } ?>

          <?  $cart_contents = $this->cart->countProducts();
              if ($cart_contents > 0){
              ?>
                $('.btn-cart-icon').addClass('cart-full');
              <?
          }
          ?>
        });
    </script>

    <script type="text/javascript" src="/js/engine.js"></script>
    <script src="/js/vendor/modernizr.custom.js"></script>
</head>
<body>

    <div class="mini-cart-holder" id="mini-cart">
    <div class="btn-mini-cart btn-cart-icon tip-icons" id="btn-cart-popup"><i class="fa-shopping-cart fa"></i> <span><? echo $this->cart->countProducts(); ?></span> <b>товаров в корзине</b> <i class="fa fa-angle-right"></i> </div>
    <div class="cart-box">
       <?php echo $cart; ?>
    </div>
    </div>

<?php if ($categories) { ?>

<?php } ?>
    <div id="left-panel" id="nav-main">
      <div class="logo"><a href="index.php"></a></div>
      <div id="btn-full-nav"><i class="fa fa-angle-left"></i> </div>
      <?php if ($categories) {
        ?>
        <div class="nav-items">
         <div class="nav-icons">
              <a class="tip" title="Отзывы" href="http://m-vkusno.ru/index.php?route=product/testimonial"><i class="fa fa-comment-o"></i></a>
              <a class="tip" title="Оставить отзыв" href="http://m-vkusno.ru/index.php?route=product/isitestimonial"><i class="fa fa-pencil-square-o"></i></a>
              <a class="tip" title="Информация о доставке" href="http://m-vkusno.ru/index.php?route=information/information&information_id=7"><i class="fa fa-info"></i></a>
              <a class="tip" title="Открыть корзину" href="<?php echo $shopping_cart; ?>">
                 <i class="fa-shopping-cart fa"></i> <span></span>
              </a>
            </div>
        <?php foreach ($categories as $category) { ?>


        <div class="parent item parent-<? echo $category['id']; ?>" data-id="<? echo $category['id']; ?>"><?php echo $category['name']; ?></div>

          <?php if ($category['children']) { ?>
            <?php for ($i = 0; $i < count($category['children']);) { ?>
              <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>

              <ul class="box-child level-1 box-child-<?php echo $category['children'][$i]['parent_id']; ?>">

              <?php for (; $i < $j; $i++) { ?>
                <?php if (isset($category['children'][$i])) { ?>
                  <? if( $category['children'][$i]['children'] ) { $cls = "sub-parent"; } else { $cls = ""; } ?>

                  <li>
                    <a data-id="<?php echo $category['children'][$i]['id']; ?>" data-parent="<?php echo $category['children'][$i]['parent_id']; ?>"
                      class="child item <? echo $cls; ?> id-<?php echo $category['children'] [$i]['id']; ?> child-<?php echo $category['children'][$i]['parent_id']; ?>"
                      href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>

                    <?php if( $category['children'][$i]['children'] ) { ?>
                      <ul class="box-child level-2 box-sub-child sub-child-<? echo $category['children'][$i]['id']; ?>">
                        <?php foreach( $category['children'][$i]['children'] as $menu3item ) { ?>
                          <li><a class="item child child-<?echo $category['children'][$i]['id']; ?>"
                          href="<?php echo $menu3item['href']; ?>"><?php echo $menu3item['name']; ?></a></li>
                        <?php } ?>
                      </ul>
                   <?php } ?>
                 </li>

                <?php } ?>
              <?php } ?>
              </ul>
             <?php } ?>
            <?php } ?>
          <?php } ?>
                  <div id="phone">
          <span>наш телефон</span>
          <p>6-0000-6</p>
          <i>с 12:00 до 00:00</i>
        </div>
                </div>
        <?php } ?>

    </div>

  <div id="slider-wrapper">

      <div class="slider-caption caption-current" id="caption-4">
        <h3>Стейк Шампань.</h3>
        <i>Говяжья вырезка, фисташки, шампанское, рис,масло сливочное, ветчина пармская, грибы вешенки, красный лук, микс-салат.</i>
       <div class="btn-cart-round"><b class="fa fa-shopping-cart"></b></div>
      </div>

      <div class="slider-caption" id="caption-2">
        <h3>Гриль соте Алабиф.</h3>
        <i>Вырезка говяжья, перец "Огонек", томаты черри, цукини, шампиньоны, специи, сыр Пармезан, масло оливковое, микс-салат.</i>
         <div class="btn-cart-round"><b class="fa fa-shopping-cart"></b></div>
      </div>

      <div class="slider-caption" id="caption-3">
        <h3>Морской бродет из гребешков.</h3>
        <i>Лисички, шампиньоны, гребешки, морковь, корень сельдерея, лук-порей, лайм, специи, масло оливковое.</i>
       <div class="btn-cart-round"><b class="fa fa-shopping-cart"></b></div>
      </div>

     <div id="nice-slider" class="nice-slider nice-slider-fullwidth">
      <ul class="itemwrap">
        <li data-caption="caption-4" class="caption-4 current"><img src="/images/7.jpg" alt="img07"/></li>
        <li data-caption="caption-2" class="caption-2"><img src="/images/8.jpg" alt="img08"/></li>
        <li data-caption="caption-3" class="caption-3"><img src="/images/slider/brodet.jpg" alt="img08"/></li>
      </ul>
      <nav>
        <a class="prev" href="#"><i class="fa fa-angle-left"></i></a>
        <a class="next" href="#"><i class="fa fa-angle-right"></i></a>
      </nav>
    </div>
  </div>

<div id="box-container">

<!--   <div id="header">
   <?php if ($logo) { ?>
    <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
    <?php } ?>
    <?php echo $language; ?>
    <?php echo $currency; ?>
    <?php echo $cart; ?>
    <div id="search">
      <div class="button-search"></div>
      <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
    </div>
    <div id="welcome">
      <?php if (!$logged) { ?>
      <?php echo $text_welcome; ?>
      <?php } else { ?>
      <?php echo $text_logged; ?>
      <?php } ?>
    </div>
    <div class="links"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a>
      <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a><a href="<?php echo $shopping_cart; ?>">
      <?php echo $text_shopping_cart; ?></a><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></div>
  </div>-->

<?php if ($error) { ?>

    <div class="warning"><?php echo $error ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>

<?php } ?>
<div id="notification"></div>
