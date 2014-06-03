</div>

<div id="footer">
  <?php if ($informations) { ?>
  <div class="column">
    <li></li>
  </div>
  <div class="column btns">
    <h3></h3>
    <ul>
    <li><a href="http://m-vkusno.ru/index.php?route=product/testimonial">Отзывы</a></li>
    <li><a href="http://m-vkusno.ru/index.php?route=product/isitestimonial">Написать отзыв</a></li>
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
    </ul>



  </div>
  <?php } ?>

  <div class="column btns">
    <h3></h3>
    <ul>
    <li><a href="#">Партнеры</a></li>
    </ul>
  </div>

  <div class="column">
      <h3></h3>
      <ul>
        <li></li>
        <li></li>
        <li></li>
        <li>&copy; 2014 М-Ресторатор</li>
      </ul>
  </div>
</div>

<div id="powered"><?php echo $powered; ?></div>

</div>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-50865210-1', 'm-vkusno.ru');
  ga('send', 'pageview');

</script>
</body></html>