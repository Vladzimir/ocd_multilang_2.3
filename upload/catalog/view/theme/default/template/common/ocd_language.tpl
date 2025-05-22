<?php if (count($languages) > 1) { ?>
<div id="ocd_multilang" class="pull-left">
    <div class="btn-group">
        <button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
            <?php foreach ($languages as $language) { ?>
            <?php if ($language['code'] == $code) { ?>
            <img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>">
            <?php } ?>
            <?php } ?>
            <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_language; ?></span>
            <i class="fa fa-caret-down"></i></button>
        <ul class="dropdown-menu">
            <?php foreach ($languages as $language) { ?>
            <li>
                <a data-href="<?php echo $language['href_lang']; ?>" class="btn btn-link btn-block" href="<?php echo $language['href']; ?>">
                    <img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>"
                         title="<?php echo $language['name']; ?>"/>
                    <?php echo $language['name']; ?></a></li>
            <?php } ?>
        </ul>
    </div>
    <script>
      $('#ocd_multilang a').each(function (e) {
        $(this).attr('href', $(this).attr('data-href'));
      });
    </script>
</div>
<?php } ?>