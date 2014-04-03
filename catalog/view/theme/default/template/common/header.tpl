<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
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

        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet/less" type="text/css" href="css/root.less" />
        <link rel="stylesheet" href="/css/bootstrap.min.css">
        <link rel="stylesheet" href="/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="/fonts/hagincaps/font.css">
        <link rel="stylesheet" type="text/css" href="/css/shape.css" />
        <link rel="stylesheet" type="text/css" href="/css/slider.css" />
        <link rel="stylesheet" type="text/css" href="/css/slider-theme.css" />
        <link rel="stylesheet" type="text/css" href="/css/slider-more.css" />
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script src="/js/vendor/bootstrap.min.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
        <link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
        <script src="/js/modernizr.custom.js"></script>
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
        <script type="text/javascript" src="/js/jquery.ba-cond.min.js"></script>
        <script type="text/javascript" src="/js/jquery.slitslider.js"></script>
        <script type="text/javascript" src="/js/jquery.transit.min.js"></script>
        <script type="text/javascript" src="/js/snap.svg-min.js"></script>
        <script type="text/javascript" src="/js/slider.js"></script>
        <script type="text/javascript" src="/js/hovers.js"></script>

        <script src="/js/main.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/common.js"></script>

        <noscript>
          <link rel="stylesheet" type="text/css" href="css/styleNoJS.css" />
        </noscript>

        <script src="/js/vendor/less-1.7.0.min.js"></script>

        <script type="text/javascript" charset="utf-8">
          less.env = "development";
          less.watch();
        </script>
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
        $(document).ready(function() {
        <?php foreach ($stores as $store) { ?>
        $('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
        <?php } ?>
        });
        //--></script>
        <?php } ?>
        <?php echo $google_analytics; ?>
</head>
<body>
  <div id="left-panel">
              <div id="left-panel">
        <?php if ($categories) { ?>
          <?php foreach ($categories as $category) { ?>
          <a class="parent" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
            <?php if ($category['children']) { ?>
              <?php for ($i = 0; $i < count($category['children']);) { ?>
                <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                <?php for (; $i < $j; $i++) { ?>
                <?php if (isset($category['children'][$i])) { ?>
                <a class="child" href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
                <?php } ?>
                <?php } ?>
               <?php } ?>
              <?php } ?>
            <?php } ?>
          <?php } ?>
      </div>
      </div>


<div id="box-container">

  <div id="header">
<!--    <?php if ($logo) { ?>
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
      <?php echo $text_shopping_cart; ?></a><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></div>-->
  </div>

<?php if ($categories) { ?>
<div id="menu">
  <ul>
    <li><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>
    <li><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a></li>
    <li><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>
    <li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a</li>
    <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
  </ul>
</div>
<?php } ?>
<?php if ($error) { ?>

    <div class="warning"><?php echo $error ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>

<?php } ?>
<div id="notification"></div>
