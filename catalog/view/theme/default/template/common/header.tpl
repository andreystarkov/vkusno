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
        <link rel="stylesheet" type="text/css" href="/css/fullwidth-slider.css" />
        <link rel="stylesheet" type="text/css" href="/css/tooltipster.css" />
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
        <script type="text/javascript" src="/js/jquery.tooltipster.min.js"></script>
        <script type="text/javascript" src="/js/snap.svg-min.js"></script>
        <script type="text/javascript" src="/js/slider.js"></script>
        <script type="text/javascript" src="/js/hovers.js"></script>

        <script src="/js/main.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/common.js"></script>

        <noscript>
          <link rel="stylesheet" type="text/css" href="css/styleNoJS.css" />
        </noscript>

        <script src="/js/vendor/less-1.7.0.min.js"></script>

        <script type="text/javascript" src="/js/skel.min.js"></script>
        <script type="text/javascript" src="/js/skel-panels.min.js"></script>
        <script type="text/javascript" src="/js/skel-config.js"></script>

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
        <? if(!empty($this->request->get['path'])) { $paths = explode('_', $this->request->get['path']); } ?>
        <?php echo $google_analytics; ?>

        <script>
          $(function(){

              $('.tooltip').tooltipster();

              $('.box-child').hide();
              $('.box-sub-child').hide();

              $('.child').each(function(){
                $(this).append('<b class="fa this fa-angle-double-right"></b>');
              });

              function toggleNavSubCategory(obj){
                var link = $('.sub-parent', obj.parent());
                var id = link.attr('data-id');
                var box = '.sub-child-'+id;
                var sub = '<? echo $paths[1]; ?>';

                 if(link.hasClass('opened')){
                  $('i', obj).transition({rotate: '0deg'}, 600);
                  $('.sub-parent').removeClass('opened');
                  $('#left-panel .logo').transition({height: '242px'});
                  $(box).slideUp();
                } else {
                  $('i', obj).transition({rotate: '180deg'}, 600);
                  $('.sub-parent').removeClass('opened');
                  $('.box-sub-child').slideUp(200);
                  link.addClass('opened');
                  if (sub == id) { link.addClass('active'); }
                  $('#left-panel .logo').transition({height: '0px'}, 100);
                  $(box).slideDown(500);
               }
              }

              function toggleNavCategory(obj){
                  var id = obj.attr('data-id');
                  var selector = '.box-child-'+id;
                  if(obj.hasClass('opened')){
                    $('.sub-parent').removeClass('opened');
                    $('.parent').removeClass('opened');
                    $('#left-panel .logo').transition({height: '242px'});
                    $('.box-child').slideUp();
                  } else {
                    $('.parent').removeClass('opened');
                    $('.box-child').slideUp();
                    $('#left-panel .logo').transition({height: '242px'});
                    obj.addClass('opened');
                    $(selector).slideToggle();
                 }
              }


          $('#left-panel .parent').click(function(){
                toggleNavCategory($(this));
          });

              $('#left-panel .btn-dropdown').click(function(){
                  toggleNavSubCategory($(this));
            });

              <? if(!empty($paths[0])){ ?>
                  var selector = '.parent-'+<? echo $paths[0]; ?>;
                  toggleNavCategory($(selector));

                  var selector1 = '.id-'+<? echo $paths[1]; ?>;
                  if( $(selector1).attr('data-id') ==  <? echo $paths[1]; ?> ) {
                    $(selector1).addClass('active');
             //         toggleNavSubCategory($(selector1));
                  }

              <? } ?>
              $('.hover-info').tooltipster({
                 animation: 'swing',
                 delay: 300,
                 position: 'bottom',
                 theme: 'tooltipster-punk',
                 touchDevices: false,
                 trigger: 'hover'
              });
              $('.tip-info').tooltipster({
                 animation: 'fade',
                 delay: 200,
                 theme: 'tooltipster-noir',
                 touchDevices: false,
                 trigger: 'hover'
              });
            });
        </script>
</head>
<body>

<?php if ($categories) { ?>
<div id="menu">
  <ul>
        <li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a</li>
    <li><a href="<?php echo $home; ?>"><i class="fa fa-home"></i></a></li>
    <li><a href="<?php echo $shopping_cart; ?>"><i class="fa fa-shopping-cart"></i></a></li>
    <li><a href="<?php echo $account; ?>"><i class="fa fa-user"></i></a></li>

  </ul>
</div>
<?php } ?>
    <div id="left-panel" id="nav-main">
      <div class="logo tip-info" title="sadasdsadsadsa" ></div>
      <?php if ($categories) {
        ?>
        <?php foreach ($categories as $category) { ?>
        <div class="parent item parent-<? echo $category['id']; ?>" data-id="<? echo $category['id']; ?>"><?php echo $category['name']; ?></div>
        <!--  href="<?php echo $category['href']; ?>" -->
          <?php if ($category['children']) { ?>
            <?php for ($i = 0; $i < count($category['children']);) { ?>
              <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
              <ul class="box-child level-1 box-child-<?php echo $category['children'][$i]['parent_id']; ?>">
              <?php for (; $i < $j; $i++) { ?>
              <?php if (isset($category['children'][$i])) { ?>
              <? if( $category['children'][$i]['children'] ) { $cls = "sub-parent"; } else { $cls = ""; } ?>

              <li><a data-id="<?php echo $category['children'][$i]['id']; ?>" data-parent="<?php echo $category['children'][$i]['parent_id']; ?>" class="child item <? echo $cls; ?> id-<?php echo $category['children'][$i]['id']; ?> child-<?php echo $category['children'][$i]['parent_id']; ?>" href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
             <?php if( $category['children'][$i]['children'] ) { ?>
              <ul class="box-child level-2 box-sub-child sub-child-<? echo $category['children'][$i]['id']; ?>">
               <?php foreach( $category['children'][$i]['children'] as $menu3item ) { ?>
                  <li><a class="item child child-<?echo $category['children'][$i]['id']; ?>" href="<?php echo $menu3item['href']; ?>"><?php echo $menu3item['name']; ?></a></li>
               <?php } ?>
              </ul></li>
           <?php } ?>

              <?php } ?>
              <?php } ?>
            </ul>
             <?php } ?>
            <?php } ?>
          <?php } ?>
        <?php } ?>
    </div>

  <div id="slider-wrapper">
     <div id="nice-slider" class="nice-slider nice-slider-fullwidth">
      <ul class="itemwrap">
        <li class="current"><img src="/images/1.jpg" alt="img06"/></li>
        <li><img src="/images/2.jpg" alt="img07"/></li>
        <li><img src="/images/2.jpg" alt="img08"/></li>
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
