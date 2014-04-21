
<?php if ($news) { ?>
<?php if($box) { ?>


			<?php if($customtitle) { ?>
				<?php echo "<div class='heading'>".$customtitle."</div>"; ?>
			<?php } ?>

		<div class="box-newsfeed">
		<?php foreach ($news as $news_story) { ?>
			<div class="news-item">
				<a class="go" href="<?php echo $news_story['href']; ?>">

				<span class="date"><?php echo $news_story['posted']; ?></span>
				<?php if ($show_headline) { ?>
					<h4><?php echo $news_story['title']; ?></h4>
				<?php } ?>
				<?php echo $news_story['description']; ?> .. <br />

				</a>
			</div>
		<?php } ?>
		<?php if($showbutton) { ?>
			<div style="text-align:right;">
				<a href="<?php echo $newslist; ?>" class="button"><span><?php echo $buttonlist; ?></span></a>
			</div>
		<?php } ?>
		</div>

<?php } else { ?>

		<?php foreach ($news as $news_story) { ?>
			<div class="box-news">
				<?php if ($show_headline) { ?>
					<h4><?php echo $news_story['title']; ?></h4>
				<?php } ?>
				<?php echo $news_story['description']; ?> .. <br />
				<a href="<?php echo $news_story['href']; ?>"> <?php echo $text_more; ?></a>
				</p>
				<a href="<?php echo $news_story['href']; ?>"><img src="catalog/view/theme/default/image/message-news.png" alt="" /></a>
				<span><b><?php echo $text_posted; ?></b> <?php echo $news_story['posted']; ?></span>
			</div>
		<?php } ?>
		<?php if($showbutton) { ?>
			<div style="text-align:right;">
				<a href="<?php echo $newslist; ?>" class="button"><span><?php echo $buttonlist; ?></span></a>
			</div>
		<?php } ?>

<?php } ?>
<?php } ?>