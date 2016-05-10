<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <?php if( !isset($license_error) ) { ?>
                <button type="submit" name="action" value="clean" form="form-clean" data-toggle="tooltip" title="<?php echo $button_clean; ?>" class="btn btn-default btn-danger"><i class="fa fa-eraser"></i> <?php echo $button_clean; ?></button>
                <button type="submit" name="action" value="save" onclick="beforeSave();" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i> <?php echo $button_save; ?></button>
                <button type="submit" name="action" value="save_and_close" onclick="beforeSave();" form="form" data-toggle="tooltip" title="<?php echo $button_save_and_close; ?>" class="btn btn-default"><i class="fa fa-save"></i> <?php echo $button_save_and_close; ?></button>
                <?php } else { ?>
                <a href="<?php echo $recheck; ?>" data-toggle="tooltip" title="<?php echo $button_recheck; ?>"class="btn btn-default" /><i class="fa fa-check"></i> <?php echo $button_recheck; ?></a>
                <?php } ?>
                <a href="<?php echo $close; ?>" data-toggle="tooltip" title="<?php echo $button_close; ?>" class="btn btn-default"><i class="fa fa-close"></i> <?php echo $button_close; ?></a>
            </div>
            <img width="36" height="36" style="float:left" src="view/image/ctrl.png" alt=""/>
            <h1><?php echo $heading_title_raw . " " . $ctrl_watermark_version; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
                    <li><a href="#tab-excludes" data-toggle="tab"><?php echo $tab_excludes; ?></a></li>
                    <li><a href="#tab-support" data-toggle="tab"><?php echo $tab_support; ?></a></li>
                    <li><a href="#tab-license" data-toggle="tab"><?php echo $tab_license; ?></a></li>
                </ul>
                <form action="<?php echo $clean; ?>" method="post" enctype="multipart/form-data" id="form-clean">
                    <input type="hidden" name="dummy" value="0" />
                </form>
                <form action="<?php echo $save; ?>" method="post" enctype="multipart/form-data" id="form">
                <div class="tab-content">
                    <div class="tab-pane active" id="tab-general">
                        <div class="form-group" style="display: inline-block; width:100%">
                            <div class="col-sm-5">
                                <label class="control-label" for="ctrl_watermark_status"><?php echo $entry_status; ?></label>
                                <br>
                                <?php echo $entry_status_desc; ?>
                            </div>
                            <div class="col-sm-7">
                                <select name="ctrl_watermark_status" id="ctrl_watermark_status" class="form-control">
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                    <option value="1" <?php if ($ctrl_watermark_status) { ?> selected="selected" <?php } ?> ><?php echo $text_enabled; ?></option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group" style="display: inline-block; width:100%">
                            <div class="col-sm-5">
                                <label class="control-label" for="draggable-zone"><?php echo $entry_image; ?></label>
                                <br/>
                                <?php echo $entry_watermark_desc; ?>
                            </div>
                            <div class="col-sm-7">
                                <input type="hidden" value="" id="tmp"/>
                                <input type="hidden" name="ctrl_watermark_image" value="<?php echo $ctrl_watermark_image; ?>" id="ctrl_watermark_image"/>
                                <input type="hidden" name="ctrl_watermark_top" value="<?php echo $ctrl_watermark_top; ?>" id="ctrl_watermark_top"/>
                                <input type="hidden" name="ctrl_watermark_left" value="<?php echo $ctrl_watermark_left; ?>" id="ctrl_watermark_left"/>
                                <input type="hidden" name="ctrl_watermark_width" value="<?php echo $ctrl_watermark_width; ?>" id="ctrl_watermark_width"/>
                                <input type="hidden" name="ctrl_watermark_height" value="<?php echo $ctrl_watermark_height; ?>" id="ctrl_watermark_height"/>
                                <input type="hidden" name="ctrl_watermark_angle" value="<?php echo $ctrl_watermark_angle; ?>" id="ctrl_watermark_angle"/>
                                <div id="draggable-zone" style="background:url(<?php echo $ctrl_watermark_product_image_thumb; ?>) 0 0 no-repeat">
                                    <div id="draggable-wrapper" style="width: <?php echo $ctrl_watermark_width*3; ?>px; height: <?php echo $ctrl_watermark_height*3; ?>px; left: <?php echo $ctrl_watermark_left*3; ?>px; top: <?php echo $ctrl_watermark_top*3; ?>px;">
                                        <div id="resizable-wrapper">
                                            <img id="ctrl_watermark_image_thumb" src="<?php echo $ctrl_watermark_image_root . 'image/' . $ctrl_watermark_image; ?>" width="<?php echo $ctrl_watermark_width*3; ?>" height="<?php echo $ctrl_watermark_height*3; ?>" alt="Водный знак"/>
                                        </div>
                                    </div>
                                </div>
                                <div style="margin-top:0.5em;width:300px;text-align: right">
                                    <button type="button" target="ctrl_watermark_image" class="button-image btn btn-primary"><i class="fa fa-pencil"></i> <?php echo $text_browse; ?></button>
                                    <button type="button" target="ctrl_watermark_image" class="button-clear btn btn-danger"><i class="fa fa-eraser"></i> <?php echo $text_clear; ?></button>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" style="display: inline-block; width:100%">
                            <div class="col-sm-5">
                                <label class="control-label" for="ctrl_watermark_hide_real_path"><?php echo $entry_hide_real_path; ?></label>
                                <br>
                                <?php echo $entry_hide_real_path_desc; ?>
                            </div>
                            <div class="col-sm-7">
                                <select name="ctrl_watermark_hide_real_path" id="ctrl_watermark_hide_real_path" class="form-control">
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                    <option value="1" <?php if ($ctrl_watermark_hide_real_path) { ?> selected="selected" <?php } ?> ><?php echo $text_enabled; ?></option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-excludes">
                        <div class="form-group" style="display: inline-block; width:100%">
                            <div class="col-sm-5">
                                <label class="control-label"><?php echo $entry_min_size; ?></label>
                                <br/>
                                <?php echo $entry_min_size_desc; ?>
                            </div>
                            <div class="col-sm-7">
                                <label class="control-label" for="ctrl_watermark_min_width"><?php echo $text_width; ?></label>
                                <input type="text" name="ctrl_watermark_min_width" value="<?php echo $ctrl_watermark_min_width; ?>" placeholder="<?php echo $text_min_width; ?>" id="ctrl_watermark_min_width" class="form-control">
                                <label class="control-label" for="ctrl_watermark_min_height"><?php echo $text_height; ?></label>
                                <input type="text" name="ctrl_watermark_min_height" value="<?php echo $ctrl_watermark_min_height; ?>" placeholder="<?php echo $text_min_height; ?>" id="ctrl_watermark_min_height" class="form-control">
                            </div>
                        </div>
                        <div class="form-group" style="display: inline-block; width:100%">
                            <div class="col-sm-5">
                                <label class="control-label"><?php echo $entry_max_size; ?></label>
                                <br/>
                                <?php echo $entry_max_size_desc; ?>
                            </div>
                            <div class="col-sm-7">
                                <label class="control-label" for="ctrl_watermark_max_width"><?php echo $text_width; ?></label>
                                <input type="text" name="ctrl_watermark_max_width" value="<?php echo $ctrl_watermark_max_width; ?>" placeholder="<?php echo $text_max_width; ?>" id="ctrl_watermark_max_width" class="form-control">
                                <label class="control-label" for="ctrl_watermark_max_height"><?php echo $text_height; ?></label>
                                <input type="text" name="ctrl_watermark_max_height" value="<?php echo $ctrl_watermark_max_height; ?>" placeholder="<?php echo $text_max_height; ?>" id="ctrl_watermark_max_height" class="form-control">
                            </div>
                        </div>
                        <div class="form-group" style="display: inline-block; width:100%">
                            <div class="col-sm-5">
                                <label class="control-label"><?php echo $entry_exclude; ?></label>
                                <br/>
                                <?php echo $entry_exclude_desc; ?>
                            </div>
                            <div class="col-sm-7">
                                <div class="well well-sm" style="height: 150px; overflow: auto;">
                                    <?php $class = 'odd'; ?>
                                    <?php foreach ($image_directories as $item) { ?>
                                    <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                    <div class="<?php echo $class; ?>">
                                        <input type="checkbox" name="ctrl_watermark_exclude[]" value="<?php echo $item['value']; ?>"<?php if (is_array($ctrl_watermark_exclude) && in_array($item['value'], $ctrl_watermark_exclude)) echo ' checked="checked"'; ?> />
                                        <?php echo $item['text']; ?>
                                    </div>
                                    <?php } ?>
                                </div>
                                <button type="button" onclick="$(this).parent().find(':checkbox').prop('checked', true);" class="btn btn-primary"><i class="fa fa-pencil"></i> <?php echo $text_select_all; ?></button>
                                <button type="button" onclick="$(this).parent().find(':checkbox').prop('checked', false);" class="btn btn-danger"><i class="fa fa-trash-o"></i> <?php echo $text_unselect_all; ?></button>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-support">
                        <div class="form-group col-sm-6">
                            <?php echo $module_support; ?>
                            <div class="col-sm-4" >
                                <label class="control-label" for="ctrl_watermark_debug"><?php echo $entry_debug; ?></label>
                                <br>
                                <?php echo $entry_debug_desc; ?>
                            </div>
                            <div class="col-sm-8">
                                <select name="ctrl_watermark_debug" id="ctrl_watermark_debug" class="form-control">
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                    <option value="1" <?php if ($ctrl_watermark_debug) { ?> selected="selected" <?php } ?> ><?php echo $text_enabled; ?></option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <?php echo $module_promo1; ?>
                        </div>
                        <div class="col-sm-3">
                            <?php echo $module_promo2; ?>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-license">
                        <?php echo $module_licence; ?>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">//<![CDATA[
    $(window).load(function(){
        var drWr = $('#draggable-wrapper');
        var elem = $('#ctrl_watermark_image_thumb');
        elem.resizable({
                aspectRatio: true,
                handles:     'ne, nw, se, sw'
            });
        $(".ui-resizable-ne")
                .css("width","20px").css("height","20px").css("right","-10px").css("top","-10px");
        $(".ui-resizable-nw")
                .css("width","20px").css("height","20px").css("left","-10px").css("top","-10px");
        $(".ui-resizable-se")
                .removeClass("ui-icon-gripsmall-diagonal-se")
                .removeClass("ui-icon")
                .css("width","20px").css("height","20px").css("right","-10px").css("bottom","-10px");
        $(".ui-resizable-sw")
                .css("width","20px").css("height","20px").css("left","-10px").css("bottom","-10px");

        drWr.draggable();

        elem.parent().rotatable({
            angle: <?php echo str_replace(",",".",$ctrl_watermark_angle * pi() / 180); ?>
        });
    });//]]>

    $('.button-image').on('click', function() {
        $('#modal-image').remove();

        $("#tmp").val("");
        $("#tmp").attr('target',$(this).attr('target'));
        $.ajax({
            url: 'index.php?route=common/filemanager&token=' + getURLVar('token') + '&target=tmp',
            dataType: 'html',
            beforeSend: function() {
                $('.button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
                $('.button-image').prop('disabled', true);
            },
            complete: function() {
                $('.button-image i').replaceWith('<i class="fa fa-upload"></i>');
                $('.button-image').prop('disabled', false);
                $('#modal-image').on('hide.bs.modal', function(){
                    if( $("#tmp").val() != "") {
                        var target = $("#tmp").attr('target');
                        $("#" + target).val($("#tmp").val());

                        if( target == "ctrl_watermark_image" ) {

                            $.ajax({
                              url: 'index.php?route=module/ctrl_watermark/getImgSize&token=<?php echo $token; ?>',
                              data: "src=" + $("#tmp").val(),
                              type: 'post',
                              dataType: 'json',
                              success: function(json) {   
                                    var rate, width, height;

                                    if (json["size"][0] > 130 || json["size"][1] > 130)
                                    {
                                        rate = (json["size"][0] > json["size"][1]) ? (json["size"][0]/130) : (json["size"][1]/130);
                                        width = Math.round(json["size"][0]/rate);
                                        height = Math.round(json["size"][1]/rate);
                                    }
                                    else
                                    {
                                        width = json["size"][0];
                                        height = json["size"][1];
                                    }


                                    $("#ctrl_watermark_image_thumb").css("width", width);
                                    $("#ctrl_watermark_image_thumb").css("height", height);

                                    $("#draggable-wrapper").css("width", width);
                                    $("#draggable-wrapper").css("height", height);

                                    $(".ui-wrapper").css("width", width);
                                    $(".ui-wrapper").css("height", height);
                              }
                            });  



                            $("#ctrl_watermark_image_thumb").attr('src', '<?php echo $ctrl_watermark_image_root ?>image/' + $("#tmp").val());
                        } else if ( target == "ctrl_watermark_product_image" ) {
                            $.ajax({
                                url: 'index.php?route=module/ctrl_watermark/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#tmp').val()),
                                dataType: 'text',
                                success: function(data) {
                                    $('#draggable-zone').css('background-image','url(' + data + ')');
                                }
                            });
                        }

                    }
                });
            },
            success: function(html) {
                $('body').append('<div id="modal-image" class="modal">' + html + '</div>');

                $('#modal-image').modal('show');
            }
        });
    });

    $('.button-clear').on('click', function() {
        $("#ctrl_watermark_image_thumb").attr('src', '/image/<?php echo $ctrl_watermark_default_image; ?>');
        $("#ctrl_watermark_image_thumb").css("width", <?php echo $ctrl_watermark_default_image_width*3; ?>);
        $("#ctrl_watermark_image_thumb").css("height", <?php echo $ctrl_watermark_default_image_height*3; ?>);

        $("#draggable-wrapper").css("left", <?php echo $ctrl_watermark_default_image_left*3; ?>);
        $("#draggable-wrapper").css("top", <?php echo $ctrl_watermark_default_image_top*3; ?>);
        $("#draggable-wrapper").css("width", <?php echo $ctrl_watermark_default_image_width*3; ?>);
        $("#draggable-wrapper").css("height", <?php echo $ctrl_watermark_default_image_height*3; ?>);

        $(".ui-wrapper").css("left", "auto");
        $(".ui-wrapper").css("top", "auto");
        $(".ui-wrapper").css("width", <?php echo $ctrl_watermark_default_image_width*3; ?>);
        $(".ui-wrapper").css("height", <?php echo $ctrl_watermark_default_image_height*3; ?>);

        $(".ui-wrapper").rotatable("angle",<?php echo str_replace(",",".",$ctrl_watermark_default_image_angle * pi() / 180); ?> );

        $("#ctrl_watermark_image").val('<?php echo $ctrl_watermark_default_image; ?>');
        $("#ctrl_watermark_left").val(<?php echo $ctrl_watermark_default_image_left; ?>);
        $("#ctrl_watermark_top").val(<?php echo $ctrl_watermark_default_image_top; ?>);
        $("#ctrl_watermark_width").val(<?php echo $ctrl_watermark_default_image_width; ?>);
        $("#ctrl_watermark_height").val(<?php echo $ctrl_watermark_default_image_height; ?>);
        $("#ctrl_watermark_angle").val(<?php echo $ctrl_watermark_default_image_angle; ?>);
    });

    function beforeSave(){
        var angle = ( $(".ui-wrapper").rotatable("ui").angle.current * 180 ) / Math.PI;
        if( !angle)
            angle = 0;
        while( angle < 0 )
            angle += 360;
        while( angle >= 360 )
            angle -= 360;
        $("#ctrl_watermark_angle").val(
                Math.ceil(angle));
        $("#ctrl_watermark_width").val(
                Math.ceil($("#resizable-wrapper .ui-wrapper").css('width').replace(/[^0-9]/gi,"") / 3 ) );
        $("#ctrl_watermark_height").val(
                Math.ceil($("#resizable-wrapper .ui-wrapper").css('height').replace(/[^0-9]/gi,"") / 3 ) );
        $("#ctrl_watermark_left").val(
                Math.ceil( ( Number( $("#draggable-wrapper").css('left').replace(/[^\-\.0-9]/gi,"") ) +
                Number( $(".ui-wrapper").css('left').replace(/[^\-\.0-9]/gi,"") ) ) / 3 ) );
        $("#ctrl_watermark_top").val(
                Math.ceil( ( Number( $("#draggable-wrapper").css('top').replace(/[^\-\.0-9]/gi,"") ) +
                             Number( $(".ui-wrapper").css('top').replace(/[^\-\.0-9]/gi,"") ) ) / 3 ) );


        return true;
    }
//--></script>

<?php echo $footer; ?>