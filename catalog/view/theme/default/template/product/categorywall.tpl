<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php if ($thumb || $description) { ?>
      <div class="row">
          
        <?php if ($description) { ?>  
        <hr/>
        <?php if ($thumb) { ?>
        <div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
        <?php } ?>
        
                    
<!--
<?php if ($description) { ?>
        <div class="col-sm-10"><?php echo $description; ?></div>
        <?php } ?>
-->
          
<!--          Далі код скрити тексту-->
          
          <div class="mdvd_box mdvd_closeFullText">
            <div class="col-sm-10 mdvd_text"><?php echo $description; ?></div>
             
            <div class='mdvd_action'>

                <div class='btn-primery btn mdvd_closeFullText'><?php echo $hide_full_text; ?></div>
                <div class='btn-primery btn  mdvd_openFullText'><?php echo $show_full_text; ?></div>

            </div>
         </div>
           <?php } ?>         
          
<!--        Кінець коду скрити текст-->
          
      </div>
      <hr>
      <?php } ?>
        
      <?php if ($categories) { ?>
<!--      <h3><?php echo $text_refine; ?></h3>-->
        
            <div class="row" style="opacity: 1; display: block;margin-bottom: 0px;">
                <?php foreach ($categories as $category) { ?>
                    <?php if ($category['thumb']) { ?>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="product-thumb transition divCategoryList">
                                <div class="image"><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-responsive" /></a></div>
                                <div class="caption imageCategoryList">
                                    <h3><a style="text-decoration: none" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></h3>
                                </div> 
                            </div>
                        </div>
                    <?php } ?>
                <?php } ?>
            </div>
        
        <?php if ($category['children']) { ?>
            <h1>DF</h1>
        <?php } ?>
       <?php } ?>
<!--
        
      <?php if (count($categories) <= 5) { ?>
      <div class="row">
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>"/><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
      </div>
      <?php } else { ?>
      <div class="row">
        <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
-->
     
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>


<script> 

$(document).ready(function(){ 
//$(".rating").hide(); 
}); 

$( ".product-layout" ).hover(function() { 

$(this).find(".product-thumb").css({ 
boxShadow:" 0px 0px 10px rgba(16, 16, 16, 0.68)" /* Параметры тени */ 
}); 

$(this).find(".rating").removeClass("hideRating").addClass("showRating"); 

},function(){ 

$(this).find(".product-thumb").css({ 
boxShadow:" none"
}); 

$(this).find(".rating").removeClass("showRating").addClass("hideRating"); 

}); 

</script>

<!--Скріпт до откритие тексту-->
<script type="text/javascript">
$(document).ready(function (){
	$('.mdvd_action .mdvd_openFullText').click(function (){
		$(this).parents('.mdvd_box').removeClass('mdvd_closeFullText').addClass('mdvd_openFullText');
	});
	$('.mdvd_action .mdvd_closeFullText').click(function (){
		$(this).parents('.mdvd_box').removeClass('mdvd_openFullText').addClass('mdvd_closeFullText');
	});
});
</script>
<!---->