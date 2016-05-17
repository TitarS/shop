<footer>
  <div class="container">
    <div class="row">
      <?php if ($informations) { ?>




  <div class="col-sm-3">
        <h5><i class="fa fa-book"></i><?php echo ' ' . $text_contact; ?></h5>
        <ul class="list-unstyled">
          <li><i class="fa fa-map-marker"></i><a href="<?php echo $local3; ?>"><?php echo ' ' . $text_local3; ?></a></li>
          <li><i class="fa fa-phone"></i><a href="tel:+380672244887">  +38 (067) 24 48 87</a></li>
          <li><i class="fa fa-phone"></i><a href="tel:+380638798777">  +38 (063) 879 87 77</a></li>
          <li><i class="fa fa-envelope"></i><a href="mailto:solovcom@ukr.net">  solovcom@ukr.net</a></li>
          <li><i class="fa fa-clock-o"></i><a href="<?php echo $local3; ?>"> пн - сб 10:00 - 19:00</a></li>
        </ul>
      </div>

<!--
      <div class="col-sm-3">
        <h5><?php //echo $text_contact; ?></h5>
        <ul class="list-unstyled">
          <li><a class="footer-addresses" href="<?php //echo $local3; ?>"><?php //echo $text_local3; ?></a></li>
          <li><a class="p-ks" href="tel:+380672244887">(+38) 067 224 48 87</a></li>
          <li><a class="p-life" href="tel:+380638798777">(+38) 063 879 87 77</a></li>
          <li><a class="email" href="mailto:solovcom@ukr.net">solovcom@ukr.net</a></li>
        </ul>
      </div>
-->



  <!--    <div class="col-sm-3">
        <h5><?php //echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php //echo $account; ?>"><?php //echo $text_account; ?></a></li>
          <li><a href="<?php //echo $order; ?>"><?php //echo $text_order; ?></a></li>
          <li><a href="<?php //echo $wishlist; ?>"><?php //echo $text_wishlist; ?></a></li>
          <li><a href="<?php //echo $newsletter; ?>"><?php //echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    -->

    

      <?php } ?>
      <div class="col-sm-3">
        <h5><i class="fa fa-users"></i><?php echo ' ' . $text_social; ?></h5>
        <ul class="list-unstyled">
            <li><a href="http://vk.com/id350258872"><i class="fa fa-vk"></i> Vkontakte</a></li>
            <li><a href="https://www.facebook.com/mdvdcomua"><i class="fa fa-facebook"></i> Facebook</a></li>
            <li><a href="https://plus.google.com/109060978109985895457/about"><i class="fa fa-google"></i> Google+</a></li>
            <li><a href="https://www.instagram.com/mdvdcomua/"><i class="fa fa-instagram"></i> Instagram</a></li>


         <!-- <li><a href="<?php //echo $contact; ?>"><?php //echo $text_contact; ?></a></li>
          <li><a href="<?php //echo $return; ?>"><?php //echo $text_return; ?></a></li>
          <li><a href="<?php //echo $sitemap; ?>"><?php //echo $text_sitemap; ?></a></li>-->
        </ul>
      </div>


      
      <div class="col-sm-3">
        <h5><i class="fa fa-support"></i><?php echo ' ' . $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
         <!-- <li><a href="<?php //echo $voucher; ?>"><?php //echo $text_voucher; ?></a></li>-->
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>

      <div class="col-sm-3">
        <h5><i class="fa fa-info-circle"></i><?php echo ' ' . $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>




    </div>
   <br>
<!--
    <hr>
    <p><?php //echo $powered; ?></p>
-->


  </div>
</footer>


            <?php if($back_to_top) { ?>
            <a href="#0" class="cd-top">Top</a>
            <?php } ?>
            
</body></html>