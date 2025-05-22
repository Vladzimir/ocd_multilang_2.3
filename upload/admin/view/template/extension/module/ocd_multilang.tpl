<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-ocd-multilang" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary">
                    <i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
            </div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php }?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php }?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-ocd-multilang" class="form-horizontal">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
                        <li><a href="#tab-support" data-toggle="tab"><?php echo $tab_support; ?></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-data">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-title"><span data-toggle="tooltip" title="<?php echo $help_hreflang; ?>"><?php echo $entry_hreflang; ?></span></label>
                                <div class="col-sm-10">
                                    <?php foreach ($languages as $language) { ?>
                                    <div class="input-group">
										<span class="input-group-addon">
											<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>"/>
										</span>
                                        <input type="text" class="form-control" name="ocd_multilang_code[<?php echo $language['language_id']; ?>]" id="input-hreflang"
                                               value="<?php echo $ocd_multilang_code ? $ocd_multilang_code[$language['language_id']] : ''; ?>"/>
                                        <?php if ($error_code) { ?>
                                        <div class="text-danger"><?php echo $error_code[$language['language_id']]; ?></div>
                                        <?php }?>
                                    </div>
                                    <?php }?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-language"><?php echo $entry_language; ?></label>
                                <div class="col-sm-10">
                                    <select name="ocd_multilang_language" id="input-language" class="form-control">
                                        <?php foreach ($languages as $language) { ?>
                                        <?php if($language['language_id'] == $ocd_multilang_language) { ?>
                                        <option value="<?php echo $language['language_id']; ?>" selected="selected"><?php echo $language['name']; ?></option>
                                        <?php }else{ ?>
                                        <option value="<?php echo $language['language_id']; ?>"><?php echo $language['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                    <?php if ($error_language) { ?>
                                    <div class="text-danger"><?php echo $error_language; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div id="content-language">
                                <ul class="nav nav-tabs">
                                    <?php foreach ($languages as $language) { ?>
                                    <li>
                                        <a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>"/> <?php echo $language['name']; ?>
                                        </a></li>
                                    <?php } ?>
                                </ul>
                                <div class="tab-content">
                                    <?php foreach ($languages as $language) { ?>
                                    <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" for="input-meta-title[<?php echo $language['language_id']; ?>]"><?php echo $entry_meta_title; ?></label>
                                            <div class="col-sm-10">
                                                <input type="text" name="ocd_multilang_data[<?php echo $language['language_id']; ?>][meta_title]" value="<?php echo isset($ocd_multilang_data[$language['language_id']]) ? $ocd_multilang_data[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title[<?php echo $language['language_id']; ?>]" class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                                            <div class="col-sm-10">
                                                <textarea name="ocd_multilang_data[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($ocd_multilang_data[$language['language_id']]) ? $ocd_multilang_data[$language['language_id']]['meta_description'] : ''; ?></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                                            <div class="col-sm-10">
                                                <textarea name="ocd_multilang_data[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($ocd_multilang_data[$language['language_id']]) ? $ocd_multilang_data[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" for="input-address<?php echo $language['language_id']; ?>"><?php echo $entry_address; ?></label>
                                            <div class="col-sm-10">
                                                <textarea name="ocd_multilang_data[<?php echo $language['language_id']; ?>][address]" rows="5" placeholder="<?php echo $entry_address; ?>" id="input-address<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($ocd_multilang_data[$language['language_id']]) ? $ocd_multilang_data[$language['language_id']]['address'] : ''; ?></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-support">
                            <div class="panel-body">
                                <?php echo $help_support; ?>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
  $('#content-language a:first').tab('show');
</script>
<?php echo $footer; ?>